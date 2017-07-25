<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html> 
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>门户首页</title>
<link rel="stylesheet" href="${ctx }/resource/frame/css/pages/style.css">
<link rel="stylesheet" href="${ctx }/page/portal/css/main.css">
<script src="${ctx }/resource/frame/js/libs/jquery-1.7.2.min.js"></script>
<!--[if lt IE 9]><script src = "http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
    <div class="c_box2">
        <div class="box2_center" id="box2_center">
           <ul>
                <li style="margin-left:0;">
                    <div class="positive" style="width: 270px; display: block;">
                        <a href="javascript:;" class="info-icon">
                            <img src="${ctx }/BSPage/homepage/images/pic1.png" alt="">
                            <!-- <div class="shadow" id="ie9-filter"></div> -->
                        </a>
                        <a href="javascript:;" class="info-title">基本信息</a>
                    </div>
                    <div class="info" style="display: none; width: 0px;">
                        <i></i>
                        <p>基本信息</p>
                        <span>用户的描述类信息、行为类信息和关联类信息，包括手机身份证、手机号数量等能力</span>
                    </div>
                </li>
                <li>
                    <div class="positive" style="width: 270px; display: block; overflow: hidden;">
                       <a href="javascript:;" class="info-icon">
                            <img src="${ctx }/BSPage/homepage/images/pic2.png" alt="">
                            <!-- <div class="shadow" id="ie9-filter"></div> -->
                        </a>
                        <a href="javascript:;" class="info-title">使用行为</a>
                    </div>
                    <div class="info" style="display: none; width: 0px; background: rgb(66, 74, 79);">
                        <i class="i2"></i>
                        <p>使用行为</p>
                        <span>对用户的使用信息进行分析统计，包括在线时长、通话时长等能力</span>
                    </div>
                </li>               
                <li>
                    <div class="positive" style="width: 270px; display: block;">
                       <a href="javascript:;" class="info-icon">
                            <img src="${ctx }/BSPage/homepage/images/pic3.png" alt="">
                            <!-- <div class="shadow" id="ie9-filter"></div> -->
                        </a>
                        <a href="javascript:;" class="info-title">位置轨迹</a>
                    </div>
                    <div class="info" style="display: none; width: 0px;">
                        <i class="i3"></i>
                        <p>位置轨迹</p>
                        <span>基于基站的综合定位服务，具有定位精度高、覆盖率广、定位速度快等优势，包括常驻区域、重点区域等能力</span>
                    </div>
                </li> 
                <li style="margin-left:0;">
                    <div class="positive" style="width: 270px; display: block;">
                       <a href="javascript:;" class="info-icon">
                            <img src="${ctx }/BSPage/homepage/images/pic4.png" alt="">
                            <!-- <div class="shadow" id="ie9-filter"></div> -->
                        </a>
                        <a href="javascript:;" class="info-title">消费特征</a>
                    </div>
                    <div class="info" style="display: none; width: 316px; background: rgb(66, 74, 79);">
                        <i class="i4"></i>
                        <p>消费特征</p>
                        <span>用户的费用使用情况及余额信息，包括欠费信息类、余额信息类等能力</span>
                    </div>
                </li>
                <li>
                    <div class="positive" style="width: 270px; display: block;">
                       <a href="javascript:;" class="info-icon">
                            <img src="${ctx }/BSPage/homepage/images/pic5.png" alt="">
                            <!-- <div class="shadow" id="ie9-filter"></div> -->
                        </a>
                        <a href="javascript:;" class="info-title">终端价值</a>
                            </div>
                    <div class="info" style="display: none; width: 0px;">
                        <i class="i5"></i>
                        <p>终端价值</p>
                        <span>最大程度实现产品价值最大化和消费者价值最大化，包括终端渠道类、终端关联类等能力</span>
                    </div>
                </li>               
                <li>
                    <div class="positive" style="width: 270px; display: block;">
                        <a href="javascript:;" class="info-icon">
                            <img src="${ctx }/BSPage/homepage/images/pic6.png" alt="">
                            <!-- <div class="shadow" id="ie9-filter"></div> -->
                        </a>
                        <a href="javascript:;" class="info-title">综合评价</a>
                    </div>
                    <div class="info" style="display: none; width: 0px; background: rgb(66, 74, 79);">
                       <i class="i6"></i>
                        <p>综合评价</p>
                        <span>根据用户基本信息、使用行为、消费特征等进行分析统计得出的信息，包括用户星级、用户信用等能力</span>
                    </div>
                </li> 
            </ul>
        </div>
    </div>
    <script type="text/javascript">
  (function($) {

		/*c_box2-翻转效果动画*/
		var turn = function(target,time,opts){
			target.find('li').hover(function(){
				$(this).find('.positive').stop().animate(opts[0],time,function(){
					$(this).hide().next().show();
					$(this).next().animate(opts[1],time);
				});
			},function(){
				$(this).find('.info').animate(opts[0],time,function(){
					$(this).hide().prev().show();
					$(this).prev().animate(opts[1],time);
				});
			});
		}
		var verticalOpts = [{'width':0},{'width':'270px'}];
		turn($('#box2_center'),100,verticalOpts);



		})(jQuery); 
    $(function(){
    	//翻转前后颜色添加
    	var arrColor = ['#b6e4fe','#ff634d','#00bb62','#ea9e53','#7f68c3','#e77495'];
    	var backColor = ['#b6e4fe','#f7a99d','#40f09d','#ffc58d','#b8a4fd','#ffacc4'];
    	function addColor(name,arr){
    		$(name).each(function(index){
        		$(this).css({'background':arr[index]});
        	});
    	}
    	addColor('.positive',arrColor);addColor('.info',backColor);
    })
</script>
    </body>
</html>