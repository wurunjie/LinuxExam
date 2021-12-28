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
        <div class="ui segment vertical">
            <div class="ui padded vertical segment">
                <form action="${pageContext.request.contextPath}/tag_show">
                    <div class="inline fields ">
                        <div class="field">
                            <div class="ui input">
                                <input type="text" placeholder="标签名称" name="tag_name">
                            </div>
                        </div>
                        <div class="field large-margin-left">
                            <div class="ui labeled action input">
                                <div class="ui type selection dropdown">
                                    <input type="hidden" name="type_id">
                                    <!-- 暂存选中的下拉框的值的一个元素 -->
                                    <i class="dropdown icon"></i>
                                    <div class="default text">分类</div>
                                    <div class="menu">
                                        <c:forEach items="${type_list}" var="t">
                                            <div class="item" data-value="${t.getTypeId()}">${t.getTypeName()}</div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <button class="ui compact button" id="clear-btn">clear</button>
                            </div>
                        </div>
                        <div class="field large-margin-left">
                            <button class="ui inverted large green button">搜索</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="m-padding-tb-supermassive m-container-small ">
                <div class="container">

                    <table class="ui teal compact table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>标签名称</th>
                            <th>所属分类</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="content">
                        <c:forEach items="${tag_list}" var="ta" >
                        <tr>
                            <td>${ta.getGoodTagId()}</td>
                            <td>${ta.getTagName()}</td>
                            <td>${ta.getGoodType().getTypeName()}</td>
                            <td>
                                <a href="/admin/types/23/input" class="ui mini purple button basic">编辑</a>
                                <a href="/admin/types/23/delete" class="ui mini red button basic">删除</a>
                            </td>
                        </tr>
                        </c:forEach>

                        <tfoot>
                        <tr>
                            <th colspan="6">
                                <div class="ui mini pagination menu" id="parent">

                                    <a class="item" id="nextPage">下一页</a>
                                </div>
                                <a href="/admin/types/input" class="ui purple right floated button mini basic">新增</a>
                            </th>
                        </tr>
                        </tfoot>
                    </table>
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
</script>
</body>
</html>