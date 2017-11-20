<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%--<meta http-equiv="X-UA-Compatible" content="IE=7"></meta>--%>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<title>聚融通生态数据平台</title>
<link href="<%=request.getContextPath() %>/static/css/global.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/static/css/gzl.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath() %>/static/js/jquery-2.2.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/static/js/common.js"  type="text/javascript" ></script>
<script src="<%=request.getContextPath() %>/static/js/echarts-all.js" type="text/javascript" ></script>

<style type="text/css">
body{ background: #192242;}
</style>
</head>
<body>
<div class="main clear">
  <div class="part1 fl">
    <p class="title">聚融通生态数据平台</p>
    <div class="content">
      <div class="today">
        <h3 class="total">&nbsp;&nbsp;&nbsp;今日交易<span id="total-sum"  class="sum"></span></h3>
        <div id="plant-sum-money" class="plant-sum"></div>
      </div>
	  <div class="today">
		<h3 class="total">&nbsp;&nbsp;&nbsp;今日交易 <span id="todaySum" class="sum"></span></h3>        
	  </div>      
      <div id="plant-sum" class="plant-sum"></div>
  </div>
    
  <div class="plat-time">
    <h2 class="plat-today">今日时段交易</h2>
    <span class="plat-dd">时</span>
    <div id="leftplat" class="leftplat"></div>
  </div>

</div>
<div class="part2 fr">
  <div class="box">
    <h2 class="title">最近7天交易额占比</h2>
    <span class="danwei fl">单位：万元</span>
  </div>
  <div class="pie clear" style="" >
     <div  id="channel" class="fl"  style=" width:50%; height:100%;background:#ccc;"></div>
     <div  id="pay" class="fr"  style="width:50%; height:100%;background:#ccc;"></div>
  </div>
  <div class="mix">
      <h2 class="title">最近7天交易</h2>
      <div id="platform"></div>
  </div>
  </div>
</div>

<div class="footer"></div>

<script type="text/javascript">

(function(){
	//非谷歌浏览器设置固定高度
	var ua=window.navigator.userAgent, 
	ret=""; 
	if(!/Chrome/g.test(ua)){ 
	  var $pieBox = $('.part2 .pie');
	  $pieBox.css({height:'400px'})
	}
})();

// 饼图
var pieUpdate;
var pie=function (config){
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById(config.id));
  pieUpdate=myChart;
  // 指定图表的配置项和数据
  option = {
	//去除初始化没有数据的动图
	  noDataLoadingOption: {
            text: '暂无数据',
            effect: 'bubble',
            effectOption: {
                effect: {
                    n: 0
                }
            }
    },
    tooltip : {
      trigger: 'item',
      formatter: "{b} : {c}万 "
    },
    legend: {
      orient : 'horizontal',
      fontFamily:'Microsoft Yahei',
      itemGap:10 ,
      textStyle:{ color:'#fff',fontSize:8},
      x : 'left',
      data:config.legend
    },
    color:config.color,
    calculable : false,
    series : [
      {
        type:'pie',
        radius : [config.rdx,config.rdy],
        center: [config.cx,config.cy],
        itemStyle : {
          normal : {
            label : {
              show : true,
              textStyle: {
                	fontSize:10,
                	color:'#fff'
                },
             // formatter: "{c}  ({d}%)"// {b} :{c}万元
                formatter:function(params, ticket, callback){   
              	  var res=params.value+' , '+parseFloat(params.percent).toFixed(1)+'%'
              	  return res;
                },
                position:'outer'
            }
          },
          lineStyle:{color:'#2e57ec'},
        },
        data:config.data
      }
    ]
  };

  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
};
  
//柱状折线混合图
var  platUpdate;
var platform=function (config){
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById(config.id));
  platUpdate=myChart;
  // 指定图表的配置项和数据
  option = {
    color:config.color,
    tooltip : {
      trigger: 'axis'
    },      
    grid:{
      y:config.y
    },
    legend: {
      orient:'horizontal',
      x:'125px',
      textStyle:{
        color:'#fff',
        fontSize:8
      },
      data:config.legend
    },
    calculable : true,
    xAxis : [
      {
        type : 'category',
        boundaryGap : config.boundaryGap,
        splitLine:{//网格线
          show:true,
          lineStyle:{
            type:'dashed',
            color:'#4a516a',
            width: 2
          }
        },
        axisLine : {    // 轴线
          show: true,
          lineStyle: {
            color: '#4a516a',
            type: 'dashed',
            width: 2
          }
        },
        axisTick:{
      	  show:true,
      	  length:10,
      	  lineStyle:{
      		  color: '#fff',
      		  width: 1
      	  }
        },
        axisLabel:{//主轴上文字的设置
          margin:20,
          textStyle:{
            color:'#fff',
            fontSize:10
          }
        },
        data :config.axisLine          
      }
    ],
    yAxis : [
      {
        type : 'value',
        show:true,
        splitNumber:config.splitNumber,
        nameTextStyle:{ color:'#fff',fontSize:8},
        max:config.maxAmount,
        min:0,
        name:'万元',
        nameLocation:'end',
        axisLine : {    // 轴线
          show: true,
          lineStyle: {
            color: '#4a516a',
            type: 'dashed',
            width: 2
          }
        },
        splitLine:{
          show:true,
          lineStyle:{
            type:'dashed',
            color:'#4a516a',
            width: 2
          }
        },
        axisLabel:{
          margin:20,
          textStyle:{
            color:'#fff',
            fontSize:10
          },
          formatter:function(value){ return value.toFixed(2)}
        }
      },
      {
          type : 'value',
          name : '笔数',
          max:config.maxBill,
          min:0,
          nameTextStyle:{ color:'#fff',fontSize:8},
          axisLabel:{
              margin:20,
              textStyle:{
                color:'#fff',
                fontSize:10
              },
             formatter:function (value){ return value.toFixed(0)}
            },
            splitLine:{
                show:true,
                lineStyle:{
                  type:'dashed',
                  color:'#4a516a',
                  width: 2
                }
              },
              axisLine : {    // 轴线
                  show: true,
                  lineStyle: {
                    color: '#4a516a',
                    type: 'dashed',
                    width: 2
                  }
                }
          
      }
      
    ],
    calculable : false,
    series : [

      {
        name:'交易额 ',
        type:'bar',
        zlevel:0,
        
        
        data:config.barData
      },
      {
          name:'交易笔数',
          type:'line',
          zlevel:1,
          
          itemStyle :{
              normal : {
                color:'#188E24',
                lineStyle:{
                  color:config.lineColor
                }
              }
            },
          yAxisIndex: 1,
          data:config.lineData
      }
    ]
  };
  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
} 

//折线柱状混合图--右侧
var  platUpdateRight;
var platformRight=function (config){
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById(config.id));
  platUpdateRight=myChart;
  // 指定图表的配置项和数据
  option = {
    color:config.color,
    tooltip : {
      trigger: 'axis'
    },      
    grid:{
      y:config.y
    },
    legend: {
      orient:'horizontal',
      x:'125px',
      textStyle:{
        color:'#fff',
        fontSize:8
      },
      data:config.legend
    },
    calculable : true,
    xAxis : [
      {
        type : 'category',
        boundaryGap : config.boundaryGap,
        splitLine:{//网格线
          show:true,
          lineStyle:{
            type:'dashed',
            color:'#4a516a',
            width: 2
          }
        },
        axisLine : {    // 轴线
          show: true,
          lineStyle: {
            color: '#4a516a',
            type: 'dashed',
            width: 2
          }
        },
        axisTick:{
      	  show:true,
      	  length:10,
      	  lineStyle:{
      		  color: '#fff',
      		  width: 1
      	  }
        },
        axisLabel:{//主轴上文字的设置
          margin:20,
          textStyle:{
            color:'#fff',
            fontSize:10
          }
        },
        data :config.axisLine          
      }
    ],
    yAxis : [
      {
        type : 'value',
        show:true,
        splitNumber:config.splitNumber,
        nameTextStyle:{ color:'#fff',fontSize:8},
        max:config.maxAmount,
        min:0,
        name:'万元',
        nameLocation:'end',
        axisLine : {    // 轴线
          show: true,
          lineStyle: {
            color: '#4a516a',
            type: 'dashed',
            width: 2
          }
        },
        splitLine:{
          show:true,
          lineStyle:{
            type:'dashed',
            color:'#4a516a',
            width: 2
          }
        },
        axisLabel:{
          margin:20,
          textStyle:{
            color:'#fff',
            fontSize:10
          },
          formatter:function(value){ return value.toFixed(2)}
        }
      },
      {
          type : 'value',
          name : '笔数',
          max:config.maxBill,
          min:0,
          nameTextStyle:{ color:'#fff',fontSize:8},
          axisLabel:{
              margin:20,
              textStyle:{
                color:'#fff',
                fontSize:10
              },
             formatter:function (value){ return value.toFixed(0)}
            },
            splitLine:{
                show:true,
                lineStyle:{
                  type:'dashed',
                  color:'#4a516a',
                  width: 2
                }
              },
              axisLine : {    // 轴线
                  show: true,
                  lineStyle: {
                    color: '#4a516a',
                    type: 'dashed',
                    width: 2
                  }
                }
          
      }
      
    ],
    calculable : false,
    series : [

      {
        name:'交易额 ',
        type:'bar',
        zlevel:0,
        
        
        data:config.barData
      },
      {
          name:'交易笔数',
          type:'line',
          zlevel:1,
          
          itemStyle :{
              normal : {
                color:'#188E24',
                lineStyle:{
                  color:config.lineColor
                }
              }
            },
          yAxisIndex: 1,
          data:config.lineData
      }
    ]
  };
  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
} 


// 格式化数字
function formatNumber(num , format , dot ){
/***
 * num : 具体数字
 * format: 格式化  比如  以万为单位，那么就是 10000  
 * dot : 保留小数位
 */
  return (num/format).toFixed(dot);
}

/*数字滚动增长*/
(function ($) {
        $.fn.numberAnimate = function (setting) {
            var defaults = {
                speed : 1000, //动画速度
                num : "", //初始化值
                symbol : '', //默认的分割符号，千，万，千万
                dot : 0 //保留几位小数点
            }
            //如果setting为空，就取default的值
            var setting = $.extend(defaults, setting);
            //如果对象有多个，提示出错
            if ($(this).length > 1) {
                alert("just only one obj!");
                return;
            }
            //如果未设置初始化值。提示出错
            if (setting.num == "") {
                alert("must set a num!");
                return;
            }
            var nHtml = '<div class="mt-number-animate-dom" data-num="{{num}}">\
                <span class="mt-number-animate-span">0</span>\
                <span class="mt-number-animate-span">1</span>\
                <span class="mt-number-animate-span">2</span>\
                <span class="mt-number-animate-span">3</span>\
                <span class="mt-number-animate-span">4</span>\
                <span class="mt-number-animate-span">5</span>\
                <span class="mt-number-animate-span">6</span>\
                <span class="mt-number-animate-span">7</span>\
                <span class="mt-number-animate-span">8</span>\
                <span class="mt-number-animate-span">9</span>\
                <span class="mt-number-animate-span">0</span>\
                <span class="mt-number-animate-span">1</span>\
                <span class="mt-number-animate-span">2</span>\
                <span class="mt-number-animate-span">3</span>\
                <span class="mt-number-animate-span">4</span>\
                <span class="mt-number-animate-span">5</span>\
                <span class="mt-number-animate-span">6</span>\
                <span class="mt-number-animate-span">7</span>\
                <span class="mt-number-animate-span">8</span>\
                <span class="mt-number-animate-span">9</span>\
            </div>';
    var nHtmlSpot = '<div class="mt-number-animate-dom" data-num="{{num}}">\
                <span class="mt-number-animate-span">.</span>\
            </div>';
            //数字处理
            var numToArr = function (num) {
                num = parseFloat(num).toFixed(setting.dot);
                if (typeof(num) == 'number') {
                    var arrStr = num.toString().split("");
                } else {
                    var arrStr = num.split("");
                }
                //console.log(arrStr);
                return arrStr;
            }
            //设置DOM symbol:分割符号
            var setNumDom = function (arrStr) {
                var shtml = '<div class="mt-number-animate">';
                for (var i = 0, len = arrStr.length; i < len; i++) {
                	if(setting.dot==0){
                        shtml += nHtml.replace("{{num}}", arrStr[i]);
                    }else {
                        if (i == arrStr.length - setting.dot - 1) {
                            shtml += nHtmlSpot.replace("{{num}}", arrStr[i]);
                        } else {
                            shtml += nHtml.replace("{{num}}", arrStr[i]);
                        }
                    }
                }
                shtml += '</div>';
                return shtml;
            }
            //执行动画
            var runAnimate = function ($parent) {
                $parent.find(".mt-number-animate-dom").each(function () {
                    var num = $(this).attr("data-num");
                    num = (num == "." ? 0 : num);
                    var spanHei = $(this).height() / 20; //11为元素个数
                    var thisTop = -num * spanHei;
                    var nowTop = parseInt($(this).css('top'));
                    var that = this;
                    if (thisTop > nowTop) {
                        var totalH = -num * spanHei - spanHei * 10 + 'px';
                        $(this).animate({
                            top : totalH
                        }, setting.speed, function () {
                            $(this).css({ 'top' : thisTop })
                        });

                    } else {
                        if (thisTop != nowTop) {
                            $(this).animate({
                                top : thisTop
                            }, setting.speed);
                        }
                    }

                });
            }
            //初始化
            var init = function ($parent) {
                //初始化
                $parent.html(setNumDom(numToArr(setting.num)));
                runAnimate($parent);
            };
            //重置参数
            this.resetData = function (num) {
                var newArr = numToArr(num);
                var $dom = $(this).find(".mt-number-animate-dom");
                if ($dom.length != newArr.length) {
                    $(this).html(setNumDom(numToArr(num)));
                } else {
                    $dom.each(function (index, el) {
                        $(this).attr("data-num", newArr[index]);
                    });
                }
                runAnimate($(this));
            }
            //init
            init($(this));
            return this;
        }
    })($);



//加载饼形数据 	     支付方式占比
var pieRight=function (){	
	var array=[];
	var arrayLegend = [];
	var color=[];
	$.ajax({
         type: 'POST',
         url: '<c:url value="/pstatsDisPlay/getPayTypeByDay"/>',
         data: {'rownum':7},
         dataType: 'json',
         async:false,
         success: function(data){
   	  		var date = eval(data);
   	  		//console.log(data);
   	  	var colorData=['#0bd508','#026dda', '#6ba7ee','#abff94','#037f32','#01aea5',
    	               '#f2b300','#80531a','#facf88','#fff55b','#601a85','#c391bf',
    	               '#00c5ed','#79c087','#d3b0ff','#c2658d','#fe9fa0'];
		   	 colorObj = {
		 			'0301':'#0bd508',
		 			'0401':'#026dda',
		 			'0402':'#6ba7ee',
		 			'0302':'#abff94',
		 			'0303':'#037f32',
		 			'2105':'#01aea5',
		 			'2208':'#f2b300',
		 			'0701':'#80531a',
		 			'0107':'#facf88',
		 			'0702':'#fff55b',
		 			'0311':'#601a85',
		 			'0403':'#c391bf',
		 			'0404':'#00c5ed',
		 			'0304':'#79c087',
		 			'2209':'#d3b0ff',
		 			'0110':'#c2658d',
		 			'2206':'#fe9fa0',
		 			'2112':'#52f2ff',
		 			'spare':'#0aafac',
		 			'spare':'#00cdd6',
		 			'2215':'#5955c8',
		 			'public':'#e3f9fd'
		 	}
   	  		var obj={},objLegend={};
   	  		         	  		
   	  		for(var i=0;i<date.length;i++){
   	  			obj={},objLegend={};
   	  			
   	  		
   	  			
   	  			//obj.name=date[i].NAME.substr(0,date[i].NAME.length-2); 	  			
   	  			if(data[i].PAYSUCCAMT !=0){
	   	  			if(data[i].NAME.substr(data[i].NAME.length-2,data[i].NAME.length)=='支付'){
	   	   	  		  obj.name=date[i].NAME.substr(0,date[i].NAME.length-2); 	  		
	   	     	   }else{
		   	     		if(''+data[i].PAYTYPE+data[i].CODE=='0110'){
		   	     			obj.name='POS收单(贷记卡)';
	            	   }else if(''+data[i].PAYTYPE+data[i].CODE=='0107'){
	            		   obj.name='POS收单(借记卡)';
	            	   }else{
	            		   obj.name=date[i].NAME; 
	            	   }
	   	     		   	  		
	   	     	   }
   	  			    obj.value=formatNumber(data[i].PAYSUCCAMT ,10000,2);
   	  			    
   	  			    var haveFlag = false;
	   	  			for(var key in colorObj){
	   	  				
	       				if(''+data[i].PAYTYPE+data[i].CODE==key){
	       					color.push(colorObj[key]);
	       					haveFlag = true;
	       				}
	       			}
	       			if(haveFlag==false){
	       				color.push(colorObj['public']);
	       				haveFlag = false;
	       			}
   	  			    
   	  			}else{
   	  			    obj.value=0+'.'+0+0;
   	  			}
   	  			if(date[i].PAYSUCCAMT){
   	  			    array.push(obj);	
   	  			    arrayLegend.push({name:obj.name ,icon:'bar'}); 
   	  			} 			         	  			   	  		
   	  		}      	  	
         },
         error: function(xhr, type){console.log("")}
     });		
	return [array,arrayLegend,color]
}

//加载饼形数据 	     支付通道占比

var pieLeft=function (){	
	var array=[];
	var arrayLegend = [];
	var color=[];
	$.ajax({
         type: 'POST',
         url: '<c:url value="/pstatsDisPlay/getChannelByDay"/>',
         data: {'rownum':7},
         dataType: 'json',
         async:false,
         success: function(data){
   	  		var date = eval(data).sort(function(a,b){return b.PAYSUCCAMT-a.PAYSUCCAMT});
            console.log('date',date);
   	  	   
   	  		var colorData2=['#f2b300','#80531a','#fff55b','#601a85','#c391bf',
   	  		                '#0bd508','#026dda', '#6ba7ee','#abff94','#037f32','#01aea5',
        	               '#00c5ed','#79c087','#d3b0ff','#c2658d','#fe9fa0','#facf88','#e3f9fd'];
   	  		var obj={},objLegend={};
   	  		         	  		
   	  		for(var i=0;i<date.length;i++){
   	  			obj={},objLegend={};
   	  			obj.name=date[i].DIRECTBRANCHNAME;		
              
   	  			
   	  			if(data[i].PAYSUCCAMT !=0){
   	  			
   	  			   // obj.value=formatNumber(data[i].PAYSUCCAMT ,10000,2);
   	  			obj.value=formatNumber(data[i].PAYSUCCAMT ,10000,2);
   	  			
   	  			}else{
   	  			    obj.value=0+'.'+0+0;
   	  			}
   	  			if(date[i].PAYSUCCAMT){
   	  			   array.push(obj);	
   	  			   arrayLegend.push({'name':date[i].DIRECTBRANCHNAME ,icon:'bar'}); 
   	  			   color.push(colorData2[i]);
   	  			} 			         	  			   	  		
   	  		}      	  	
         },
         error: function(xhr, type){}
     });		
	 return [array,arrayLegend,color]
}


//柱状折线图

//兼容性处理
var browser = {
  versions: function () {
    var u = navigator.userAgent, app = navigator.appVersion;
    return {
      trident: u.indexOf('Trident') > -1, //IE内核
      presto: u.indexOf('Presto') > -1, //opera内核
      webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
      gecko: u.indexOf('Gecko') > -1 &&  u.indexOf('KHTML') == -1, //火狐内核
      mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
      ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
      android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
      iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
      iPad: u.indexOf('iPad') > -1, //是否iPad
      webApp: u.indexOf('Safari') == -1//是否web应该程序，没有头部与底部
    };
  }(),
  language: (navigator.browserLanguage || navigator.language).toLowerCase()
};

var fontSize,width,height;
var fnfontSize=function(){
  fontSize=$(window).width()/128;
  $(window).resize(function(){
    fontSize=$(window).width()/128;
  });
  return fontSize;
};
fontSize=fnfontSize();
//非webkit处理
if(!browser.versions.webKit ){
  height=fontSize*27.7;
  $('.part1 .title').css({
  	'width':'100rem',
  	'height':'15rem',
  	'line-height':'13rem'
  });
  
  $('.footer').css({
  	'height':'4.5rem'
  });
}else{
  width=fontSize*58;
  height=fontSize*28;// 左上侧高度
}
//$('.part2 .pie').height(height);//左上侧高度

if(browser.versions.trident || browser.versions.gecko){
	$('.main').css('padding-top','6rem');
	$('.part1 .title').css({
		'text-indent':'5rem',
		'letter-spacing':'2rem',
		'width':'113rem',
		'height':'16.5rem',
		'line-height':'16rem'
	});
	$('.part1 .plat-today').css({
		'top':'1rem',
		'left':'1rem'
	});
	$('.part1 .content').css({
		'margin-top':'5.4rem'
	});
	$('.part1 .today .total').css({
		'margin-bottom':'5.4rem'
	});
	$('.plant-sum').css({
		'padding-bottom':'3rem'
	});
	
	
	
	$('.part2 .title').css({
		'margin-top':'6.5rem',
		'font-size':'4.5rem'
	});
	$('.part2 .box .danwei').css({
		'font-size':'4.5rem'
	});
	$('.part1 .plat-today').css({
		'font-size':'4.5rem'
	});
	
	
	
	$('.part2 .pie').css({
		'margin-top':'5.5rem'
	});
	$('.part2 .mix .title').css({
		'top':'-5.6rem'
	});	
	$('.part1 .plat-dd').css({
		'font-size':'4.5rem',
		'bottom':'7.5rem',
		'left':'15rem'
	});
	
}

function resetCSS(){	
	$('.part2 .title').css({
		'font-size':0.9*fontSize
	});
	$('.part2 .box .danwei').css({
		'font-size':0.9*fontSize
	});
	$('.part2 .mix .title').css({
		'font-size':0.9*fontSize
	});
	$('.part1 .plat-today').css({
		'font-size':0.9*fontSize
	});	
	$('.part1 .plat-dd').css({
		'bottom':1.7*fontSize
	});
}
resetCSS();






//平台交易额，交易笔数（rownum天内的）  
var platforMright=function (){
	$('.part2 .mix #platform').height(fontSize*25.8);
	var array = [],arrayMoney = [],arrayCount = [],maxAmount=0,maxBill=0;
	$.ajax({
	    type: 'POST',
	    url: '<c:url value="/pstatsDisPlay/getTotalAndAmtByDay"/>',  		    
	    data: {'rownum':7},
	    dataType: 'json',
	    async:false,
	    success: function(data){     		    	  
	    	
	 		var date = eval(data);	 			 		
	 		
	 		for(var i=0;i<date.length;i++){
	 			if(maxAmount < data[i].PAYSUCCAMT){
	 				maxAmount=data[i].PAYSUCCAMT;
	 			}

	 			if(maxBill < data[i].PAYTOTAL){
	 				maxBill=data[i].PAYTOTAL;
	 			}
	 			array[i] =  date[i].TRANDAY.substring(8)+'日';
	 			arrayMoney[i] =  formatNumber(date[i].PAYSUCCAMT,10000,2);
	 			arrayCount[i] =  date[i].PAYTOTAL;
	 		}
	 		maxAmount = formatNumber(maxAmount,10000,2); 	
	 		
	    },
	    error: function(xhr, type){}
	});
	return [array,arrayMoney,arrayCount,maxAmount,maxBill];
};
  	  	
  	  		
$('.leftplat').width(width).height(fontSize*38.3);

var scrollData=function (){
	var arrayDay = [],arrayMoney = [],arrayHour = [],arrayCount = [],maxAmount=0,maxBill=0;;
	$.ajax({
	     type: 'POST',
	     url: '<c:url value="/pstatsDisPlay/getTotalAndAmtByHour"/>',	
	     data: {},
	     dataType: 'json',
	     async:false,
	     success: function(data){    
	   	//平台交易额和交易笔数（小时）	  	  		
	 		var date = eval(data);
	  	
		 	if(date.length){
		 		//$('#leftplat').html("");
		  		for(var i=0;i<date.length;i++){
		  			if(maxAmount < data[i].PAYSUCCAMT){
		 				maxAmount=data[i].PAYSUCCAMT;
		 			}

		 			if(maxBill < data[i].PAYTOTAL){
		 				maxBill=data[i].PAYTOTAL;
		 			}
		  			arrayDay[i] =  date[i].TRANDAY;
		  			arrayMoney[i] =  formatNumber( date[i].PAYSUCCAMT,10000,2);
		  			//arrayHour[i] =  date[i].TRANHOUR+'时';
		  			arrayHour[i] =  date[i].TRANHOUR;
		  			arrayCount[i] =  date[i].PAYTOTAL;
		  		}
		  		if(arrayHour.length > 24){
		  		   arrayHour.length=24;  //限制24小时
		  		}	
		  		maxAmount=formatNumber( maxAmount,10000,2);
		 	}else{
		 		$('#leftplat').html("<div style='color:#fff; width:100%; line-height:550px; text-align: center;'>暂无数据</div>");
			}   	  		  	  	
	     },
	     error: function(xhr, type){}
	 });
    return [arrayHour,arrayMoney,arrayCount,maxAmount,maxBill];           
 };	
  		
 
 var str1 = 0, str2 = 0, str3 = 0, str4 = 0;
/*  var numRun1 = $("#plant-sum-money").numberAnimate({
     num : '0',
     dot : 2,
     speed : 2000
 });
 var numRun2 = $("#plant-sum").numberAnimate({
     num : '0',
     dot : 0,
     speed : 2000
 });
 var numRun3 = $("#total-sum").numberAnimate({
     num : '0',
     dot : 2,
     speed : 2000
 });
 var numRun4 = $("#todaySum").numberAnimate({
     num : '0',
     dot : 0,
     speed : 2000
 }); */
 
//平台总交易
function bill(){
	$.ajax({
      type: 'POST',
      url: '<c:url value="/pstatsDisPlay/getTotalAndAmtByDayOrAll"/>',  	    
      data: {},
      dataType: 'json',
      success: function(data){   	    	  
    	//平台总交易
    	console.log(data,'data.........................')
  		var date = eval(data);
  		date.PAYAMT;//金额
  		date.PAYTOTAL;//笔数
  		var str1='',str2='';
  		
  	  	str1="<div id='plant-sum-money' class='plant-sum'><span>平台总交易</span>&nbsp;&nbsp;&nbsp;<span id='money' class='num'>"+formatNumber(data[0].PAYAMT,10000,2)+"&nbsp;万元</span></div>";
  	    str2="<div id='plant-sum' class='plant-sum'><span>平台总交易</span>&nbsp;&nbsp;&nbsp;<span id='sum' class='num'>"+date[0].PAYTOTAL+"&nbsp;笔</span></div>";
  		
  		if($('#plant-sum-money').html()){
  			$('#plant-sum-money').html('');
  		}
  		if($('#plant-sum').html()){
  			$('#plant-sum').html('');
  		}
  		 
  		$('#plant-sum-money').append(str1);
  		$('#plant-sum').append(str2);
  		
  		//numRun1.resetData(str1)
    	  		  	  	
      },
      error: function(xhr, type){}
  });
	/* dsdasds */
}
//格式化时间
function formatTime(){
	var date=new Date();
	var year=date.getFullYear().toString();
	var month=(date.getMonth()+1).toString();
	var day=date.getDate().toString();
	if(month.length===1){
		month='0'+month;
	}
	if(day.length===1){
		day='0'+day;
	}
	var nowTime=year+month+day;
	return nowTime;
}
//今日交易   有参数
function todayBill(){	  
	var nowTime=formatTime();
	$.ajax({
	      type: 'POST',
	      url: '<c:url value="/pstatsDisPlay/getTotalAndAmtByDayOrAll"/>',    	      
	      data: {'sysdate':nowTime},
	      dataType: 'json',
	      success: function(data){ 
	    	  if(data&&data.length>=2&&data[1].refreshType=='true'){
	          		var reloaded = sessionStorage.getItem('reloaded');
	          		if(reloaded==null){
	          			sessionStorage.setItem('reloaded','yes');
	          			window.location.reload();
	              		return;
	          		}
	          		
	          	  }
          	  
          	  
	    	  
	    	//平台总交易
	  		var str1=null , str2=null;
	  		if(data[0].PAYAMT !=0){
	  		  
	  		   str1="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='numTxt' data-time='2' data-value='"+formatNumber(data[0].PAYAMT , 10000, 2)+"'>"+formatNumber(data[0].PAYAMT , 10000, 2)+"</span>&nbsp;万元";
	  		   str2="&nbsp;&nbsp;&nbsp;&nbsp;<span>"+data[0].PAYTOTAL+"</span>&nbsp;笔";
	  		}else{
	  			str1="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='numTxt' data-time='2' data-value='"+0.00+"'>0.00</span>&nbsp;万元";	
	  			str2="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>0</span>&nbsp;笔";
	  		}
  		    if($('#total-sum').html()){
  			  $('#total-sum').html(''); 
  		    }
  		    if($('#todaySum').html()){
  			  $('#todaySum').html('');
  		    }

  		    $('#total-sum').append(str1);
  		    $('#todaySum').append(str2);  
  		    	  		  	  	
	      },
	      error: function(xhr, type){}
	  });
} 


 
//饼图更新数据
function updatePie(data,legendData,colorData){
    var option = pieUpdate.getOption();
    
    option.color=colorData;
    option.legend.data=legendData;
    option.series[0].data=data;
    
    pieUpdate.setOption(option); 
}
// 柱状图更新数据
function updatePlat(axisLine ,lineData ,barData, maxAmount, maxBill){
    var option = platUpdate.getOption();
    option.yAxis[0].max = maxAmount;
    option.yAxis[1].max = maxBill;
    option.xAxis.data = axisLine;   
    option.series[0].data=lineData;
    option.series[1].data=barData;
    platUpdate.setOption(option); 	 
}

//柱状图更新数据--右侧
function updatePlatRight(axisLine ,lineData ,barData, maxAmount, maxBill){
    var option = platUpdateRight.getOption();
    option.yAxis[0].max = maxAmount;
    option.yAxis[1].max = maxBill;
    option.xAxis.data = axisLine;   
    option.series[0].data=lineData;
    option.series[1].data=barData;
    platUpdateRight.setOption(option); 	 
}
 
$(document).ready(function (){
	//平台总交易
	bill();
	
	//今日交易
	todayBill();
	 
	//初始化左侧饼图形
	var dataLPie=pieLeft();
	if(dataLPie&&dataLPie[0]&&dataLPie[0].length>0){
		pie({
	  	    id:'channel',
	  	    rdx:'12%',
	  	    rdy:'35%',
	  	    cx:'50%',
	      	cy:'48%',
	      	legend:dataLPie[1],
	      	color:dataLPie[2],
	      	data:dataLPie[0]
	    });
	}else {
		$('#channel').append('<div style="color:#000;font-size:14px;margin-top:50%;text-align:center;">暂无数据</div>')
	}
	
	//初始化右侧饼图形
	   
    var dataPie =pieRight();	
    if(dataPie&&dataPie[0]&&dataPie[0].length>0){
    	pie({
      	    id:'pay',
      	    rdx:'12%',
      	    rdy:'35%',
      	    cx:'50%',
          	cy:'48%',
          	legend:dataPie[1],
          	color:dataPie[2],
          	data:dataPie[0]
        });
    }else {
    	$('#pay').append('<div style="color:#000;font-size:14px;margin-top:50%;text-align:center;">暂无数据</div>')
    }
	
	
	//初始化 右侧柱状图
	var platData= platforMright();   

	platformRight({
     	id:'platform',
     	y:'25%',

     	maxAmount:platData[3],
     	maxBill:platData[4],
     	boundaryGap:true,
     	color:["#2E57EC"],
     	legend:[{ name:'交易额',icon: 'image:// <%=request.getContextPath() %>/static/images/line-blue.jpg'},{ name:'交易笔数',icon: 'image://<%=request.getContextPath() %>/static/images/line.jpg'}],
		axisLine: platData[0],
		name:'单位：万',
		barData:platData[1],
		splitNumber:3,
		lineColor:'#188E24',
		lineData:platData[2]
	});
	
	//初始化左侧柱状图
	var scroll=scrollData();	

	platform({
	   id:'leftplat',
	   y:'15%',
	   maxAmount:scroll[3],
       maxBill:scroll[4],
	   boundaryGap:true,
	   color:["#2E57EC"],
       legend:[
          { name:'交易额', icon: 'image:// <%=request.getContextPath() %>/static/images/line-blue.jpg'},
          { name:'交易笔数',icon: 'image:// <%=request.getContextPath() %>/static/images/line.jpg'}
       ],
	   axisLine:scroll[0],
	   name:'单位：万',
	   barData:scroll[1],
	   splitNumber:5,
	   lineColor:'#188E24',
	   lineData:scroll[2]
	});
	
	//定时更新
	setInterval(function(){
		//平台总交易
		bill();
		
		//今日交易
		todayBill();
		
		// 饼图
		var dataPie=pieRight();									
		updatePie(dataPie[0],dataPie[1],dataPie[2]);

		var dataLPie=pieLeft();
		
		updatePie(dataPie[0],dataPie[1],dataPie[2]);
		
		//右侧柱形折线混合图	
		var  platData= platforMright();
       // console.log('右侧柱状图数据---',platData);
		updatePlatRight(platData[0],platData[1],platData[2],platData[3],platData[4]);					
		
		//左侧柱形折线混合图
		var scroll=scrollData();
		updatePlat(scroll[0],scroll[1],scroll[2],scroll[3],scroll[4]);
	//	console.log('左侧柱状图数据---',scroll);
		
	},5*1000);
});
</script>
</body>
</html>
