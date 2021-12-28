$(function () {
  // 初始化左侧菜单
  for (let i = 0; i < $('.my-list .segment').length; i++) {
    $('.my-list .segment')[i].onmouseenter=function () {
      $('.my-list .segment')[i].className="ui attached padded white inverted segment"
    }
    $('.my-list .segment')[i].onmouseleave=function () {
      $('.my-list .segment')[i].className="ui attached padded orange inverted segment"
    }
  }

  for (let i = 0; i < $('.menu-item h5 i').length; i++) {
    $('.menu-item h5 i')[i].onclick=function() {
      if ($('.menu-item .my-list')[i].style.maxHeight=="130px")  {
        //说明是收回去的
        $('.menu-item h5 i')[i].className="icon angle left";
        $('.menu-item .my-list')[i].style.maxHeight="0px"
      }else {

        $('.menu-item h5 i')[i].className="icon angle down";
        $('.menu-item .my-list')[i].style.maxHeight="130px"
      }

    }
  }
})
