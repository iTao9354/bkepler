<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
 <head> 
  <meta charset="utf-8" />
  <title>征信产品一体化管控平台</title> 
  <base href="${ctx }/BSPage/homepage/" />
  <%@ include file="/page/common/common.jsp"%>
  <%@ include file="/page/common/easyui.jsp"%>
  <%@ include file="/page/common/iconpath.jsp"%>
  <link rel="stylesheet" href="${ctx }/BSPage/homepage/css/main.css" /> 
  <link rel="stylesheet" href="${ctx }/BSPage/homepage/css/style.css" />
  <link rel="stylesheet" href="${ctx }/resource/font-awesome-4.4.0/css/font-awesome.css" />
  
  <script type="text/javascript" src="${ctx }/BSPage/homepage/js/homePage.js"></script>
  <script type="text/javascript" src="${ctx }/BSPage/homepage/js/action.js"></script>
  
<script type="text/javascript" src="${ctx }/BSPage/homepage/js/dataAbility.js"></script>
<script type="text/javascript" src="${ctx }/BSPage/js/jsonFormat.js"></script> 
<script type="text/javascript" src="${ctx }/BSPage/homepage/js/browser.js"></script> 
  <style type="text/css">
  	.none{
  		display:none;
  	}
  	/* ------------------------------------------------------------------------------
	以下是为了调整头部在ie8下的兼容问题的临时解决方案:将头部部分css提取到页面里，提高优先级
-------------------------------------------------------------------------------*/	
  	/* ------------------------------------------------------------------------------
	Header
-------------------------------------------------------------------------------*/

  </style>
 </head> 
  <body> 
 <div id="header" class="fixed"> 
   <div id="navigation" class="header-content clearfix"> 
   <nav class="navigation" role="navigation"> 
     <ul class="primary-nav"> 
      
     <c:if test='${empty sessionScope.bsUser }'>
      		 <a onclick="toRegister('${ctx}')" id="">注册</a> <b>|</b> 
             <a onclick="toLogin('${ctx}')" id="cLogin" > 登录</a>
      </c:if>
      <c:if test='${not empty sessionScope.bsUser }'>
      		<li class="gIdentity">
      		 <div>
              <ul class="cxnavgation">
               <li class="welcom">
               <div class="cxqId">欢迎你：
               <span class="cClick">
                  <span class="cWelcome">${sessionScope.bsUser.loginId }</span>
                  <span class="logoDown"></span>
               </span>
              |<span class="ccSpan"><a class="cxpointer" onclick="signOut('${ctx}')">注销</a></span>              
               </div>
<%--                 <div class="send"><p class="cxpointer" onclick="signOut('${ctx}')">注销</p><div class="arrow"></div></div>
 --%>              </li>
             <li url="/bs/platForm/index.do" baseUrl="${ctx }" class="gPlate"><a>平台政策</a></li>
             <li url="/bs/userCenter/index.do" baseUrl="${ctx }" class="gUser" name="userCenter"><a>工作台</a></li> 
             <li url="/bs/dataAbility/index.do" baseUrl="${ctx }" class="gServe"><a>数据服务能力</a></li> 
             <li class="firstli" url="/bs/homePage/homePage.do" baseUrl="${ctx }" class="gHome"><a>首页</a></li> 
             <li class="nav_hide"><i></i></li>
            </ul>
            </div>
      </li>
      </c:if>
     </ul> 
    </nav> 
    <!-- <a class="logo" >征信产品一体化管控平台</a>  -->
     <img src="${ctx }/BSPage/homepage/images/logo.png" class="logo">
     </div> 
  </div>  
  <!--Banner--> 
  <div id="mainContent" class="mainContentPadding">
   	<jsp:include page="homePage.jsp"></jsp:include>
</div>
  <!--footer--> 
  <div class="footer"> 
   <div class="contain"> 
    <div class="lable">
     <!-- <a href="${ctx }/bs/homePage/index.do">关于我们</a> | 
     <a href="${ctx }/bs/homePage/index.do"> 联系我们 </a> |
     <a id="complain" href="${ctx }/bs/homePage/index.do"> 投诉举报 </a> | 
     <a href="${ctx }/bs/homePage/index.do"> 常见问题</a> |
     <a href="${ctx }/bs/homePage/index.do"> 帮助中心 </a> -->
     <a href="javascript:;">关于我们</a> | 
     <a href="javascript:;"> 联系我们 </a> |
     <a id="complain" href="javascript:;"> 投诉举报 </a> | 
     <a href="javascript:;"> 常见问题</a> |
     <a href="javascript:;"> 帮助中心 </a> 
    </div>  
    <div class="campacy">
     技术支持：北京东方国信科技股份有限公司 | 经营许可证编号 ： 京ICP备09031924号
    </div> 
   </div> 
  </div>   
 </body>
<script>
	$(function () {
		carousel();
		//公共头鼠标划入鼠标点击效果
		var d_navas = $(".primary-nav a").not(".ccSpan a");
		d_navas.on("click", mouse);
		d_navas.hover(mouseIn, mouseOut);
		//鼠标点击
		function mouse() {
			//d_navas.css({ "color": "#42a5fa", "border-top": "0 solid #42a5fa" });
			d_navas.css({"border": "0","background": "none" ,"color":"#23262a"});
			d_navas.removeClass("on");
			$(this).addClass("on");
		    mouseIn.call(this);
		}
		//鼠标滑入
		function mouseIn() {
			$(this).css({ "border-top": "3px solid #3675bd","background": "#f1f2f2","color":"#3675bd" });
		};
		
		//首页默认选中状态
		mouse.call(d_navas.eq(3));
		//d_navas.eq(2).trigger(mouseIn);
        //鼠标滑出
		function mouseOut() {
			var _this = $(this);
			if (!_this.hasClass("on"))
				_this.css({ /* "color": "white", */ "border": "0","background": "none","color":"#23262a" });
		}
        //头部点击欢迎你出现模拟select下拉框
            $(".cClick").each(function () {
                var this_div = $(".send");
                var this_span=$(".logoDown");
                $(this).click(
                function () { 
                	this_div.slideToggle();
                }
           );
          })
        //展示区导航栏鼠标划入效果
  		$("#mainContent ").on("mouseenter"," .cLayout>li",function(){
  			$(".cLayout>li").changeLayout({
  				index : 0,
          		type : "hover",//改变触发效果（点击click或者悬浮hover）
          		callback : function (elem) {}
        					});
  		});
  		$("#mainContent").on('click'," .phoneUl li",function(){
  		     $(".phoneUl li a").removeClass("on");
  		     $(this).find("a").addClass("on");
  		});  
  	});
  	//jquery插件扩展
      $.fn.changeLayout = function (options) {
        var
        _this = this,
        _options = $.extend({
            index : 0,
            type : "hover",//
            callback : function (elem) {}
          }, options || {});

        //扩展DOM元素，为当前元素添加方法
        _this.each(function (i) {
          //改变布局
          this.toChange = function () {
            var that = $(this);
            //为第一个div容器添加背景颜色（选中）
            that.find(".cBlock div:first").addClass("bHeader");
            //未选中的元素显示集合操作项
            that.find("label").show();
            //选中元素的调整布局方式（float排列布局）
            that.find(".cDown li").not("li:first").each(function (i) {
              $(this).addClass("l" + (i + 1));
            });
            _options.callback(that);
          };
          //还原布局
          this.reduction = function () {
            var that = $(this);
            //还原背景选中的效果
            that.closest(".cContent").find(".cBlock").each(function () {
              var _this = $(this);
              _this.find("div:first").removeClass("bHeader").addClass("cHeader");
              _this.find("label").hide();
              _this.find(".cDown li").removeAttr("class");
            });
          };
        });

        switch (_options.type) {

        case "hover":
          //鼠标滑入（出）效果
          _this[_options.type](function () {
            this.reduction();
            this.toChange();
          }, function () {
            //this.reduction();
          });
          break;
        case "click":
          //鼠标点击效果
          _this.on("click", function () {
            this.reduction();
            this.toChange();
          });
          break;

        }
        
	}
	</script>
</html>