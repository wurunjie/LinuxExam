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
            <div class="m-padding-tb-supermassive m-container-small ">
                <div class="container">

                    <table class="ui teal compact table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="content">
                        <c:forEach items="${type_list}" var="t">
                        <tr>

                            <td>${t.getTypeId()}</td>
                            <td>${t.getTypeName()}</td>
                            <td>
                                <a href="/admin/types/22/input" class="ui mini purple button basic">编辑</a>
                                <a href="/admin/types/22/delete" class="ui mini red button basic">删除</a>
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