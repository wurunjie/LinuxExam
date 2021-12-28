<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品</title>
    <link rel="stylesheet" href="css/list.css">
    <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
</head>
<body>
<div class="header clearfix">
    <ul>
        <li>关于我们</li>
        <li>我的订单</li>
        <li>商城</li>
        <li>首页</li>
    </ul>
</div>
<div class="title">
    <img src="img/mogu.png" alt="">
</div>
<div class="content">
    <div class="left clearfix">
        <img src="${good.getFirstImageAreaImages().get(0)}" alt="">
    </div>
    <div class="right">
        <div class="title"><span><strong>${good.getGoodTitle()}</strong></span></div>
        <div class="information">
            <span >价格: </span><span>${good.getPrice()}</span><br>
            <span >累计销量:</span><span>${good.getSellCount()}</span>
            <div class="describe-area">
                    <span >推荐理由:</span>
                <span style="color: red;font-size: 1.5em">${good.getDescribe()}</span>
            </div>
        </div>
        <div style="padding: 0 2.5em 0 2.5em ">
            <button class="ui red button by">立即购买</button>
            <a href="${pageContext.request.contextPath}/add_to_shop_cart?id=${good.getGoodId()}"> <button class="ui  button car">加入购物车</button></a>
        </div>
    </div>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
</body>
</html>