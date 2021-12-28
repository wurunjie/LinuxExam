<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <div></div>
     <meta charset="UTF-8">
     <title>登录</title>
     <link rel="stylesheet" href="css/regist.css">
 </head>
 <body>
      <div class="header clearfix">
          <h1 style="color:#FF3860;font-family: 幼圆;margin-left:100px;display: inline-block;font-size: 3em">蘑菇街</h1>
          <div class="comment"><span>依《网络安全法》相关要求，即日起蘑菇街会员登陆需绑定手机。
              为保障您的账户安全及正常使用，如您尚未绑定，请尽快完成绑定，感谢您的理解和支持!</span></div>
      </div>

      <div class="content-area clearfix">
          <div class="regist-area ">
              <form action="${pageContext.request.contextPath}/login" method="post">
                 <span style="color: #FE4461;font-size: 30px;margin-top: 150px;font-family: 幼圆;"><strong>登录到账号</strong></span>
               <div class="userName">
                  <input placeholder="请输入账号" style="padding: 0em 1em 0em 1em" type="text" name="username"></div>
                <div class="pwd">
                    <input placeholder="请输入密码" style="padding: 0em 1em 0em 1em" type="text" name="password"></div>
                <div class="login">
                    <button>登录</button>
                </div>
                  <input type="hidden" value="${origin}" name="origin">
               <div class="regist" ><a href="${pageContext.request.contextPath}/register.jsp" style="color: black;text-decoration: none">注册账号</a></div>
              </form>
          </div>
      </div>
      <div class="bottom clearfix">
          <ul>
              <li style="margin-left: 43%">关于我们</li>
              <li>商家入驻</li>
              <li>商家后台</li>
          </ul>
          <div class="logo">
              <span style="font-size: 15px;color: #BBBBCA;">
               &copy 2020恒洁雨馨小组</span>
          </div>
      </div>

</body>
</html>