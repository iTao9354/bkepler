<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="rsche" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />    
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="format-detection" content="telephone=yes"/>
<meta name="msapplication-tap-highlight" content="no" />
<link rel="stylesheet" href="${ctx }/BSPage/homepage/css/capInformation.css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- -----
--------以下是为了提高在ie8下的css优先级临时解决方案：将部分css写到页面里------------------------
-------------------------------------------------------- -->
<style>
 .cMiddle{
    padding-top: 72px;
} 
.cInfo ul{
	width: 100%;
}
/* .cInfo {
  width: 100%;
  margin-top: 10px;
} */
/* .zChart {
  width: 50%;
  border: 1px solid #d6e4f1; 
  padding:15px;
  padding-bottom:10px; 
  height:354px;
  text-align:center;
} */
/*************锐角弹出框样式************/
/* .tip-wrap {
  position: absolute;
  border: 1px solid rgb(113, 113, 113);
  background: rgb(255, 252, 239);
  color: #888888;
  padding: 5px 10px;
  display: none;
  z-index: 9;
}
 
.tip-arr-a, .tip-arr-b {
  position: absolute;
  width: 0;
  height: 0;
  line-height: 0;
  top: 26px;
  border-style: dashed;
  border-color: transparent;
}
.tip-arr-b{
	border-bottom-width: 10px;
	border-top-width: 10px;
	border-right: 10px solid rgb(113, 113, 113);
	left: -13px;
}
.tip-arr-a{
	border-bottom-width: 10px;
	border-top-width: 10px;
	border-right: 10px solid rgb(255, 252, 239);
	left: -12px;
} */
.tname a{
/* 	display: block;
	width: 100%;
	height:100%; */
}
.tname a:hover {
	background:#EAEAEA;
}

/*  */
.tab-content .active {
    display: block;
    visibility: visible;
}
.nav-tabs > li {
    float: left;
    margin-bottom: -1px;
    width: 125px;
}

.nav-tabs > li.active > a {
    color: #555;
    cursor: default;
    background-color: #fff;
    border: 1px solid #44acf2;
    border-top: 1px solid #fff;
    font-size: 15px;
}

.nav > li > a {
    position: relative;
    display: block;
}
.nav-tabs {
    border-bottom: 1px solid #56aaff;
    padding: 0 5%;
    margin-top: 15px;
    width: 1050px;
}
.developer a{
    color: #08c;
}
.tab-pane {
    display: none;
    visibility: hidden;
}
/* 订单状态占比 */
/*响应式*/
@media screen and (max-width:1024px){   
    .zChart {
	 /*  width: 55%; */
	}
}
@media screen and (max-width:768px){
    .zChart {
    	float:none;
	 	width: 100%;
	}
}
/***************修改所有弹框大小，拿掉滚动条*****************/
#div1 div.panel-body-noheader{
		height: 560px;
}
#div2 div.panel-body-noheader{
		height: 560px;
}
#div3 div.panel-body-noheader{
		height: 560px;
}
#div4 div.panel-body-noheader{
		height: 560px;
}
</style>

<script type="text/javascript" src="${ctx }/BSPage/homepage/js/jquery.flot.js"></script>
  <script type="text/javascript" src="${ctx }/BSPage/homepage/js/jquery.flot.pie.js"></script>
  <script type="text/javascript" src="${ctx }/BSPage/homepage/js/Chart.min.js"></script>
  <script type="text/javascript" src="${ctx }/BSPage/homepage/js/excanvas.min.js"></script>
  <script type="text/javascript" src="${ctx }/BSPage/homepage/js/work.js"></script>
  <script type="text/javascript" src="${ctx }/BSPage/homepage/js/action.js"></script>
 <!--[if lt IE 9]>
    <script src="http://scottjehl.github.io/Respond/dest/respond.src.js"></script>
<![endif]-->
  
  <input type="hidden" id="TagStatus" value='<%=request.getAttribute("TagStatus")%>'>
  <input type="hidden" id="TagCount" value='<%=request.getAttribute("TagCountCharts")%>'>
  <input type="hidden" id="RequestCount" value='<%=request.getAttribute("RequestCount")%>'>
  <input type="hidden" id="DateCount" value='<%=request.getAttribute("DateCount")%>'>
  <input type="hidden" id="OrderCount" value='<%=request.getAttribute("OrderCount")%>'>
<body>
<div class="cMiddle clearfix">
  <div class="usercTop">
      <div class="usercTopContent">
	     <div class="user_ico"></div>
	     <div class="userInfo clearfix">
	        <div class="userName">
	          <span class="userN">${userInfo.LOGIN_NAME }</span>
	          <span class="cxchange">
	             <a href="javascript:updateInfo();" >
          				<img src="${ctx }/BSPage/homepage/images/modify_ico.png" alt="">修改资料
          	     </a>
          	  </span>
	        <div class="clearfix userBMul ">
	          <ul class="userBM">
	             <li class="user_loginid"><span>${userInfo.LOGIN_ID }</span></li>
	             <li class="user_tele"><span>手机号码：</span>
	             <c:if test="${userInfo.TELEPHONE==null }">
     		                 暂无
     	        </c:if>
     	       <c:if test="${userInfo.TELEPHONE!=null }">
     		     ${userInfo.TELEPHONE }
     	     </c:if>
	           </li>
	             <li class="user_mail"><span>邮箱：</span>
	             <c:if test="${userInfo.MAIL_ADDRESS==null }">
	                                               暂无 
     	        </c:if>
     	       <c:if test="${userInfo.MAIL_ADDRESS!=null }">
     		     ${userInfo.MAIL_ADDRESS}
     	     </c:if>
	             
	             </li>
	             <li class="user_area"><span>所在地区：</span>${userInfo.AREA}</li>
	          </ul>
	          <div class="recharge">
          			<span><i class="recharge_icoo"></i><span>立即充值</span></span>
          			<span id="inputLog" class=	"fr" onclick="recharge();"><i class="recharge_icot"></i><span>充值记录</span></span>
          	  </div>
	        </div>
	      </div>
	  </div>
     </div>
   </div>
   <div class=userInfoMore> 
    <div class="userInfo_ul">
      <ul>
        <li class="acountAmount">
         <span>账户余额</span>
         
         <c:if test="${userInfo.CHARGE_BALANCE==null }">
     		<span  class="acountAmount_ico"><i><img src="${ctx }/BSPage/homepage/images/acount_ico.png"></i><i>0.00元</i></span>
     	 </c:if>
     	 <c:if test="${userInfo.CHARGE_BALANCE!=null }">
     		<span  class="acountAmount_ico"><i><img src="${ctx }/BSPage/homepage/images/acount_ico.png"></i><i>${userInfo.CHARGE_BALANCE }</i></span>
     	 </c:if>
         </li>
         <li class="left_line"><img src="${ctx }/BSPage/homepage/images/userInfo_line.png"></li>
        <li class="creditPoint">
         <span>信用点</span>
          
            <c:if test="${userInfo.CREDIT_POINT==null }">
     							<span  class="creditPoint_ico"><i><img src="${ctx }/BSPage/homepage/images/creditPoint_ico.png"></i><i>0</i></span>
     	    </c:if>
     		<c:if test="${userInfo.CREDIT_POINT!=null }">
     							<span  class="creditPoint_ico"><i><img src="${ctx }/BSPage/homepage/images/creditPoint_ico.png"></i><i>${userInfo.CREDIT_POINT }</i></span>
     		</c:if>
     	</li>
     	<li class="left_line"><img src="${ctx }/BSPage/homepage/images/userInfo_line.png"></li>
        <li class="userType"><span>用户类型</span><span>${userInfo.USER_TYPE }</span></li>
        <li class="left_line"><img src="${ctx }/BSPage/homepage/images/userInfo_line.png"></li>
        <li class="companyName"><span>机构名称</span>
        <c:if test="${userInfo.LOGIN_NAME==null }">
     		                 <span>暂无</span>
     	        </c:if>
     	       <c:if test="${userInfo.LOGIN_NAME!=null }">
     		     <span>${userInfo.LOGIN_NAME }</span>
     	     </c:if>
     		
        </li>
        <li class="left_line"><img src="${ctx }/BSPage/homepage/images/userInfo_line.png"></li>
        <li class="config">
         <span>配置项</span>
         <span class="left-grid">
     							<div class="config_container">
     								<a href="javascript:;" class="more_detail">更多</a>
									<ul class="config-list">
										<c:if test="${userInfo.MINIMUM_BALANCE ==null}">
											<li>1.包月保底金额：0元</li>
										</c:if>
										<c:if test="${userInfo.MINIMUM_BALANCE !=null}">
											<li>1.包月保底金额：${userInfo.MINIMUM_BALANCE }元</li>
										</c:if>
										<c:if test="${userInfo.CAP_NUMBER ==null}">
											<li>2.单月封顶次数：不封顶</li>
										</c:if>
										<c:if test="${userInfo.CAP_NUMBER !=null}">
											<li>2.单月封顶次数：${userInfo.CAP_NUMBER }次</li>
										</c:if>
										
										
										<li>3.单次查询允许的标签数 ：${userInfo.ALLOWED_NUMBER }个</li>
										<li>4.每秒的并发次数：${userInfo.CONCURRENT_NUMBER }次</li>
									</ul>
     							</div>							
							</span>
        </li>
        <li class="left_line"><img src="${ctx }/BSPage/homepage/images/userInfo_line.png"></li>
        <li class="encryptType"><span>加密方式</span><span><a href="javascript:;" class="cSpanDownLoad"> 下载</a></span></li>
        <li class="left_line"><img src="${ctx }/BSPage/homepage/images/userInfo_line.png"></li>
        <li class="licenseDate"><span>认证通过时间</span><span>${userInfo.LICENSE_DATE }</span></li>
        <li class="left_line"><img src="${ctx }/BSPage/homepage/images/userInfo_line.png"></li>
        <li class="urlR">
         <span>请求服务器地址(URL)</span>
         <span>
     							<a title="${rsche}://${serverName}:${serverPort}${ctx }" href="${rsche}://${serverName}:${serverPort}${ctx }"  target="_blank" class="server_addr">${rsche}://${serverName}:${serverPort}${ctx }</a>
     							<a href="javascript:;" class="cSpanMargin"> 使用说明</a>
     						</span>
        </li>
      </ul>
     </div>
   </div>
	 <div class="cMiddle-top">
	  
	<!--  <div class="cMiddle_right clearfix"> -->
			<!-- <p class="rightTop"><span>个人资料</span></p> -->
			<%-- <div class="fl personId">
          		<img src="${ctx }/BSPage/homepage/images/touxiang1.png" class="photo">
          		<p class="cxchange">
          			<a href="javascript:updateInfo();" >
          				<img src="${ctx }/BSPage/homepage/images/write.png" alt="">修改资料
          			</a>
          		</p>
          		<div class="recharge clearfix">
          			<a href="javascript:;" class="fl cInput">立即充值</a>
          			<a href="javascript:;" id="inputLog" class=	"fr cInput" onclick="recharge();">充值记录</a>
          		</div>
          		
         	</div> --%>
         	<!-- <div class="fr info-content">  -->        		
     			<!-- <table> -->
     				<!-- <tbody> -->
     					<%-- <tr>
     						<th><span>登录账号</span></th>
     						<td class="left-grid">${userInfo.LOGIN_ID }<img src="${ctx }/BSPage/homepage/images/ico_rztg.png" class="cxlogo"></td>
     						<th><span>用户姓名</span></th>
     						<td class="right-grid">${userInfo.LOGIN_NAME }</td>
     					</tr> --%>
     					<%-- <tr>
     						<th><span>手机号码</span></th>
     						<td class="left-grid">${userInfo.TELEPHONE }</td>
     						<th><span>邮箱</span></th>
     						<td class="right-grid">${userInfo.MAIL_ADDRESS}</td>
     					</tr> --%>
     					<%-- <tr>
     						<th><span>账户余额</span></th>
     						<c:if test="${userInfo.CHARGE_BALANCE==null }">
     							<td class="left-grid">0.00元</td>
     						</c:if>
     						<c:if test="${userInfo.CHARGE_BALANCE!=null }">
     							<td class="left-grid">${userInfo.CHARGE_BALANCE }元</td>
     						</c:if>
     						<th><span>所在地区</span></th>
     						<td class="right-grid">${userInfo.AREA}</td>
     					</tr> --%>
     					<%-- <tr>
     						<th><span>信用点</span></th>
     							<c:if test="${userInfo.CREDIT_POINT==null }">
     							<td class="left-grid">0</td>
     						</c:if>
     						<c:if test="${userInfo.CREDIT_POINT!=null }">
     							<td class="left-grid">${userInfo.CREDIT_POINT }</td>
     						</c:if>
     						<th><span>机构名称</span></th>
     						<td class="right-grid">${userInfo.COMPANY_NAME }</td>
     					</tr> --%>
     				<%-- 	<tr>
     						<th><span>配置项</span></th>
     						<td class="left-grid">
     							<div class="config_container">
     								<a href="javascript:;" class="more_detail">更多>></a>
									<ul class="config-list">
										<c:if test="${userInfo.MINIMUM_BALANCE ==null}">
											<li>1.包月保底金额：0元</li>
										</c:if>
										<c:if test="${userInfo.MINIMUM_BALANCE !=null}">
											<li>1.包月保底金额：${userInfo.MINIMUM_BALANCE }元</li>
										</c:if>
										<c:if test="${userInfo.CAP_NUMBER ==null}">
											<li>2.单月封顶次数：不封顶</li>
										</c:if>
										<c:if test="${userInfo.CAP_NUMBER !=null}">
											<li>2.单月封顶次数：${userInfo.CAP_NUMBER }次</li>
										</c:if>
										
										
										<li>3.单次查询允许的标签数 ：${userInfo.ALLOWED_NUMBER }个</li>
										<li>4.每秒的并发次数：${userInfo.CONCURRENT_NUMBER }次</li>
									</ul>
     							</div>							
							</td>
     						<th><span>用户类型</span></th>
     						<td class="right-grid">${userInfo.USER_TYPE }</td>
     					</tr> --%>
     					<%-- <tr>
     						<th>接入许可证</th>
     						<td class="left-grid">${userInfo.LICENSE }<a href="javascript:;" class="cSpanMargin"> 许可信息</a></td>
     						<th><span>指纹码</span></th>
     						<td class="right-grid">NUMBER<a href="javascript:;" class="cSpanMargin"> 什么是指纹码？</a></td>
     					</tr> --%>
     					<%-- <tr>
     						<th>认证通过时间</th>
     						<td class="left-grid">${userInfo.LICENSE_DATE }</td>
     						<th>请求服务器地址(URL)</th>
     						<td class="right-grid">
     							<a href="javascript:;" class="server_addr">${rsche}://${serverName}:${serverPort}${ctx }</a>
     							<a href="javascript:;" class="cSpanMargin"> 使用说明</a>
     						</td>
     					</tr> --%>
     					<!-- <tr>
     						<th><span>加密方式</span></th>
     						<td class="left-grid"><a href="javascript:;" class="cSpanDownLoad"> 下载</a></td>
     						<th></th>
     						<td></td>
     					</tr> -->
     				<!-- </tbody> -->
     			<!-- </table>  -->   			
         	<!-- </div> -->
		<!-- </div> --> 

		<!-- 标签信息 -->
 <p class="rightTop"><span>标签信息</span></p>
  <div class="cmr_up_again">
       		<!-- <p class="rightTop"><span>标签信息</span></p> -->
       		<div class="clearfix cmr_up_content">
       			<div class="fl cmr_up_left">
       				<!-- 环形图 -->
		  			<div class="cInfo_twi clearfix">
	  		   			<p class="rightTop">我的标签分类占比图</p>
	           			<div id="flot-placeholder" style="width:378px;height:176px;margin:0 auto;"></div>           
	  				</div>
       				<!-- 基本信息 -->
	       			<div class="cInfo clearfix">			
  			  			<ul class="clearfix">
  			  				<c:forEach items="${TagCount }" var="temp" begin="0" end="2">
  			  				<li class="cInfo_name">${temp.TYPE_NAME}</li>
  			  				<li class="progress_bar">
  			  					<span class="slide_bg"></span>
  			  					<span class="slide_block"></span>			  					
  			  				</li>
  			  				<li class="cInfo_num" style="position:relative;cursor:pointer;">
  			  					<a href="javascript:;" class="num_icon">${temp.NUM}</a>
  							 	<!-- <div class="tip-wrap" style="left: 80px;top: -9px;width: 100px;">
  									<div class="tip-arr-b"></div><div class="tip-arr-a"></div>									
  									<c:forEach items="${TagName }" var="item">
  							    		<c:if test="${item.TAG_TYPE==temp.ID}">
  										<p id="${item.TAG_CODE}" onclick="dt(this.id);" class="tname"><a href="javascript:;">${item.TAG_NAME }</a><p>
  										</c:if>
  								    </c:forEach>
  								</div>  -->
  							</li> <br>
  			  					<%-- <li>${temp.NUM}</li> --%>
  			  				</c:forEach>	
  			  			</ul>
  			  			<ul class="clearfix">
  			  			<c:forEach items="${TagCount }" var="temp" begin="3" end="5">
  			  				<li class="cInfo_name">${temp.TYPE_NAME}</li>
  			  				<li class="progress_bar">
  			  					<span class="slide_bg">	</span>	
  			  					<span class="slide_block"></span>								
  			  				</li>
  			  				<li class="cInfo_num" style="position:relative;cursor:pointer;">
  			  					<a href="javascript:;" class="num_icon">${temp.NUM}</a>
  									
  							</li><br>
  			  			</c:forEach>
  			  			</ul>
                <!-- 弹出框 -->
                <c:forEach items="${TagCount }" var="temp" begin="0" end="5">
                <div class="tip-wrap">
                  <img src="${ctx }/BSPage/homepage/images/triangle.png" alt="" class="triangle">                  
                  <c:forEach items="${TagName }" var="item" >
                      <c:if test="${item.TAG_TYPE==temp.ID}">
                    <p id="${item.TAG_CODE}" onclick="dt(this.id);" class="tname"><a href="javascript:;">${item.TAG_NAME }</a><p>
                    </c:if>
                    </c:forEach>
                </div>
                </c:forEach> 
	       			</div>
  				</div>
  				<!-- 折线图 -->
				<div class="fr zChart">
			
			  	<p id="tagtitle"></p> 
  					<canvas id="myChart" width="560" height="330"></canvas>
				</div> 
			</div> 			
  		</div>
  		<!-- 标签请求统计 -->
  		<div class="cmr_middle">
  		 	<p class="rightTop"><span>标签请求统计</span></p>
  		 	<div class="loginContent clearfix">  		 	
  				<ul class="table-btn-list ">
  					<li class="active"><a href="javascript:;">按标签</a></li>
  					<li><a href="javascript:;">按地址</a></li>
  					<span class="cmr_line"></span>
  				</ul>
  				<div class="cmrclick_more"><a href="javascript:;">更多>></div>
  				<div class="table-container active">
  					<table>
 	 					<thead>
	 					   	<tr>
	 					     	<th>标签名称</th>
	 					     	<!-- <th>失效日期</th> -->
	 					     	<th>总次数</th>
	 					     	<th>成功次数</th>
	 					     	<th>失败次数</th>
	 					     	<th>消耗金额</th>
    						  	<th>消耗信用点</th>
    						  	
	 					   	</tr>
	 					</thead>
     					<tbody>
     					 	<c:forEach items="${RequestInfo }" var="temp" begin="0" end="2">
	 					   	<tr>
	 					     	<td>${temp.TAG_NAME }</td>
	 					     	<%-- <td>${temp.END_TIME }</td> --%>
	 					     	<td>${temp.REQNUM }</td>
	 					     	<td>${temp.SUCCESS }</td>
	 					     	<td>${temp.FAILED }</td>
	 					     	<td>${temp.COST }</td>
    						  	<td class="credit-points">${temp.COST*100 }</td>
	 					   	</tr>
	 					   	</c:forEach>
	 					</tbody>
					</table>
					<!-- <a href="javascript:;" id="click_box"  class="cInput click_box" onclick="onemore();">更多</a> -->
				</div>
  				<div class="table-container">
  					<table>
		 	 			<thead>
			 			   	<tr>
			 			     	<th>IP地址</th>
							    <th>标签数</th>
							    <th>成功标签数</th>
							    <th>总次数</th>
							    <th>成功次数</th>
							    <th>失败次数</th>
							    <th>消耗金额</th>
							    <th>消耗信用点</th>
			 			   	</tr>
			 			</thead>
             			<tbody>
             			 	<c:forEach items="${requestByIp}" var="temp" begin="0" end="2">
			 			   	<tr>
			 			     	<td>${temp.IP }</td>
							    <td>${temp.TOTALTAG }</td>
							    <td>${temp.SUCCESSTAG }</td>
							    <td>${temp.TOTALCOUNT }</td>
							    <td>${temp.SUCCESSCOUNT }</td>
							    <td>${temp.FAILCOUNT }</td>
				            	<td>${temp.COST}</td>
				            	<td class="credit-points">${temp.CPOINT }</td>
			 			   	</tr>
			 			   	</c:forEach>
			 			</tbody>
  		 			</table>
  		 			<!-- <a href="javascript:;" id="click_box"  class="cInput click_box" onclick="byIP();">更多</a> -->
  				</div>
	        </div>
	    </div>			
	</div>

  		
	<!-- 标签请求状态占比及周期请求量统计图 -->
	<div class="cmr_down clearfix">
	  	<p class="rightTop"><span>标签周期请求量统计图</span></p>
	  	<div class="cmr_down_content">	  		
	  		<!-- <div style="width:20%;height:160px;" class="cmr-down-pie">
	  			<p class="rightTop">标签请求状态占比</p>	  			
	  	 		<div id="placeholder" style="width:100%;height:70%;margin:0 auto;"></div>
	  		</div> -->	  		
     		<div class="cmyChart"><canvas id="cmyChart"  width="1100" height="330"></canvas></div>
	  	</div>          
   </div>  
	<!-- 订单状态占比图 -->
	<div class="cmr_down_again clearfix">
        <p class="rightTop"><span>订单信息表</span></p>
        <div class=" cmr_down_content clearfix">
        	<!-- <div id="table_placeholder" style="width:20%;height:183px;border:1px solid #d6e4ef;margin:0 auto;">
        	</div> -->
           	<div class="status_more">
           	  <a href="javascript:;" id="click_box"   onclick="twomore();">更多>></a>
           	</div>
           	<div class="fr action_table clearfix">
              <!-- <a href="javascript:;" id="click_box"  class="status_more" onclick="twomore();">更多>></a> -->
             	<table style="table-layout:fixed;">
             		<thead>
                		<tr>
               			<!-- <th>订单编号</th> -->
                  			<th>订购日期</th>
                  			<th>订购能力</th>
                  			<th>生效日期</th>
                  			<th>失效日期</th>
                  			<th>状态</th>
                  			<th>操作</th>
                  			<th>订单信息</th>
                		</tr>
              		</thead>
              		<tbody>
          			<c:forEach items="${orderInfo }" var="temp" begin="0" end="2">
          				<tr>
          				<%-- <td style="overflow: hidden">${temp.UUID }</td> --%>
          					<td>${temp.APPLY_TIME }</td>
          					<td>${temp.TAG_NAME }</td>
          					<td>${temp.START_TIME }</td>
          					<td>${temp.END_TIME }</td>
          					<td>
          					<c:if test="${temp.STATUS=='0' }">已确认</c:if>
          					<c:if test="${temp.STATUS=='1' }">未确认</c:if>
          					</td>
          					<c:if test="${temp.STATUS=='0' }"><td>确认</td></c:if>
          					<c:if test="${temp.STATUS=='1' }"><td onclick="passOrder('${temp.UUID}')"><span style="color: blue">	确认</span></td></c:if>
          					<c:if test="${temp.STATUS=='0' }"><td onclick="view('${temp.UUID}')"><a href="javascript:;">查看明细</a></td></c:if>
          					<c:if test="${temp.STATUS=='1' }"><td onclick="view('${temp.UUID}')"><span style="color: blue"><a href="javascript:;">查看明细</a></td></c:if>
          				</tr>
          			</c:forEach>
        			</tbody> 
       			</table>
       		</div>
        </div>
        <div class="clearboth"></div>
     </div>
</div>
<div id="addDiv"></div>
<div id="orderDetail"></div>

  <script type="text/javascript">
	function getnowtime(){
     var now=new Date();
     var nowMonth = now.getMonth()+1;         
     var nowYear = now.getFullYear(); 
     var nowtime=nowYear+"-"+nowMonth; 
     return nowtime;
	}
	$(function(){
	
		document.getElementById("tagtitle").innerHTML = getnowtime()+"月标签访问量（按类型统计）";
	}); 
	  	function dt(tagcode) {
			$.ajax({
				url : "${ctx}/bs/dataAbility/detail.do?",
				data : {
					"tagCode" : tagcode
				},
				type : "post",
				success : function(data) {
					$("#footer").addClass("phonePricefooter").removeClass(
							"footer");
					$("#mainContent").html(data);
					showJson();
					 $('.boot').popover('destroy');
				}
			}); 
		}
  
function updateInfo() {		
			
			//请求传入数据渲染到页面
			$("#addDiv")
				.dialog(
					{
						iconCls : 'glyphicon glyphicon-plus',
						resizable : false,
						title : "修改个人资料",
						closed : false,
						modal : true,
						width : 400,
						height : 300,
						href : "${ctx}/bs/userCenter/toUpdate.do?",
						buttons : [{
							text:'<i class="fa fa-check checkButtom green"></i>完成',
							iconCls:'icon-ok',
							handler:function(){
								$('#addDiv').find("#J_Form").form('submit', {
									url: util.warpRandom("${ctx }/bs/userCenter/updateInfo.do?"),
									onSubmit: function(){
										
										var isValid = $(this).form('validate');
										if (!isValid){
										
										}
										return isValid;	
									},
									success: function(data){
										var ypwd=$("#ypwd").val();
										var xpwd=$("#password").val();
										if(ypwd!=xpwd){
											window.location.replace("${ctx}/bs/signOut/signOut.do");
										}else{
										//$("#addDiv").dialog("close");
										$("#addDiv").dialog(
												"destroy");
										$("#header li[name='userCenter']").click();
										}
									}
								});
							}
						},{
							text:'<i class="fa fa-close cancelButtom red"></i>取消',
							iconCls:'icon-cancel',
							handler:function(){
								$("#addDiv").dialog("close");
								$("#header li[name='userCenter']").click();
							}							
						}],
						onClose : function(){
							$(this).dialog("destroy");
							$("#header li[name='userCenter']").click();
						}
					});
		}
	  	function view(uuid){
		  	$("#orderDetail").dialog({
				iconCls:'glyphicon glyphicon-plus',
				resizable:false,
				title:"查看订单详情",
				closed:false,
				modal:true,
				width:450,
				height : 414,
				href:"${ctx}/bs/userCenter/view.do?uuid="+uuid,
			});   
		}   
   
	  	function passOrder(id){
			
	  		$.messager.confirm("操作提示","确认通过？", function(s) {
	  		 if (s) {
	  			$.ajax({
					url:"${ctx}/bs/userCenter/passOrder.do?id="+id,
			   		type:"post",
			   		success:function(data){
			    		 $("#header li[name='userCenter']").click();
			    	},error:function(e){
						 top.jMessage('提示','操作异常！');
			    	}});  
	  		 
	  		 }
	  		});
		}	

		function onemore() {

			$("#addDiv").dialog({
				iconCls : 'glyphicon glyphicon-plus',
				resizable : false,
				title : "标签请求统计-按标签",
				closed : false,
				modal : true,
				width : 750,
				height : 690,
				href : "${ctx}/bs/userCenter/toselect.do?",
				buttons : [ {
					text : '关闭',
					iconCls : '',
					handler : function() {
						$("#addDiv").dialog("close");
						$("#header li[name='userCenter']").click();
					}
				} ],
				onClose : function(){
					$(this).dialog("destroy");
					$("#header li[name='userCenter']").click();
				}
			});
		}
		
		function byIP(){
			$("#addDiv").dialog({
				iconCls : 'glyphicon glyphicon-plus',
				resizable : false,
				title : "标签请求统计-按地址",
				closed : false,
				modal : true,
				width : 770,
				height : 690,
				href : "${ctx}/bs/userCenter/toselectByIp.do?",
				buttons : [ {
					text : '关闭',
					iconCls : '',
					handler : function() {
						$("#addDiv").dialog("close");
						$("#header li[name='userCenter']").click(); 
					}
				} ],
				onClose : function(){
					$(this).dialog("destroy");
					$("#header li[name='userCenter']").click();
				}
			});			
		}		
		
		function twomore() {
			$("#addDiv").dialog({
				iconCls : 'glyphicon glyphicon-plus',
				resizable : false,
				title : "订单状态",
				closed : false,
				modal : true,
				width : 814,
				height : 720,
				href : "${ctx}/bs/userCenter/toselectOrder.do?",
				buttons : [ {
					text : '关闭',
					iconCls : '',
					handler : function() {
						$("#addDiv").dialog("close");
						 $("#header li[name='userCenter']").click(); 
					}
				} ],
				onClose : function(){
					$(this).dialog("destroy");
					$("#header li[name='userCenter']").click();
				}
			});
		}
		function recharge() {
			$("#addDiv").dialog({
				iconCls : 'glyphicon glyphicon-plus',
				resizable : false,
				title : "充值记录",
				closed : false,
				modal : true,
				width : 677,
				height : 670,
				href : "${ctx}/bs/userCenter/torecharge.do?",
				buttons : [ {
					text : '关闭',
					iconCls : '',
					handler : function() {
						$("#addDiv").dialog("close");	
					}
				} ],
				onClose: function(){
					$(this).dialog("destroy");
					$("#header li[name='userCenter']").click(); 
				}
			});
		}
		
		//封装弹出框遮罩层调用方法
		function openPop(id) {
			//显示弹出框
			$(id).click(function() {
				$("#gCover").removeClass("none");
				$("body").css("overflow", "hidden");
				$("#g_pop").removeClass("none");
			});
			//关闭弹出框
			$("#gClose").click(function() {
				$("body").css("overflow", "auto");
				$("#gCover").addClass("none");
				$("#g_pop").addClass("none");
			});
			//遮罩层遮盖整个body
			var a = $(document.body).height();
			$('#gCover').css('height', a);
		}		 
			  

		//点击不为零的数字出现锐角弹框
		/* var TbRow = $(".cInfo ul li:odd"); */
			 /* TbRow.toggle(
					 function(){
						 if(typeof(parseInt($(this).text())==="number")){
							 if (parseInt($(this).text()) > 0)
					          {
								 
								  $(".tip-wrap").css("display","block");
								  
					          } 
						 }
					 },
					 function(){
						 if(typeof(parseInt($(this).text())==="number")){
							 if (parseInt($(this).text()) > 0)
					          {
								 
								  $(".tip-wrap").css("display","none");
								  
					          } 
						 }
					 }
					 ); */
					 
		/* TbRow.click( function () { 
			 if(typeof(parseInt($(this).text())==="number")){
				 if (parseInt($(this).text()) > 0)
		          {
					 if($(this).children("div").css("display")=="none"){
						 $(this).children("div").show();
						
						 }
						 else{
					    $(this).children("div").hide();
						 }
				  } 
			 }
			  
			 }); */ 
			       
		$(function(){
		      $('#content_tab_login_dev').addClass('active');
		      $('.guide .developer a').click(function(){
		        var id = $(this).attr('id');
		        $('.guide .developer').removeClass('active');
		        $(this).parent('li').addClass('active');
		        $('.tab-content .contain_div').removeClass('active');
		        $('#content_'+id).addClass('active');
		          });
		
			//个人资料部分“配置项”详情
			var oConWidth = $('.more_detail').width()+6;
			var oConHeight = $('.more_detail').height()/2;
			detail($('.config-list'),$('.more_detail'));
			$('.config-list').css({'left':oConWidth, 'top':oConHeight});
				//隔行变色
			$('.info-content tr').each(function(index){
				changeColor($('.info-content tr:eq('+(index-1)+')'),index);
			})

			$('.cInfo_num').each(function(index){
			// 	// 进度条滑块位置
			   var oSlideWidth = $('.num_icon:eq('+index+')').html()*15;
				  var colorArr = ['#53b2ea','#ff634d','#00bb62','#ea9e53','#7e68c3','#e77495'];
			   $('.slide_block:eq('+index+')').css({'width':oSlideWidth,'backgroundColor':colorArr[index%6]});
				
				// 标签信息详情弹出框        				
        	  $('.tip-wrap:eq('+index+')').css({'top':($('.num_icon').height()/2*(2*index+1)- $('.tip-wrap:eq('+index+')').height()/2)});
        	 
          if($('.num_icon:eq('+index+')').html() != 0){
        	 // console.log($('.num_icon').height()/2*(index+0.5));
        	 /*  console.log($('.tip-wrap:eq('+index+')').height()/2); */
          		detailWrap($('.tip-wrap:eq('+index+')'),$('.cInfo_num:eq('+index+')'));
          }
			})
			//标签请求统计表格
			
			$(".cmrclick_more").click(function(){
						 onemore();
				 });//初始化点击事件
			$('.table-btn-list li').off('click').click(function(){
				$(this).addClass("active");
				 $(this).siblings().removeClass("active");
				 var more_index=$(this).index();
				 $(".cmrclick_more").click(function(){
					 if(more_index==1){
						 byIP();
					 }else if(more_index==0){
						 onemore();
					 }
				 })
				$('.table-container').removeClass('active').eq($(this).index()).addClass('active');
				$('.table-container.active tbody tr').each(function(index){
					changeColor($('.table-container.active tbody tr:eq('+index+')'),index);
				})
			})
				//隔行变色
			$('.table-container tbody tr').each(function(index){
				changeColor($('.table-container tbody tr:eq('+index+')'),index);
			})
			
			//订单状态占比
			$('.action_table tbody tr').each(function(index){
				changeColor($('.action_table tbody > tr:eq('+index+')'),index);
			})
			
			// 鼠标划入后的弹出框
			function detail(sConfigList,sMoreDetail){					
				var timer;					
				sMoreDetail.off('hover').hover(function(){
					clearTimeout(timer);
					sConfigList.show();
				},function(){
					clearTimeout(timer);
					clock();							
				})
				sConfigList.off('mouseover').mouseover(function(){
					clearTimeout(timer);
					$(this).show();
				})
				sConfigList.off('mouseout').mouseout(function(){
					var _this = this;
					clock();				
				})				
				// 定时器
				function clock(){
					timer = setTimeout(function(){
						sConfigList.hide();
					},300)
				}		
			}	
			
			
			function detailWrap(sConfigList,sMoreDetail){				
				var timer2;					
				sMoreDetail.off('hover').hover(function(){
// 					clearTimeout(timer2);
					sConfigList.show();
				},function(){
// 					clearTimeout(timer2);
// 					clock2();
					sConfigList.hide();
				})
				sConfigList.off('mouseover').mouseover(function(){
					clearTimeout(timer2);
					$(this).show();
				})
				sConfigList.off('mouseout').mouseout(function(){
					var _this = this;
					clock2();				
				})				
				// 定时器
				function clock2(){
					timer2 = setTimeout(function(){
						sConfigList.hide();
					},300)
				}			
			}
			
			//表格隔行变色
			function changeColor(sClass,index){
				if(index%2){
					sClass.css('background','#f8f8f8');
				}else{
					sClass.css('background','#fff');
				}
			}
			//标签请求统计中信用点四舍五入取整
			for(var i = 0; i < $('.table-container').length; i++){
				$('.table-container').eq(i).find($('.credit-points')).each(function(index){
					var oCreditCon = $('.credit-points:eq('+index+')').html();
					$('.credit-points:eq('+index+')').empty().append(Math.round(oCreditCon));
				})	
			}
			
			
		}) 
	</script>
		
</body>