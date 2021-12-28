<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品</title>
    <link rel="stylesheet" href="css/css1.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/me.css">
    <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
</head>
<body>
<div class="head-title clearfix">
    <ul>
        <li>关于我们</li>
        <li>我的订单</li>
        <li>商城</li>
        <li>首页</li>
    </ul>
</div>
<div class="container">
    <form action="${pageContext.request.contextPath}/good_tag_list" method="get">
    <div class="content_head">
        <h1 style="color:#FF3860;font-family: 幼圆;display: inline-block"><strong>蘑菇街</strong></h1>
        <span style="margin-left: 20px;display: inline-block">${type.getTypeName()} <input type="hidden" name="type_id" value="${type.getTypeId()}"></span>
        <div class="logo-area">
            <div class="icon-area">
                <img src="https://s10.mogucdn.com/mlcdn/c45406/181016_22cba5f6a88gdl2gf42i14hj7flk8_48x46.png"
                     alt="">
            </div>
            <div class="text-area">
                <span><a href="${pageContext.request.contextPath}/show_cart">购物车</a></span>
            </div>
        </div>

        <c:choose>
            <c:when test="${sessionScope.user==null}">
                <div class="logo-area">
                    <div class="icon-area">
                        <img src="https://s10.mogucdn.com/mlcdn/c45406/181016_143l3ehl4ebad6c2326gjk6d4h41g_48x48.png"
                             alt="">
                    </div>
                    <div class="text-area">
                        <span><a href="${pageContext.request.contextPath}/login.jsp">登录</a></span>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="logo-area">
                    <div class="icon-area">
                        <img src="https://s10.mogucdn.com/mlcdn/c45406/181016_143l3ehl4ebad6c2326gjk6d4h41g_48x48.png"
                             alt="">
                    </div>
                    <div class="text-area">
                        <span>${sessionScope.user.getNickName()}</span>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="logo-area">
            <div class="icon-area">
                <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F01%2F47%2F98%2F7457440cdd332cf.jpg&refer=http%3A%2F%2Fbpic.588ku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612664235&t=6b37d0072e581d2398713c739bec003a"
                     alt="" style="width:46px;height: 46px ">
            </div>
            <div class="text-area">
                <span><a href="${pageContext.request.contextPath}/indexPage">返回</a></span>
            </div>
        </div>
    </div>
<%--需要一个隐藏域存放当前的tag--%>
        <input type="hidden" value="${tag}" name="tag_id">
    <div class="top_list clearfix">
        <ul>
            <c:forEach items="${tags}" var="tag">
                <li><a href="${pageContext.request.contextPath}/good_tag_list?type_id=${type.getTypeId()}&tag_id=${tag.getGoodTagId()}">${tag.getTagName()}</a> </li>
            </c:forEach>
        </ul>
    </div>
    <%--          <div class="top_list clearfix">--%>
    <%--              <ul>--%>
    <%--                  <li>上衣</li>--%>
    <%--                  <li>裙子</li>--%>
    <%--                  <li>裤子</li>--%>
    <%--                  <li>内衣</li>--%>
    <%--                  <li>鞋子</li>--%>
    <%--                  <li>包包</li>--%>
    <%--                  <li>母婴</li>--%>
    <%--                  <li>家具</li>--%>
    <%--              </ul>--%>
    <%--          </div>--%>

        <div class="goods clearfix">
            <c:forEach items="${goods.getResults()}" var="good">
                <div  class="good-item">
                    <div class="img-area">
                        <a href="${pageContext.request.contextPath}/show_detail?id=${good.getGoodId()}"><img src="${good.getFirstImageAreaImages().get(0)}" alt=""></a>
                    </div>
                    <div class="detail-area" style="position:absolute;bottom: 0">
                        <a href=""><div class="title">${good.getGoodTitle()}</div></a>
                        <div style="padding: 1em 0em 1em 0em;">
                            <span style="margin-right: 2em;font-weight: 700;font-size: 16px">￥&nbsp;&nbsp;${good.getPrice()}</span>
                            <span>销量： ${good.getSellCount()}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
        <footer class="ui vertical   segment center aligned massive-margin-top">
            <input type="hidden" name="page" value="${goods.getNum()}">
            <div class="page-controller massive-margin-top">
                <div class="ui buttons">
                    <c:choose>
                        <c:when test="${!goods.isFirst()}">
                            <%--                                如果是第一页就不显示，否则就显示--%>
                            <div class="ui button before-page"><i class="angle left icon"></i></div>
                        </c:when>
                    </c:choose>
                    <%--                        我们这里默认显示的方式是前面显示5页,后面显示2页--%>
                    <c:choose>
                        <c:when test="${goods.beforeLeastFive()}">
                            <%--                                如果前面有5页的话--%>
                            <c:forEach begin="${goods.getNum()-5}" end="${goods.getNum()-1}" var="i">
                                <div class="ui button page"><input type="hidden" value="${i}">${i}</div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <%--                                如果前面没有五页的话,就将前面的全部显示出来--%>
                            <c:forEach begin="1" end="${goods.getNum()-1}" var="i">
                                <div class="ui button page"><input type="hidden" value="${i}">${i}</div>
                            </c:forEach>

                        </c:otherwise>
                    </c:choose>

                    <div class="ui button page"><input type="hidden" value="${goods.getNum()}">${goods.getNum()}</div>

                    <c:choose>
                        <c:when test="${goods.backLeastTwo()}">
                            <%--                                如果后面有2页的话--%>
                            <c:forEach begin="${goods.getNum()+1}" end="${goods.getNum()+2}" var="i">
                                <div class="ui button page"><input type="hidden" value="${i}">${i}</div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <%-- 如果前面没有五页的话,就将前面的全部显示出来--%>
                            <c:forEach begin="${goods.getNum()+1}" end="${goods.getTotalPages()}" var="i">
                                <div class="ui button page"><input type="hidden" value="${i}">${i}</div>
                            </c:forEach>

                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${!goods.isLast()}">
                            <%--                                如果是最后一页就不显示，否则就显示--%>
                            <div class="ui button  next-page"><i class="angle right icon"></i></div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </footer>
    </form>
</div>
<jsp:include page="jsp/fragment/show-footer.jsp"></jsp:include>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<script>
    $(function () {
        $('.page-controller .buttons .page').click(function () {
            //    当分页的按钮点击了以后，修改隐藏域的值
            $('input[name=page]').val($(this).children()[0].value)
            $('form').submit();
        })
        $('.page-controller .buttons .before-page').click(function () {
            //    当分页的按钮点击了以后，修改隐藏域的值
            console.log($('input[name=page]').val())
            $('input[name=page]').val(parseInt($('input[name=page]').val()) - 1)
            console.log($('input[name=page]').val());
            $('form').submit();
        })
        $('.page-controller .buttons .next-page').click(function () {
            //    当分页的按钮点击了以后，修改隐藏域的值
            // console.log($('input[name=page]').val())
            $('input[name=page]').val(parseInt($('input[name=page]').val()) + 1)
            console.log($('input[name=page]').val());
            $('form').submit();
        })
    })
</script>
</body>
</html>