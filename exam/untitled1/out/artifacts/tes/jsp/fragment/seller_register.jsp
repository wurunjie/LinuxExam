<%--
  Created by IntelliJ IDEA.
  User: greyzong
  Date: 2020/12/31
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="ui text container massive-margin-top massive-margin-bottom not-seller">
    <h1 class="ui  header">
        你还不是卖家
    </h1>
    <div class="ui huge primary button be-seller">成为卖家<i class="right arrow icon"></i></div>
</div>
<form class="ui large center aligned form middle grid large-margin-bottom large-margin-top "
      action="${pageContext.request.contextPath}/register_seller" method="post">
    <div class="six wide column register-seller" style="display: none">
        <div class="ui vertical stacked segment"> '
            <h2 class="ui teal image header tiny-margin-bottom">
                <div class="content">
                    商家注册
                </div>
            </h2>
            <div class="field tiny-margin-bottom">
                <div class="ui left icon input">
                    <i class="user icon"></i>
                    <input type="text" name="seller_name" placeholder="商家名称" value="">
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input type="password" name="seller_addr" placeholder="商家地址" value="">
                </div>
            </div>
            <button class="ui fluid large teal submit button">注册</button>
        </div>
    </div>

    <div class="ui error message"></div>

</form>
