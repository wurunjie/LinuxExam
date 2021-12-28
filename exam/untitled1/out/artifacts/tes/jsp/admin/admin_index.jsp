<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../../css/base.css">
  <link rel="stylesheet" href="../../css/admin.css">
</head>
<body>
  <jsp:include page="../fragment/head.jsp"/>

  <div class="ui grid attached">
    <jsp:include page="../fragment/left_menu.jsp"/>
      <div class="twelve wide column">
        <div class="ui teal inverted center aligned segment ">
          欢迎进入后台管理系统
        </div>
      </div>
  </div>



  <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
  <script src="../../js/admin.js"></script>
</body>
</html>