<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/css1.css">
    <link rel="stylesheet" href="css/me.css">
    <link rel="stylesheet" href="lib/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/base.css">
    <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
</head>
<body>
<nav class="header">
    <div class="container clearfix">
        <div style="height: 100%">
            <div class="logo">
                <img src="https://s10.mogucdn.com/mlcdn/c45406/190102_088f4i166l4gkl08k297h5kk8690i_260x200.png" alt="" class="logo-image">
            </div>

            <ul class="header-menu">
                <li class="item"><span><a href="${pageContext.request.contextPath}/">主页</a></span></li>
                <li class="item active"><span><a href="${pageContext.request.contextPath}/show_cart">购物车</a></span></li>
                <li class="item"><span><a href="${pageContext.request.contextPath}/jsp/admin/admin_index.jsp">个人中心</a></span></li>
            </ul>
            <div class="btn-menu">
                <div class="service-label">
                    <div class="both-container">
                        <div class="label-container">
                            <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                            <a href="#" class="item1" style="opacity: 0"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                        </div>
                        <div class="service-list">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="goods-list">
    <ul class="list-shop_cart clearfix large-margin-top">
<c:forEach items="${good_list}" var="shop">
    <li style="position: relative">
        <div>
            <img src="${shop.getGood().getFirstImageAreaImages().get(0)}"
                 alt="">
        </div>
        <div>
            <div class="title">雪地靴男士短靴加绒加厚高帮棉鞋保暖马丁靴</div>
        </div>
        <div style="float: right">
            <div style="float: right">
                <span>单价:${shop.getGood().getPrice()}</span>
            </div>
            <div style="float: right">
                <span>数量:${shop.getNums()}</span>
            </div>
            <div style="float: right">
                <span>总合:${shop.getGood().getPrice()*shop.getNums()}</span>
            </div>
        </div>
        <div style="position: absolute;right: 0;bottom: 0">
            <form action="">
                <div class="inline fields">
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="choose" tabindex="0" class="hidden">
                            <label>选中</label>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="remove" tabindex="0" class="hidden">
                            <label>删除</label>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </li>
</c:forEach>

    </ul>
    <div class="ui segment grid">
        <div class="thirteen wide column">
            <div class="button-area">
                <div>
                    <form action="">
                        <input type="checkbox"> 全选
                    </form>
                </div>

                <div>
                    <span>删除</span>
                </div>
            </div>
        </div>
        <div class="three wide column">
            <div class="price-area">
                <div>
                    <span>共有12件商品</span>
                </div>
                <div>
                    <span>总计</span> <i class=""></i><span>937</span>
                </div>
                <div class="btn">
                    <button>去结算</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--<div class="content body">-->
<!--</div>-->
<jsp:include page="jsp/fragment/show-footer.jsp"></jsp:include>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<script src="js/swiper.js">
</script>


<script>
    $('.ui.radio.checkbox')
        .checkbox()
    ;
</script>
</body>
</html>