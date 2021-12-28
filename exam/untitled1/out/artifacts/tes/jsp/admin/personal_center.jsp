<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/base.css">
    <link rel="stylesheet" href="../../css/admin.css">
</head>
<body>
<jsp:include page="../fragment/head.jsp"/>

<div class="ui grid attached">
    <jsp:include page="../fragment/left_menu.jsp"/>
    <div class="twelve wide column">
        <div class="ui  center aligned  segment ">
            <div class="top-area clearfix">
                <div class="head-icon">
                </div>
                <div class="tag-area">
                    <span><i class="female icon"></i></span>
                    <span class="nickname-area">奉先</span>
                    <span class="customer-lever">Lv 0</span>
                </div>
            </div>
        </div>
        <div class="ui segment grid vertical">
            <div class="twelve wide column">
                <div class="ui segment">
                    请在个人页面完善个人信息
                </div>
                <div class="ui segment">
                    <c:choose>
                        <c:when test="${msg !=null}">
                            <div class="ui segment">
                                    ${msg}
                            </div>
                        </c:when>
                    </c:choose>

                    
                    <c:choose>
                        <c:when test="${sessionScope.user.seller!=null}">
                                        <%--当是卖家的时候,显示下面的--%>
                            <div class="seller-detail massive-margin-top massive-margin-bottom clearfix padding-right-massive">
                                <div class="head-icon">
                                </div>
                                <div class="tag-area">

                                    <span class="nickname-area">商铺名称: ${sessionScope.user.seller.sellerName}</span>
                                    <br>
                                    <span class="customer-lever">商铺地址: ${sessionScope.user.seller.sellerAddr}</span>
                                    <br>
                                    <span class="nickname-area">商铺等级: Lv ${sessionScope.user.seller.sellerLevel}</span>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="ui text container massive-margin-top massive-margin-bottom not-seller">
                                <h1 class="ui  header">
                                    你还不是卖家
                                </h1>
                                <div class="ui huge primary button be-seller">成为卖家<i class="right arrow icon"></i></div>
                            </div>
                            <form class="ui large center aligned form middle grid large-margin-bottom large-margin-top "
                                  action="${pageContext.request.contextPath}/register_seller" method="post">
                                <div class="six wide column register-seller" style="display: none">
                                    <div class="ui vertical stacked segment"> '
                                        <h2 class="ui teal image header tiny-margin-bottom">
                                            <div class="content">
                                                商家注册
                                            </div>
                                        </h2>
                                        <div class="field tiny-margin-bottom">
                                            <div class="ui left icon input">
                                                <i class="user icon"></i>
                                                <input type="text" name="seller_name" placeholder="商家名称" value="">
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div class="ui left icon input">
                                                <i class="lock icon"></i>
                                                <input type="text" name="seller_addr" placeholder="商家地址" value="">
                                            </div>
                                        </div>
                                        <button class="ui fluid large teal submit button">注册</button>
                                    </div>
                                </div>

                                <div class="ui error message"></div>

                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="four wide column">
                <!-- 最新推荐 -->
                <div class="ui segments m-margin-large ">
                    <div class="ui secondary segment m-black inverted padded">
                        <i class="bookmark icon " style="color: rgba(255,255,255,.8)"></i>
                        <span style="color: rgba(255,255,255,.8)">用户详细信息</span>
                    </div>
                    <div class="ui  segment background-transparent">
                        <a href="/blog/147" target="_blank "
                           class="m-black m-text-thin "><i></i>用户 ID:</a>
                    </div>
                    <div class="ui  segment background-transparent">
                        <a href="/blog/70" target="_blank "
                           class="m-black m-text-thin "><i></i>昵称: 奉先</a>
                    </div>
                    <div class="ui  segment background-transparent">
                        <a href="/blog/44" target="_blank "
                           class="m-black m-text-thin "><i></i>等级 LV: 1</a>
                    </div>
                    <div class="ui  segment background-transparent">
                        <a href="/blog/35" target="_blank "
                           class="m-black m-text-thin "><i></i>注册时间: 2020-12-03</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<script src="../../js/admin.js"></script>
<script>
    $('.ui.dropdown').dropdown({
        on: 'hover'
    })
    $('.ui.tag.dropdown')
        .dropdown({
            allowAdditions: true
        })
    ;
    $('.be-seller').click(function () {
            $('.not-seller').css("display","none");
            $('.register-seller').css("display","block");
    })
</script>
</body>
</html>