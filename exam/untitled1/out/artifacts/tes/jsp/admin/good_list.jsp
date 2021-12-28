<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台系统管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/base.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
</head>
<body>

<jsp:include page="../fragment/head.jsp"/>


<div class="ui grid attached">
    <jsp:include page="../fragment/left_menu.jsp"/>
    <div class="thirteen wide column">
        <form action="${pageContext.request.contextPath}/good_show" method="post">
        <div class="ui segment vertical center aligned">
            <c:choose>
                <c:when test="${msg!=null}">
                    <div class="ui segment">
                            ${msg}
                    </div>
                </c:when>
            </c:choose>

                <div class="inline fields ">
                    <div class="field">
                        <div class="ui input">
                            <input type="text" placeholder="商品名称" name="good_name" value="${good_name}">
                        </div>
                    </div>
                    <div class="field large-margin-left ">
                        <div class="ui labeled action input ">
                            <div class="ui type selection dropdown">
                                <input type="hidden" name="type_id" value="${type_id}">
                                <!-- 暂存选中的下拉框的值的一个元素 -->
                                <i class="dropdown icon"></i>
                                <div class="default text">分类</div>
                                <div class="menu type-btn">
                                    <c:forEach items="${types}" var="ty">
                                        <div class="item" data-value="${ty.getTypeId()}">${ty.getTypeName()}</div>
                                    </c:forEach>
                                    <!--                            <div class="item" data-value="2">开发者手册</div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field tag-list large-margin-left">
                        <div class="ui labeled action input">
                            <div class="ui type selection dropdown">
                                <input type="hidden" name="tag_id" value="${tag_id}">
                                <!-- 暂存选中的下拉框的值的一个元素 -->
                                <i class="dropdown icon"></i>
                                <div class="default text">标签</div>
                                <div class="menu">
                                    <!--                            <div class="item" data-value="2">开发者手册</div>-->
                                </div>
                            </div>
                            <button class="ui compact button" id="clear-btn">clear</button>
                        </div>
                    </div>
                    <div class="field large-margin-left">
                        <button class="ui inverted large green button search" type="button">搜索</button>
                    </div>
                </div>


        </div>
        <div class="ui segment vertical grid large-margin-top">
            <c:forEach items="${goods.getResults()}" var="go">
                <div class="two wide column">
                    <div class="good">
                        <div class="img-area">
                            <c:choose>
                                <c:when test="${go.getFirstImageAreaImages().size()!=0 }">
                                    <img src="${go.getFirstImageAreaImages().get(0)}" alt="">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3023045797,2628106807&fm=26&gp=0.jpg"
                                         alt="">
                                </c:otherwise>
                            </c:choose>
                            <span class="good-title">${go.getGoodTitle()}</span>
                        </div>
                        <div class="goods-detail grid">

                            <span class="sell-num">销量 : ${go.getSellCount()}</span> <br>
                            <span class="seller-name">${go.getSeller().getSellerName()}</span>
                            <span class="good-spend"></span>
                        </div>
                        <div class="inline fields">
                            <div class="field">
                                <button class="ui mini  inverted secondary button">
                                    <a href="${pageContext.request.contextPath}/update?id=${go.getGoodId()}">编辑</a>
                                </button>
                            </div>
                            <div class="field">
                                <button class="ui mini   button">
                                    <a href="${pageContext.request.contextPath}/delete?id=${go.getGoodId()}">删除</a>
                                </button>
                            </div>
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
</div>


<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<script src="../../js/admin.js"></script>
<script>
    $('.ui.dropdown').dropdown({
        on: 'hover'
    })
    $(function () {
        $('.type-btn').blur(function () {
            //    触发AJAX函数
            var data3 = {
                "type_id" : $('input[name=type_id]').val()
            };
            var data4=JSON.stringify(data3);
            $.post({
                url: "http://localhost:8080/ajax_tag",

                contentType : 'application/json;charset=utf-8',
                //设置了以后表示发送的是json字符串格式的数据
                // 如果不设置contentType，发送的就可以是对象
                // 前端如果想传Json字符串就只能设置这个，不然默认的是只能传对象


                dataType:"json",
                //这里dataType指的是返回值的类型，对返回的data会进行反序列化，自动调用JSON.parse()方法
                data: data4,
                success: function (data) {
                    //清除当前标签列表中的所有标签
                    $('.tag-list .menu').empty();
                    for (let i = 0; i < data.length; i++) {
                        $('.tag-list .menu').append(`<div class="item" data-value="`+data[i].goodTagId+`">`+data[i].tagName+`</div>`);
                    }
                }
            })
        })
        $('.page-controller .buttons .page').click(function () {
        //    当分页的按钮点击了以后，修改隐藏域的值
            $('input[name=page]').val($(this).children()[0].value)
            $('form').submit();
        })
        $('.page-controller .buttons .before-page').click(function () {
            //    当分页的按钮点击了以后，修改隐藏域的值
            console.log($('input[name=page]').val())
            $('input[name=page]').val(parseInt($('input[name=page]').val())-1)
            console.log($('input[name=page]').val());
            $('form').submit();
        })
        $('.page-controller .buttons .next-page').click(function () {
            //    当分页的按钮点击了以后，修改隐藏域的值
            // console.log($('input[name=page]').val())
            $('input[name=page]').val(parseInt($('input[name=page]').val())+1)
            console.log($('input[name=page]').val());
            $('form').submit();
        })
        $('.search').click(function () {
            $('input[name=page]').val(1)
            $('form').submit();
        })
    })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>