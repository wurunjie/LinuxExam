
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/28
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="three wide column  padding-top-no">
    <div class="my-menu">
        <c:choose>
            <c:when test="${sessionScope.request.user.getSeller()!=null}">
                <div class="menu-item ">
                    <h5 class="ui top  padded attached header clearfix">
                        商品管理
                        <i class="icon angle left"></i>
                    </h5>
                    <div class="my-list">

                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="${pageContext.request.contextPath}/good_to_input">商品新增</a></p>
                            </div>
                        </div>
                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="${pageContext.request.contextPath}/good_show">商品列表</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <div class="menu-item ">
            <h5 class="ui top  padded attached header clearfix">
                个人中心
                <i class="icon angle left"></i>
            </h5>
            <div class="my-list">

                <div class="ui attached padded orange inverted segment">
                    <div class="list-item">
                        <p><a href="/jsp/admin/personal_center.jsp">个人空间</a></p>
                    </div>
                </div>
                <div class="ui attached padded orange inverted segment">
                    <div class="list-item">
                        <p><a href="${pageContext.request.contextPath}/show_cart">购物车</a></p>
                    </div>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${sessionScope.request.user.getRole()==3}">
                <div class="menu-item ">
                    <h5 class="ui top  padded attached header clearfix">
                        分类管理
                        <i class="icon angle left"></i>
                    </h5>
                    <div class="my-list">

                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="${pageContext.request.contextPath}/type_show">分类列表</a></p>
                            </div>
                        </div>
                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="/jsp/admin/good_type_input.jsp">分类新增</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="menu-item ">
                    <h5 class="ui top  padded attached header clearfix">
                        标签管理
                        <i class="icon angle left"></i>
                    </h5>
                    <div class="my-list">

                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="${pageContext.request.contextPath}/tag_show">标签列表</a></p>
                            </div>
                        </div>
                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="${pageContext.request.contextPath}/to_input_tag">标签新增</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="menu-item ">
                    <h5 class="ui top  padded attached header clearfix">
                        订单管理
                        <i class="icon angle left"></i>
                    </h5>
                    <div class="my-list">

                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="${pageContext.request.contextPath}/admin/order_show">您购买的商品</a></p>
                            </div>
                        </div>
                        <div class="ui attached padded orange inverted segment">
                            <div class="list-item">
                                <p><a href="${pageContext.request.contextPath}/admin/order_show">您卖出的商品</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <div class="menu-item ">
            <h5 class="ui top  padded attached header clearfix">
                <a href="${pageContext.request.contextPath}/indexPage">返回主页</a>
            </h5>
        </div>
    </div>


</div>