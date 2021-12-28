<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/me.css">
    <link rel="stylesheet" href="lib/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/base.css">
</head>
<body>
<nav class="header">
    <div class="container clearfix">
        <div style="height: 100%">
            <div class="logo">
                <img src="https://s10.mogucdn.com/mlcdn/c45406/190102_088f4i166l4gkl08k297h5kk8690i_260x200.png" alt="" class="logo-image">
            </div>

            <ul class="header-menu">
                <li class="item active"><span><a href="${pageContext.request.contextPath}/">主页</a></span></li>
                <li class="item"><span><a href="${pageContext.request.contextPath}/show_cart">购物车</a></span></li>
                <c:choose>
                    <c:when test="${sessionScope.request.user!=null}">
                        <li class="item"><span><a href="${pageContext.request.contextPath}/jsp/admin/admin_index.jsp">个人中心</a></span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="item"><span><a href="${pageContext.request.contextPath}/login.jsp">个人中心</a></span></li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <div class="btn-menu">
                <div class="service-label">
                    <div class="both-container">
                        <div class="label-container">
                            <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                            <a href="#" class="item1"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                            <a href="#" class="item2"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
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


<div class="type-container">
    <ul class="type-list">
        <c:forEach items="${all_type}" var="ty">
            <li><a href="${pageContext.request.contextPath}/good_tag_list?type_id=${ty.getTypeId()}">${ty.getTypeName()}</a></li>
        </c:forEach>
    </ul>
</div>

<c:forEach items="${type_list}" var="ty">
    <div class="content">
        <div class="arrow left-arrow">
            <i class="fa fa-chevron-left" aria-hidden="true" style="font-size: 100px;"></i>
        </div>
        <div class="arrow right-arrow">
            <i class="fa  fa-chevron-right" aria-hidden="true" style="font-size: 100px"></i>
        </div>
        <div class="fluid-container">
            <div class="head">
                <h1 style="text-align: center;font-family:monospace;color: grey">${ty.getTypeName()}</h1>
            </div>
            <div class="type-container">
                <ul class="types">
                    <c:forEach items="${ty.getGoodTagsList()}" var="ta">
                        <li>${ta.getTagName()}</li>
                    </c:forEach>
                </ul>
            </div>
            <!--    一个轮播图 有两个页面-->
            <div class="container pages">
                <ul class="scroll-pic-pages">
                    <c:forEach begin="10" end="14" var="q">
                        <li>
                            <div class="tag-area">
                                <div class="img-area-item">
                                    <img src="${ty.getGoodTagsList().get(0).getGoodsList().get(q).getFirstImageAreaImages().get(0)}" alt="">
                                    <div class="mask">

                                    </div>
                                    <div class="mask-play">
                                        <i class="fa fa-play-circle-o"></i>
                                    </div>
                                </div>

                                <div class="title"><span>${ty.getGoodTagsList().get(0).getGoodsList().get(q).getGoodTitle()}</span></div>
                                <div><span>销量: ${ty.getGoodTagsList().get(0).getGoodsList().get(q).getSellCount()}</span></div>
                            </div>

                        </li>
                    </c:forEach>
                    <c:forEach items="${ty.getGoodTagsList().get(0).getGoodsList()}" var="good">
                        <li>
                            <div class="tag-area">
                            <div class="img-area-item">
                                <img src="${good.getFirstImageAreaImages().get(0)}" alt="">
                                <div class="mask">

                                </div>
                                <div class="mask-play">
                                    <i class="fa fa-play-circle-o"></i>
                                </div>
                            </div>
                            <div class="title"><span>${good.getGoodTitle()}</span></div>
                            <div><span>销量: ${good.getSellCount()}</span></div>
                            </div>
                        </li>
                    </c:forEach>
                    <c:forEach begin="0" end="4" var="i">
                        <li>
                            <div class="tag-area">
                                <div class="img-area-item">
                                    <img src="${ty.getGoodTagsList().get(0).getGoodsList().get(i).getFirstImageAreaImages().get(0)}" alt="">
                                    <div class="mask">

                                    </div>
                                    <div class="mask-play">
                                        <i class="fa fa-play-circle-o"></i>
                                    </div>
                                </div>

                                <div class="title"><span>${ty.getGoodTagsList().get(0).getGoodsList().get(i).getGoodTitle()}</span></div>
                                <div><span>销量: ${ty.getGoodTagsList().get(0).getGoodsList().get(i).getSellCount()}</span></div>
                            </div>

                        </li>
                    </c:forEach>
                </ul>
            </div>
            <ul class="point-join">
                <li href="#" class="active"></li>
                <li href="#"></li>
                <li href="#"></li>
            </ul>
        </div>
    </div>
</c:forEach>

<jsp:include page="jsp/fragment/show-footer.jsp"></jsp:include>
<script src="js/swiper.js">
</script>
</body>
</html>