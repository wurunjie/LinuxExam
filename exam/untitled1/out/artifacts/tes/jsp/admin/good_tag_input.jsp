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
        <div class="ui teal segment">
            <div class="middle-margin-top middle-margin-bottom">
                <div class="ui container">
                    <form action="${pageContext.request.contextPath}/tag_input" method="POST" class="ui form">
                        <div class="required field">
                            <div class="ui left labeled input">
                                <div class="ui selection  basic dropdown label compact">
                                    <input type="hidden" value="" name="type_id">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">商品分类</div>
                                    <div class="menu">
                                        <c:forEach items="${type_list}" var="t">
                                            <div class="item" data-value="${t.getTypeId()}">${t.getTypeName()}</div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <input type="text" name="tag_name" placeholder="标签名" value="">
                            </div>
                        </div>

                        <div class="ui error message"></div>


                        <div class=" ui right aligned container">
                            <button type="button" class=" ui button" onclick="window.history.go(-1)"
                                    style="background-color: white !important;">返回
                            </button>
                            <button class="ui teal submit button">提交</button>
                        </div>
                    </form>
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