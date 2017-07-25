﻿﻿/*
* @Author: Administrator
* @Date:   2016-09-19 11:21:19
* @Last Modified by:   Administrator
* @Last Modified time: 2016-09-22 11:21:12
*/
/***********轮播图效果***********/
function getStyle(obj,name)
{
	if(obj.currentStyle)
	{
		return obj.currentStyle[name]
	}
	else
	{
		return getComputedStyle(obj,false)[name]
	}
}

function getByClass(oParent,nClass)
{
	var eLe = $(oParent).find('*');
	var aRrent  = [];
	for(var i=0; i<eLe.length; i++)
	{
		if(eLe[i].className == nClass)
		{
			aRrent.push(eLe[i]);
		}
	}
	return aRrent;
}

function startMove(obj,att,add)
{
	clearInterval(obj.timer)
	obj.timer = setInterval(function(){
	   var cutt = 0 ;
	   if(att=='opacity')
	   {
		   cutt = Math.round(parseFloat(getStyle(obj,att)));
	   }
	   else
	   {
		   cutt = Math.round(parseInt(getStyle(obj,att)));
	   }
	   var speed = (add-cutt)/4;
	   speed = speed>0?Math.ceil(speed):Math.floor(speed);
	   if(cutt==add)
	   {
		   clearInterval(obj.timer)
	   }
	   else
	   {
		   if(att=='opacity')
		   {
			   obj.style.opacity = (cutt+speed)/100;
			   obj.style.filter = 'alpha(opacity:'+(cutt+speed)+')';
		   }
		   else
		   {
			   obj.style[att] = cutt+speed+'px';
		   }
	   }
	   
	},30)
}

  window.onload = function(){
	  carousel();
  };
  function carousel(){
	  var oDiv = document.getElementById('playBox');
	  var oPre = document.getElementById('pre');
	  var oNext = document.getElementById('next');
	  var oUlBig = getByClass(oDiv,'oUlplay')[0];
	  var aBigLi = $(oUlBig).find('li');
	  var oDivSmall = getByClass(oDiv,'smalltitle')[0];
	  var aLiSmall = $(oDivSmall).find('li');
	  $(window).resize(function(){
		  for(var i = 0; i < aBigLi.length; i++){
			  $('#playBox .oUlplay').css('width',aBigLi.length*oDiv.offsetWidth);
			  $('#playBox .oUlplay li').eq(i).css('width',oDiv.offsetWidth);
		  }
//		  高度自适应
		  $('#playBox').css('height',$('.oUlplay img').width()*58/150);
//		  alert($('#playBox').height());
	  }).resize();
	  
	  function tab()
	  {
	     for(var i=0; i<aLiSmall.length; i++)
	     {	    	 
		    aLiSmall[i].className = '';
	     }
	     aLiSmall[now].className = 'thistitle';
	     startMove(oUlBig,'left',-(now*aBigLi[0].offsetWidth));
	     
	  }
	  var now = 0;
	  for(var i=0; i<aLiSmall.length; i++)
	  {
		  aLiSmall[i].index = i;
		  aLiSmall[i].onclick = function()
		  {
			  now = this.index;
			  tab();
		  }
	 }
	  
	  oPre.onclick = function()
	  {
		  now--;
		  if(now ==-1)
		  {
			  now = aBigLi.length-1;
		  }
		   tab();
	  }
	   oNext.onclick = function()
	  {
		   now++;
		  if(now ==aBigLi.length)
		  {
			  now = 0;
		  }
		  tab();
	  }
	  var timer = setInterval(oNext.onclick,3000) //滚动间隔时间设置
	  oDiv.onmouseover = function() { 
		  clearInterval(timer);
	  }
	   oDiv.onmouseout = function() {
		  timer = setInterval(oNext.onclick,3000); //滚动间隔时间设置
	  }
  }