<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="title" content="0">
    <link href="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/base.css">
    <link rel="stylesheet" href="../../css/admin.css">
</head>
<body>
<jsp:include page="../fragment/head.jsp"/>

<div class="ui grid attached">
    <jsp:include page="../fragment/left_menu.jsp"/>
    <div class="twelve wide column">
        <div class="ui vertical center aligned segment ">
            <form class="ui form" action="${pageContext.request.contextPath}/good_input" method="post">
                <input type="hidden" name="good_id" value="${good.getGoodId()}">
                <div class="two fields">
                    <div class="required field">
                        <div class="ui left labeled input">
                            <label class="ui teal basic label">商品名称</label>
                            <input type="text" name="good_name" placeholder="商品名称" value="${good.getGoodTitle()}">
                        </div>
                    </div>
                    <div class="required field">
                        <div class="two fields">
                            <div class=" required field">
                                <div class="ui left labeled action input">
                                    <label class="ui compact teal basic label">类别</label>
                                    <div class="ui tag selection basic   search dropdown fluid">
                                        <input type="hidden" name="type_id" value="${good.getGoodTag().getGoodType().getTypeId()}">
                                        <i class="dropdown icon"></i>
                                        <div class="default text">分类</div>
                                        <div class="menu">
                                            <c:forEach items="${type_list}" var="ty">
                                                <div class="item" data-value="${ty.getTypeId()}">${ty.getTypeName()}</div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui left labeled action input">
                                    <label class="ui compact teal basic label">标签</label>
                                    <div class="ui tag selection basic   search dropdown fluid">
                                        <input type="hidden" name="tag_id" value="${good.getGoodTag().getGoodTagId()}">
                                        <i class="dropdown icon"></i>
                                        <div class="default text">标签</div>
                                        <div class="menu">
                                            <c:forEach items="${tag_list}" var="ta">
                                                <div class="item" data-value="${ta.getGoodTagId()}">${ta.getTagName()}</div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="required field">
                    <div class="ui left labeled input">
                        <label class="ui teal basic label">商品描述</label>
                        <input type="text" name="good_describe" placeholder="商品描述" value="${good.getDescribe()}">
                    </div>
                </div>


                <div class="field large-margin-top">
                    <h5 class="middle-margin-bottom">
                        上传图片 (可放大展示)
                    </h5>
                    <div class="upload-img-area">
                        <input type="file" name="first">
                        <input type="hidden" name="first_file_name" value="${good.getFirstImageAreaImages().get(0)}">
                        <img src="${good.getFirstImageAreaImages().get(0)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>
                    <div class="upload-img-area">
                        <input type="file" name="first">
                        <input type="hidden" name="first_file_name" value="${good.getFirstImageAreaImages().get(1)}">
                        <img src="${good.getFirstImageAreaImages().get(1)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>
                    <div class="upload-img-area">
                        <input type="file" name="first">
                        <input type="hidden" name="first_file_name" value="${good.getFirstImageAreaImages().get(2)}">
                        <img src="${good.getFirstImageAreaImages().get(2)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>
                    <div class="upload-img-area">
                        <input type="file" name="first">
                        <input type="hidden" name="first_file_name" value="${good.getFirstImageAreaImages().get(3)}">
                        <img src="${good.getFirstImageAreaImages().get(3)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>

                </div>


                <div class="field large-margin-top">
                    <h5 class="middle-margin-bottom">
                        上传图片 (详细信息照片)
                    </h5>
                    <div class="upload-img-area">
                        <input type="file" name="second">
                        <input type="hidden" name="second_file_name" value="${good.getSecondImageAreaImages().get(0)}">
                        <img src="${good.getSecondImageAreaImages().get(0)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>
                    <div class="upload-img-area">
                        <input type="file" name="second">
                        <input type="hidden" name="second_file_name"  value="${good.getSecondImageAreaImages().get(1)}">
                        <img src="${good.getSecondImageAreaImages().get(1)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>
                    <div class="upload-img-area">
                        <input type="file" name="second">
                        <input type="hidden" name="second_file_name"  value="${good.getSecondImageAreaImages().get(2)}">
                        <img src="${good.getSecondImageAreaImages().get(2)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>
                    <div class="upload-img-area">
                        <input type="file" name="second">
                        <input type="hidden" name="second_file_name"  value="${good.getSecondImageAreaImages().get(3)}">
                        <img src="${good.getSecondImageAreaImages().get(3)}" alt="" onerror="this.src='../../img/upload.png'">
                    </div>

                </div>
                <div class="two fields large-margin-top">
                    <div class="field">
                        <div class="two fields">
                            <div class="required field">
                                <div class="ui left labeled input">
                                    <label class="ui teal basic label">商品总量</label>
                                    <input type="text" name="good_nums" placeholder="商品总量" value="${good.getGoodCount()}">
                                </div>
                            </div>
                            <div class="required field">
                                <div class="ui left labeled input">
                                    <label class="ui teal basic label">商品价格</label>
                                    <input type="text" name="good_price" placeholder="商品价格" value="${good.getPrice()}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <button class="ui button teal huge" type="submit">提交</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>


<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.js"></script>
<script src="../../js/admin.js"></script>
<script>
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
      $('.ui.dropdown').dropdown({
          on: 'hover'
      })
      $('.ui.tag.dropdown')
          .dropdown({
              allowAdditions: true
          })
      ;
      for (let i = 0; i < $('.upload-img-area input[type=file]').length; i++) {
      //    遍历所有的
          $('.upload-img-area input[type=file]')[i].onblur = function () {
              //判断是否文件为空，如果不是空的在进行对应的的操作
              //    触发之后

              if(this.value!="") {
                  //      进行AJAX通信
                  var formData = new FormData();
                  let upload = $($('.upload-img-area input[type=file]')[i]);
                  formData.append('file',upload[0].files[0]);
                  $.post({
                      data:formData,
                      url:"http://localhost:8080/ajax_image",
                      processData : false,
                      contentType : false,
                      success : function(data){
                          //    将对应的图片修改
                          //    指向调用它的对象
                          $('.upload-img-area input[type=hidden]')[i].value=data
                          $('.upload-img-area img')[i].src=data
                      }}
                  )
              }
          }
      }
    $('.menu-item h5 i')[document.getElementsByTagName('meta')['title'].content].className = "icon angle down";
    $('.menu-item .my-list')[document.getElementsByTagName('meta')['title'].content].style.maxHeight = "130px";
  })

</script>
</body>
</html>