package main.java.utils;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Dbutils {

	//将数据库连接  需要使用的  驱动地址、连接地址、用户名、密码作为常量使用   修改的时候 按需修改
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC";
	private static final String NAME = "root";
	private static final String PWD = "QWEqwe334455;";
	//声明数据库  需要使用的三个对象    连接对象、预编译sql的对象、存储结果的结果集对象
	private static Connection con = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	//1、加载驱动    使用静态代码块  
	static{
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//2、获取数据库连接   不希望其他包中，非子类使用到Dbutils 中的方法  这里可以使用protected 修饰
	protected static void getConnection(){
		//普通jdbc连接方式
		try {
			con = DriverManager.getConnection(URL, NAME, PWD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//使用jndi 进行连接
/*		try {
			Context context = new InitialContext();
			//读取context.xml文件中name 为jdbc/shopping 对应的资源
			DataSource ds = (DataSource) context
					.lookup("java:comp/env/jdbc/shopping");
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}
	//3.关闭连接的方法
	protected static void closeAll(){
		if(null!=rs){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(null!=ps){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(null!=con){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	//4、查询的方法
	protected static ResultSet executeQuery(String sql,Object[] obj){
		getConnection();
		try {
			ps = con.prepareStatement(sql);
			if(null!=obj){  //obj  不为空   需要进行sql  拼接
				for(int i=0;i<obj.length;i++){
					ps.setObject(i+1, obj[i]);
				}
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

//	测试方法
	protected static ResultSet executeQueryNoConnection(String sql,Object[] obj){
		try {
			ps = con.prepareStatement(sql);
			if(null!=obj){  //obj  不为空   需要进行sql  拼接
				for(int i=0;i<obj.length;i++){
					ps.setObject(i+1, obj[i]);
				}
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	//5.公共的  增、删、改方法
	protected static int executeUpdate(String sql,Object[] obj){
		int count = 0;//默认情况下   计数器为0   如果操作了数据count 值会变化
		beginTransaction();//开启事务   调用开启事务的方法（包含获取连接、关闭自动提交功能）
		try {
			ps = con.prepareStatement(sql);
			//如果obj 对象为空  认为  sql 文是完整的  不需要拼接   直接运行     
			if(null!=obj){  //obj  不为空   需要进行sql  拼接
				for(int i=0;i<obj.length;i++){
					ps.setObject(i+1, obj[i]);
				}
			}
			//执行sql 语句
			count = ps.executeUpdate();
		//提交事务   由于事务自动提交功能关闭了   我们需要人为控制
		commit();
		} catch (SQLException e) {
			System.out.println(e);
			rollback();
			//throw new ServiceException("数据操作失败!",e);
		}finally{//关闭连接
			closeAll();
		}
		return count;
	}



	//5.不适用事务的  增、删、改方法
	protected static int executeUpdateNoTransaction(String sql,Object[] obj) throws SQLException {
		int count = 0;//默认情况下   计数器为0   如果操作了数据count 值会变化

			ps = con.prepareStatement(sql);
			//如果obj 对象为空  认为  sql 文是完整的  不需要拼接   直接运行
			if(null!=obj){  //obj  不为空   需要进行sql  拼接
				for(int i=0;i<obj.length;i++){
					ps.setObject(i+1, obj[i]);
				}
			}
			//执行sql 语句
			count = ps.executeUpdate();

		return count;
	}


	//5.插入一条数据返回主键
	protected static int executeUpdateGetPrimary(String sql,Object[] obj){
		int count = -1;//默认情况下   计数器为0   如果操作了数据count 值会变化
		beginTransaction();//开启事务   调用开启事务的方法（包含获取连接、关闭自动提交功能）
		try {
			System.out.println(sql);
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			//如果obj 对象为空  认为  sql 文是完整的  不需要拼接   直接运行
			if(null!=obj){  //obj  不为空   需要进行sql  拼接
				for(int i=0;i<obj.length;i++){
					ps.setObject(i+1, obj[i]);
				}
			}
			//执行sql 语句
			ps.executeUpdate();
			ResultSet key = ps.getGeneratedKeys();
			if (key.next()) {
//				如果插入成功就会进入这里
//				获取所有插入主键中的第一个
//				如果没有插入成功count就是-1
				count=key.getInt(1);
			}
			//提交事务   由于事务自动提交功能关闭了   我们需要人为控制
			commit();
		} catch (SQLException e) {
			rollback();
			//throw new ServiceException("数据操作失败!",e);
		}finally{//关闭连接
			closeAll();
		}
		return count;
	}

	//5.插入一条数据返回主键，同时不进行异常处理，不开启事务
	protected static int executeUpdateGetPrimaryNoTransaction(String sql,Object[] obj) throws SQLException {
			int count = -1;//默认情况下   计数器为0   如果操作了数据count 值会变化

			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			//如果obj 对象为空  认为  sql 文是完整的  不需要拼接   直接运行
			if(null!=obj){  //obj  不为空   需要进行sql  拼接
				for(int i=0;i<obj.length;i++){
					ps.setObject(i+1, obj[i]);
				}
			}
			//执行sql 语句
			ps.executeUpdate();
			ResultSet key = ps.getGeneratedKeys();
			if (key.next()) {
//				如果插入成功就会进入这里
//				获取所有插入主键中的第一个
//				如果没有插入成功count就是-1
				count=key.getInt(1);
			}

		return count;
	}





	//6.开启事务
	protected static void beginTransaction(){
		getConnection();
		//关闭自动提交的功能
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	//7.提交事务
	protected static void commit(){
		try {
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	//8.回滚事务
	protected static void rollback(){
		try {
			con.rollback();
			con.setAutoCommit(true);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}
