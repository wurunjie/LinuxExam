<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/base.css"/>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/regist.css">
</head>
<body>
<div class="header clearfix">
    <h1 style="color:#FF3860;font-family: 幼圆;margin-left:100px;display: inline-block;font-size: 3em">蘑菇街</h1>
    <div class="comment"><span>依《网络安全法》相关要求，即日起蘑菇街会员登陆需绑定手机。
              为保障您的账户安全及正常使用，如您尚未绑定，请尽快完成绑定，感谢您的理解和支持!</span></div>
</div>
<div class="container-back">
    <div class="form-area">
        <div class="ui middle  center aligned grid">
            <div class="four wide column" style="margin-left: 96em!important;">
                <form class="ui large form middle" action="${pageContext.request.contextPath}/register" method="post">
                    <div class="ui stacked segment ">
                        <h2 class="ui pink image header tiny-margin-bottom">
                            <div class="content">
                                注册
                            </div>
                        </h2>
                        <div class="field tiny-margin-bottom">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="username" placeholder="用户名" value="">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" placeholder="密码" value="">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="id card icon"></i>
                                <input type="text" name="id-card" placeholder="身份证号" value="">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="phone volume icon"></i>
                                <input type="text" name="phone" placeholder="电话号码" value="">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user md icon"></i>
                                <input type="text" name="nickname" placeholder="昵称" value="">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="text" name="birth" placeholder="生日   例:2001-02-02" value="">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="text" name="age" placeholder="年龄" value="">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui form">
                                <div class="inline fields">
                                    <label>选择你的性别：</label>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="sex" value="0" checked="" tabindex="0" class="hidden">
                                            <label>男</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="sex" value="1" tabindex="0" class="hidden">
                                            <label>女</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button class="ui fluid large pink submit button">注册</button>
                    </div>

                    <c:choose>
                        <c:when test="${requestScope.msg!=null}">
                            <div class="ui success message">
                                <i class="close icon"></i>
                                <div class="header">
                                        ${msg}
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<script>
    $('.ui.radio.checkbox')
        .checkbox()
    ;
    $('.message .close')
        .on('click', function() {
          $(this)
              .closest('.message')
              .transition('fade')
          ;
        })
    ;
</script>
</body>
</html>