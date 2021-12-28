var btn = document.querySelector(".input");
var pics = document.querySelectorAll(".scroll-pic-pages");
var pages = document.querySelector(".pages");
var content = document.querySelectorAll(".content");
var arrows = document.querySelectorAll(".arrow");
var rightRaws = document.querySelectorAll(".right-arrow");
var leftRaws = document.querySelectorAll(".left-arrow");
var play = document.querySelector(".play");
var newSong = document.querySelector(".new-songs")
var recommend = document.querySelector(".recommends")
var mvDom = document.querySelector(".mv-recommend")
var item1s = document.querySelectorAll(".item1")
var item2s = document.querySelectorAll(".item2")
var labels = document.querySelectorAll(".label-container");
var servicelist = document.querySelectorAll(".service-list");
var pointJoins=document.querySelectorAll(".point-join");
var sevicesList = document.querySelectorAll(".service-list");
var serviceLabel=document.querySelectorAll(".service-label")
// 维护第一张图
var index1 = 1;
var index2 = 1;
var index3 = 1;
var index4 = 1;
var timer1 = null;
var timer2 = null;
var timer3 = null;
var timer4 = null;
var isMoving1=false;
var isMoving2=false;
var isMoving3=false;
var isMoving4=false;
var currentOffset1 = 0;
var currentOffset2 = 0;
var currentOffset3 = 0;
var currentOffset4= 0;


for (let i = 0; i < content.length; i++) {
    content[i].onmouseenter = function () {
        console.log(i)
        arrows[2*i].style.opacity = "1";
        arrows[2*i+1].style.opacity = "1";
    }


    content[i].onmouseleave = function () {
        arrows[2*i].style.opacity = "0";
        arrows[2*i+1].style.opacity = "0";
    }
}


rightRaws[0].onclick = function () {

    //    用来确定当前在多少页
    index1--;
    move(true, 3, 1);
}
leftRaws[0].onclick = function () {
    //    用来确定当前在多少页
    index1++;
    move(false, 3, 1);
}

rightRaws[1].onclick = function () {
    //    用来确定当前在多少页
    index2--;
    move(true, 3, 2);
}
leftRaws[1].onclick = function () {
    //    用来确定当前在多少页
    index2++;
    move(false, 3, 2);
}
rightRaws[2].onclick = function () {
    //    用来确定当前在多少页
    index3--;
    move(true, 3, 3);
}
leftRaws[2].onclick = function () {
    //    用来确定当前在多少页
    index3++;
    move(false, 3, 3);
}
//4

window.onload = function () {
    console.log(pages.clientWidth)
    currentOffset1 -= pages.clientWidth
    currentOffset2 -= pages.clientWidth
    currentOffset3 -= pages.clientWidth
    currentOffset4 -= pages.clientWidth
    pics[0].style.left = currentOffset1 + "px";
    pics[1].style.left = currentOffset2 + "px";
    pics[2].style.left = currentOffset3 + "px";
    pics[pics.length - 1].style.left = currentOffset4 + "px";
    for (let i = 0; i < labels.length; i++) {
        labels[i].onmouseenter = (function (i) {
            return function () {
                item1s[i].style.display = "none"
                item2s[i].style.display = "inline"
                servicelist[i].style.display="block"
            }
        })(i)
        labels[i].onmouseleave = (function (i) {
            return function (e) {
                let top=servicelist[i].offsetTop;
                let left=serviceLabel[i].offsetLeft+5;
                let width=servicelist[i].clientWidth;
                let height=servicelist[i].clientHeight;
                let pageX=e.pageX;
                let pageY=e.pageY;
                console.log(left)

                if ((pageX>=left && pageX<=left+width) && (pageY>=top && pageY<=top+height)) {

                }else {
                    item2s[i].style.display = "none"
                    item1s[i].style.display = "inline"
                    servicelist[i].style.display="none"
                }
            }
        })(i)
        servicelist[i].onmouseleave=function() {
            item2s[i].style.display = "none"
            item1s[i].style.display = "inline"
            servicelist[i].style.display="none"
        }
        item2s[i].style.display = "none"
    }

    for (let i = 0; i < pointJoins.length; i++) {
        // 每一个圆点组
        for (let j = 0; j < pointJoins[i].children.length; j++) {
            // 循环原点组的所有圆点 pointJoins[i].children[j]
            pointJoins[i].children[j].onclick=(function (i,j) {
                //    修改颜色的操作
                //     i是第几个组
                //     J是组的第几个远点
                //     console.log(window["index"+i+1])   index1
                //     查看点之前是在第几个屏
                //     j+1 是你点的位置  用 j+1 - index1 就是要走的位置
                return function () {

                    let tmp=i+1; //1
                    if (window["isMoving"+tmp]) return
                    let tmpIndex=0;
                    // window["index"+tmp]  有可能是最后一张后面的 3，也有可能是第一张前面的 0
                    //  如果是3 让它变成 1 如果是 0 让他变成 2  1是1 2是2   总共两条
                    if (window["index"+tmp] == pointJoins[i].length+1) {
                        tmpIndex = 1;
                    }else if (window["index"+tmp] ==0) {
                        tmpIndex = pointJoins[i].length
                    }else {
                        tmpIndex = window["index" + tmp]; //tmpIndex=1
                    }
                    // 如果
                    let moveDistance =  (tmpIndex-j-1)*pages.clientWidth   //1-1-1
                    move(moveDistance,pointJoins[i].length,tmp)   // 进去1的滚动后不会变
                    window["index"+tmp]=j+1;
                    changeColor(tmp,pointJoins[i].children.length)
                }

            })(i,j)
        }

    }

}
// 传入两个参数 一个是哪个index i  count是指总共有多少个点
function changeColor(i,count) {
    let cur = 0;  //轮播图的第几张

    if (window["index"+i] == count+1) {
        cur = 1;
    }else if (window["index"+i] ==0) {
        cur = count;
    }else {
        cur = window["index" + i]; //tmpIndex=1
    }
    for (let k = 0; k < pointJoins[i-1].children.length; k++) {
        pointJoins[i-1].children[k].className="";
    }
    pointJoins[i-1].children[cur-1].className="active";

}

// 传递的num是一共有多少张轮播图
function move(flag, num, countIndex) {
    if (window["isMoving"+countIndex]==true) {
        if (flag) {
            window["index" + countIndex]++;
        }else {
            window["index" + countIndex]--;
        }
        return
    }
    changeColor(countIndex,num);
    window["isMoving"+countIndex]=true
    var allTimes = 1000;
    var moveDistance=0;
    if (typeof flag=='boolean') {
        // 移动一次多少秒

        // console.log(pages.clientWidth)
        moveDistance = pages.clientWidth;

        if (!flag) {
            moveDistance = -1 * moveDistance
        }
    }else  {
        moveDistance = flag;
    }
    // 走一百五十步
    var stepNums = 150;
    // 一步走多少米
    var stepDistance = moveDistance / stepNums;
    // 一步走多少秒
    var stepTimes = allTimes / stepNums;
    // 用来计算走了多少步，轮播图有没有结束

    let count = 0;
    window["timer" + countIndex] = setInterval(function () {
        window["currentOffset"+countIndex] += stepDistance;
        if (count == stepNums - 1) {
            if (window["index" + countIndex] == 0) {
                // 这个是最后一张
                window["currentOffset"+countIndex] = -num * pages.clientWidth;
                window["index" + countIndex] = num;

            } else if (window["index" + countIndex] == num + 1) {
                // 这个是第一张
                window["currentOffset"+countIndex] = -1 * pages.clientWidth;
                window["index" + countIndex] = 1;
            }
        }
        if (countIndex == 4) {
            pics[pics.length - 1].style.left = window["currentOffset"+countIndex] + "px";
        } else {
            pics[countIndex - 1].style.left = window["currentOffset"+countIndex] + "px";
        }

        if (count == stepNums - 1) {
            window["isMoving"+countIndex]=false;
            clearInterval(window["timer" + countIndex])
        }
        count++;
    }, stepTimes)
}

