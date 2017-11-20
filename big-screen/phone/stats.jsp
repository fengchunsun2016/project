<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no, email=no" />
<link type="text/css"
	href="<%=request.getContextPath()%>/static/css/swiper.min.css"
	rel="stylesheet" />
<link type="text/css"
	href="<%=request.getContextPath()%>/static/css/phone-gzl.css"
	rel="stylesheet" />

<title>聚融通生态数据平台</title>
</head>
<body>
	<div>
		<div class="index-wrap">
						<!--  <h1 class="title01 fl">聚融通生态数据平台</h1>  -->
						<div class="list box">
							<div class="item box-c">
								<h3 class="title02">
									今日交易 &nbsp;<span id="today-num01" class="today-num"></span><span class="today-company">万</span>
								</h3>
								<div class="clear_both"></div>

								<h4 class="title02">
									总交易&nbsp;&nbsp;<span id="today-num02" class="total-num"></span><span class="total-company">万</span>
								</h4>

							</div>
							<div class="item box-c">
								<h3 class="title02">
									今日交易&nbsp;&nbsp;<span id="today-num03" class="today-num"></span><span class="today-company">笔</span>
								</h3>

								<h4 class="title02">
									总交易&nbsp;&nbsp;<span id="today-num04" class="total-num"></span><span class="total-company">笔</span>
								</h4>

							</div>
						</div>
						<div class="pie">
							<div class="box">
								<h3 class="title" style="padding-left: 0rem;"></h3>
								<ul class="select-days">
									<li class="select-same-style">交易额占比</li>
									<li class="select-same-style select-item selected" data-id="1">今天</li>
									<li class="select-same-style select-item" data-id="2">近2天</li>
									<li class="select-same-style select-item" data-id="3">近3天</li>
									<li class="select-same-style select-item" data-id="4">近4天</li>
									<li class="select-same-style select-item" data-id="5">近5天</li>
									<li class="select-same-style select-item" data-id="6">近6天</li>
									<li class="select-same-style select-item" data-id="7">近7天</li>
									
								</ul>
							</div>

							<div class="circles box">
								  <!-- <div id="circle01" class="circle01 box-b"></div> -->
								<div id="circle02" class="circle02 box-b"></div>
							</div>

						</div>

						<div class="table-wrap">
							<div class="plat-title">最近7天交易</div>
							<div id="table" class="table"></div>
						</div>


					</div>
		
		<!-- <div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="index-wrap">
						 <h1 class="title01 fl">聚融通生态数据平台</h1> 
						<div class="list box">
							<div class="item box-c">
								<h3 class="title02">
									今日交易 &nbsp;<span id="today-num01" class="today-num"></span><span class="today-company">万</span>
								</h3>
								<div class="clear_both"></div>

								<h4 class="title02">
									总交易&nbsp;&nbsp;<span id="today-num02" class="total-num"></span><span class="total-company">万</span>
								</h4>

							</div>
							<div class="item box-c">
								<h3 class="title02">
									今日交易&nbsp;&nbsp;<span id="today-num03" class="today-num"></span><span class="today-company">万</span>
								</h3>

								<h4 class="title02">
									总交易&nbsp;&nbsp;<span id="today-num04" class="total-num"></span><span class="total-company">万</span>
								</h4>

							</div>
						</div>
						<div class="pie">
							<div class="box">
								<h3 class="title" style="padding-left: 0rem;"></h3>
								<ul class="select-days">
									<li class="select-same-style">交易额占比</li>
									<li class="select-same-style select-item selected" data-id="1">今天</li>
									<li class="select-same-style select-item" data-id="2">近2天</li>
									<li class="select-same-style select-item" data-id="3">近3天</li>
									<li class="select-same-style select-item" data-id="4">近4天</li>
									<li class="select-same-style select-item" data-id="5">近5天</li>
									<li class="select-same-style select-item" data-id="6">近6天</li>
									<li class="select-same-style select-item" data-id="7">近7天</li>
									
								</ul>
							</div>

							<div class="circles box">
								  <div id="circle01" class="circle01 box-b"></div>
								<div id="circle02" class="circle02 box-b"></div>
							</div>

						</div>

						<div class="table-wrap">
							<div class="plat-title">最近7天交易</div>
							<div id="table" class="table"></div>
						</div>


					</div>
				</div>

				<div class="swiper-slide">
					<div class="index-wrap">
						 <h1 class="title01 fl">聚融通生态数据平台</h1> 
						<div class="list box">
							<div class="item box-c">
								<h3 class="title02">
									今日结算 &nbsp;<span id="today-num05" class="today-num"></span><span class="today-company">万</span>
								</h3>
								<div class="clear_both"></div>

								<h4 class="title02">
									总结算&nbsp;&nbsp;<span id="today-num06" class="total-num"></span><span class="total-company">万</span>
								</h4>

							</div>
							<div class="item box-c">
								<h3 class="title02">
									今日结算&nbsp;&nbsp;<span id="today-num07" class="today-num"></span><span class="today-company">笔</span>
								</h3>

								<h4 class="title02">
									总结算&nbsp;&nbsp;<span id="today-num08" class="total-num"></span><span class="total-company">笔</span>
								</h4>

							</div>
						</div>
						<div class="pie">
							<div class="box">
								<ul class="select-days">
									<li class="select-same-style">代付额占比</li>
									<li class="select-same-style select-item-pay selected" data-id="1">今天</li>
									<li class="select-same-style select-item-pay" data-id="2">近2天</li>
									<li class="select-same-style select-item-pay" data-id="3">近3天</li>
									<li class="select-same-style select-item-pay" data-id="4">近4天</li>
									<li class="select-same-style select-item-pay" data-id="5">近5天</li>
									<li class="select-same-style select-item-pay" data-id="6">近6天</li>
									<li class="select-same-style select-item-pay" data-id="7">近7天</li>
									
								</ul>
							</div>

							<div class="circles box">
								  <div id="circle01" class="circle01 box-b"></div>
								<div id="circle03" class="circle02 box-b"></div>
							</div>

						</div>

						<div class="table-wrap">
							<div class="plat-title">最近7天代付</div>
							<div id="pieAndLine" class="table"></div>
						</div>


					</div>
				</div>
			</div>

		</div> -->

	</div>

	<script src="<%=request.getContextPath()%>/static/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/static/js/swiper.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/echarts-all.js"></script>
	
<script>

//格式化数字
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


/****************************************** 支付页面start *****************************************/

/* 交易额占比--饼图  */
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
      formatter: "{b} "            
    },
    legend: {
      orient : 'horizontal',
      fontFamily:'Microsoft Yahei',
      itemGap:6 ,
      itemWidth:15,
      itemHeight:12,
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
              //formatter: "{c}  ({d}%)"/*"{b} : {c}万 "*/,
              formatter:function(params, ticket, callback){   
            	  var res=params.value+' , '+parseFloat(params.percent).toFixed(1)+'%'
            	  return res;
              },
              position:'outer', //  这个设置会让数据极小的视觉引导线重合在一起
              distance:config.distance                    
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

// 平台  
var platUpdate;
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
   
    calculable : true,
    legend: {
    	 orient:'horizontal',
         x:'80px',
         textStyle:{
           color:'#fff',
           fontSize:9
         },
        data:config.legend
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : true,
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
                  onZero:true,
                  lineStyle: {
                    color: '#4a516a',
                    type: 'dashed',
                    width: 2
                  }
                },
                axisLabel:{//主轴上文字的设置
                    margin:20,
                    textStyle:{
                      color:'#fff',
                      fontSize:10
                    }
                  },
            data : config.axisLine
        }
    ],
    yAxis : [
        {
            type : 'value',
            name : '万元',
            splitNumber:config.splitNumber,
            nameTextStyle:{ color:'#fff',fontSize:9},
	        max:config.maxAmount,
	        min:0,
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
            nameTextStyle:{ color:'#fff',fontSize:9},
            axisLabel:{
                margin:20,
                textStyle:{
                  color:'#fff',
                  fontSize:10
                },
               formatter: function (value){ return value.toFixed(0)}
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

//平台总交易额   总笔数
var str1 = 0, str2 = 0, str3 = 0, str4 = 0;
var numRun2 = $("#today-num02").numberAnimate({
    num : '0',
    dot : 2,
    speed : 2000
});
             
var numRun4 = $("#today-num04").numberAnimate({
    num : '0',
    dot : 0,
    speed : 2000
}); 
var numRun1 = $("#today-num01").numberAnimate({
    num : '0',
    dot : 2,
    speed : 2000,
});
var numRun3 = $("#today-num03").numberAnimate({
    num : '0',
    dot : 0,
    speed : 2000
});
             
function totalNum(){    	 
	$.ajax({
        type: 'POST',
        url: '<c:url value="/pstatsDisPlay/getTotalAndAmtByDayOrAll"/>',              
        data: {},
        dataType: 'json',
        success: function(data,status,xhr){    
        	if(data&&data.length){
        		str2=formatNumber(data[0].PAYAMT , 10000, 2);        	
                str4=data[0].PAYTOTAL; 
                
                numRun2.resetData(str2);
                numRun4.resetData(str4);
        	}
        	 
 
        },
        error: function(xhr, type){console.log(xhr,'err...............')}
    });
}	  
// 实时交易额
function todayBillMoney(){
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
	$.ajax({
           type: 'POST',
           url: '<c:url value="/pstatsDisPlay/getTotalAndAmtByDayOrAll"/>',                
           data: {'sysdate':nowTime},
           dataType: 'json',
           success: function(data,status,xhr){
          	  if(data&&data.length>=2&&data[1].refreshType=='true'){
          		var reloaded = sessionStorage.getItem('reloaded');
          		if(reloaded==null){
          			sessionStorage.setItem('reloaded','yes');
          			location.reload(true);
              		return;
          		}
          		
          	  }
          	  
        	  if(data&&data.length){
        		  str1 = formatNumber(data[0].PAYAMT,10000,2);
           	   	  str3 = data[0].PAYTOTAL; 
           	   	  
           	   	  numRun1.resetData(str1);
           	      numRun3.resetData(str3);
        	  }
        	   
           },
           error: function(xhr, type){console.log(xhr,'err.............')}
   });
}

// 饼图
function  circlePie(data){
	var days = (data&&data.days)?data.days:1;
	// 通道名称 
   	var passagewayName=[];
   	// 通道值  
   	var passagewayValue=[];
   	//  颜色  
   	var color=[];
       /* 支付方式占比 */  
   	$.ajax({
        type: 'POST',
        url: '<c:url value="/pstatsDisPlay/getPayTypeByDay"/>',             
        data: {'rownum':days},
        dataType: 'json',
        async:false,
        success: function(data){
        	//console.log('data****1111',data);
        	var colorData=['#0bd508','#026dda', '#6ba7ee','#abff94','#037f32','#01aea5',
        	               '#f2b300','#80531a','#facf88','#fff55b','#601a85','#c391bf',
        	               '#00c5ed','#79c087','#d3b0ff','#c2658d','#fe9fa0','#e3f9fd'];
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
        	
        	var length=data.length;  
        	if(length){ 
        		    
        		data = data.sort(function(a,b){
        			return b.PAYSUCCAMT - a.PAYSUCCAMT;
        		});
        		for(var i=0; i< length;i++){
        			var haveFlag = false;//新增现在没有的支付方式时，添加公共的颜色
                   if(data[i].PAYSUCCAMT != 0){  
                	   
                	   
                	   if(data[i].NAME.substr(data[i].NAME.length-2,data[i].NAME.length)=='支付'){
                		   passagewayName.push({'name':data[i].NAME.substr(0,data[i].NAME.length-2),icon:'bar'});
                		   passagewayValue.push({value:formatNumber(data[i].PAYSUCCAMT,10000,2),name:data[i].NAME.substr(0,data[i].NAME.length-2)});
                	   }else{
							if(''+data[i].PAYTYPE+data[i].CODE=='0110'){
								passagewayName.push({'name':'POS收单(贷记卡)',icon:'bar'});
		                    	passagewayValue.push({value:formatNumber(data[i].PAYSUCCAMT,10000,2),name:'POS收单(贷记卡)'});
                    	   }else if(''+data[i].PAYTYPE+data[i].CODE=='0107'){
                    		   passagewayName.push({'name':'POS收单(借记卡)',icon:'bar'});
                        	   passagewayValue.push({value:formatNumber(data[i].PAYSUCCAMT,10000,2),name:'POS收单(借记卡)'});
                    	   }else{
                    		   passagewayName.push({'name':data[i].NAME,icon:'bar'});
                        	   passagewayValue.push({value:formatNumber(data[i].PAYSUCCAMT,10000,2),name:data[i].NAME});
                    	   }
                	   }
                	    
	           			for(var key in colorObj){
		   	  				
		       				if(''+data[i].PAYTYPE+data[i].CODE==key){
	           					color.push(colorObj[key]);
	           					haveFlag = true;
	           				}
	           			}
	           			if(haveFlag==false){
	           				console.log('新增支付方式了。。。。。。。。。。。。。。。')
	           				color.push(colorObj['public']);
	           				haveFlag = false;
	           			}
                	 
                   }            		
            	}    
        		
        	}
        },
        error: function(xhr, type){}            
    });
   	return [passagewayName,color,passagewayValue];
}   
   
// 柱状折线数据
function plat(){
	var time=[],lineData=[],barData=[];
	var maxAmount=0,maxBill=0;
   	$.ajax({
       type: 'POST',
       url: '<c:url value="/pstatsDisPlay/getTotalAndAmtByDay"/>',                
       data: {"rownum":7},
       dataType: 'json',
       async:false,
       success: function(data){
      	 for(var i=0,length=data.length; i<length;i++){
      	
   			if(maxAmount < data[i].PAYSUCCAMT){
 				maxAmount=data[i].PAYSUCCAMT;
 			}

 			if(maxBill < data[i].PAYTOTAL){
 				maxBill=data[i].PAYTOTAL;
 			}
 			
      		data[i].TRANDAY=data[i].TRANDAY.substring(8)+'日';
      		
       		// 交易时间  
      		time.push(data[i].TRANDAY);
       		
            // 交易金额 
      		barData.push(formatNumber(data[i].PAYSUCCAMT,10000,2));
            
            //交易笔数 
      		lineData.push(data[i].PAYTOTAL);    
    	}
      	maxAmount = formatNumber(maxAmount,10000,2);
       
       },
       error: function(xhr, type){}
    });
   	return [time,barData,lineData,maxAmount,maxBill];
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

/****************************************** 支付页面end *****************************************/
 
 
 
/****************************************** 结算代付页面start *****************************************/

/* 头部汇总  */

var str5=0,str6=0,str7=0,str8=0;
/* var numRun5 = $("#today-num05").numberAnimate({
    num : '0',
    dot : 2,
    speed : 2000
});

var numRun6 = $("#today-num06").numberAnimate({
    num : '0',
    dot : 2,
    speed : 2000
});

var numRun7 = $("#today-num07").numberAnimate({
    num : '0',
    dot : 0,
    speed : 2000
});

var numRun8 = $("#today-num08").numberAnimate({
    num : '0',
    dot : 0,
    speed : 2000
}); */

 function payAnotherTotal(){
	 $.ajax({
	        type: 'get',
	        url: '<c:url value="/defray/getPMerDefray"/>', 
	        //url: 'http://www.easy-mock.com/mock/59c07898e0dc663341aeffd5/stats-display/defray/getPMerDefray', 
	        data: {sysdate:'20170926'},
	        dataType: 'json',
	        success: function(data){  
	        	if(data.code == 200){
	        		var data = data.data;
		      	               
		        	 str5=formatNumber(data.PAYAMT , 10000, 2);  
		             str6=formatNumber(data.PAYAMTALL , 10000, 2);
		             str7=data.PAYTOTAL;
		             str8=data.PAYTOTALALL;
		             //
		             /* $('#today-num05').html(str1);
		             $('#today-num06').html(str3);  
		             $('#today-num07').html(str2);
		             $('#today-num08').html(str4); 	 */
		             
		             
		             
		             numRun5.resetData(str5);
		             numRun6.resetData(str6);
		             numRun7.resetData(str7);
		             numRun8.resetData(str8);
		             
	        	}
	        	
	        },
	        error: function(xhr, type){console.log(xhr,'err.............')}
    });
}
 
 /* 代付额占比--饼图 */
 var myChartOfPay;
 var pieOfPay=function (config){
   // 基于准备好的dom，初始化echarts实例
   var myChart = echarts.init(document.getElementById(config.id));
   myChartOfPay = myChart;
   // 指定图表的配置项和数据
   option = {
     tooltip : {
       trigger: 'item',
       formatter: "{b} "            
     },
     legend: {
       orient : 'horizontal',
       fontFamily:'Microsoft Yahei',
       itemGap:6 ,
       itemWidth:15,
       itemHeight:12,
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
               //formatter: "{c}  ({d}%)"/*"{b} : {c}万 "*/,
               formatter:function(params, ticket, callback){   
             	  var res=params.value+' , '+parseFloat(params.percent).toFixed(1)+'%'
             	  return res;
               }, 
               position:'outer', //  这个设置会让数据极小的视觉引导线重合在一起
               distance:config.distance                    
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
 
 /* 代付--折线柱状混合图 */
 var platUpdateOfPay;
var platformOfPay=function (config){
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById(config.id));
  platUpdateOfPay=myChart;
  // 指定图表的配置项和数据
 option = {
	color:config.color,		  
    tooltip : {
        trigger: 'axis'
    },
    grid:{
    	y:config.y
      },
   
    calculable : true,
    legend: {
    	 orient:'horizontal',
         x:'80px',
         textStyle:{
           color:'#fff',
           fontSize:9
         },
        data:config.legend
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : true,
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
                  onZero:true,
                  lineStyle: {
                    color: '#4a516a',
                    type: 'dashed',
                    width: 2
                  }
                },
                axisLabel:{//主轴上文字的设置
                    margin:20,
                    textStyle:{
                      color:'#fff',
                      fontSize:10
                    }
                  },
            data : config.axisLine
        }
    ],
    yAxis : [
        {
            type : 'value',
            name : '万元',
            splitNumber:config.splitNumber,
            nameTextStyle:{ color:'#fff',fontSize:9},
	        max:config.maxAmount,
	        min:0,
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
            nameTextStyle:{ color:'#fff',fontSize:9},
            axisLabel:{
                margin:20,
                textStyle:{
                  color:'#fff',
                  fontSize:10
                },
               formatter: function (value){ return value.toFixed(0)}
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
 
 
 
 
 /* 请求代付饼图数据 */
 function getPieOfPay(data){
	 var days = data&&data.days?data.days:1;//如果没有传data默认查询1天
	 var colorData=['#0bd508','#026dda', '#6ba7ee','#abff94'];
  	var legendName=[];
  	var seriesValue=[];
	 $.ajax({
	        type: 'get',
	        async:false,
	        url: '<c:url value="/defray/getPMerDefrayByCode"/>',              
	        data: {"rownum":days},
	        dataType: 'json',
	        success: function(data){  
	        	//console.log(data,'代付饼图........................')
	        	if(data.code == 200){
	        		if(data&&data.list&&data.list.length){ 
		        		var data = data.list;   
		        		data = data.sort(function(a,b){
		        			return b.PAYSUCCAMT - a.PAYSUCCAMT;
		        		});
		        		for(var i=0; i< data.length;i++){
		        			
		                   if(data[i].PAYSUCCAMT != 0){  
		                	   
		                	   if(data[i].name.substr(data[i].name.length-2,data[i].name.length)=='代付'){
		                		   legendName.push({'name':data[i].name.substr(0,data[i].name.length-2),icon:'bar'});
		                		   seriesValue.push({value:formatNumber(data[i].PAYSUCCAMT,10000,2),name:data[i].name.substr(0,data[i].name.length-2)});
		                	   }else{
		                		   legendName.push({'name':data[i].name,icon:'bar'});
		                		   seriesValue.push({value:formatNumber(data[i].PAYSUCCAMT,10000,2),name:data[i].name});
		                	   }
		                   }            		
		            	}
	        	  }
	        	    
	        		
	        	}
	        	
	        },
	        error: function(xhr, type){}
    });
	 return [legendName,colorData,seriesValue]; 
}
 
 /* 请求代付--柱状折线混合图 */
 function platOfPay(){
		var time=[],lineData=[],barData=[];
		var maxAmount=0,maxBill=0;
	   	$.ajax({
	       type: 'get',
	       url: '<c:url value="/defray/getPMerDefrayByDay"/>',                
	       data: {"rownum":7},
	       dataType: 'json',
	       async:false,
	       success: function(data){
	    	   //console.log(data,'折线柱状。。。。。。。。。。。')
	    	   if(data.code == 200){
	    		   data = data.list;
	  	      	 for(var i=0,length=data.length; i<length;i++){
	  	      	
	  	   			if(maxAmount < data[i].PAYSUCCAMT){
	  	 				maxAmount=data[i].PAYSUCCAMT;
	  	 				
	  	 			}

	  	 			if(maxBill < data[i].PAYSUCCTOTAL){
	  	 				maxBill=data[i].PAYSUCCTOTAL;
	  	 			}
	  	 			
	  	      		//data[i].TRANDAY=data[i].TRANDAY.substring(8)+'日';
	  	      		
	  	       		// 交易时间  
	  	      		time.push(data[i].TRANDAY);
	  	       		
	  	            // 交易金额 
	  	      		barData.push(formatNumber(data[i].PAYSUCCAMT,10000,2));
	  	            
	  	            //交易笔数 
	  	      		lineData.push(data[i].PAYSUCCTOTAL);    
	  	    	}
	  	      	maxAmount = formatNumber(maxAmount,10000,2); 
	    	   }
	    	   
	       
	       },
	       error: function(xhr, type){}
	    });
	   	maxAmount = maxAmount/1;
	   	return [time,barData,lineData,maxAmount,maxBill];
	}    
 
 
//代付饼图更新数据
 function updatePieOfPay(data,legendData,colorData){
     var option = myChartOfPay.getOption();
     option.color=colorData;
     option.legend.data=legendData;
     option.series[0].data=data;
     myChartOfPay.setOption(option); 
 }
 //代付柱状图更新数据
function updatePlatOfPay(axisLine ,lineData ,barData, maxAmount, maxBill){	
     var option = platUpdateOfPay.getOption();
     option.yAxis[0].max = maxAmount;
     option.yAxis[1].max = maxBill;
     option.xAxis.data = axisLine;   
     option.series[0].data=lineData;
     option.series[1].data=barData;
     platUpdateOfPay.setOption(option); 	 
 }
 
 
/****************************************** 结算代付页面end *****************************************/
$(document).ready(function (){
	/* 滑屏实现 */
  /*  var mySwiper = new Swiper ('.swiper-container', {
	   //autoplay:2000,
   })  */
	
	
	
/******************* 支付页面start ********************/
   //今日交易数据初始化 
   totalNum();
   //平台交易数据初始化
   todayBillMoney();
   //饼图   
   var circleData=circlePie({'days':1});
   pie({
      id:'circle02',
      rdx:'10%',
      rdy:'30%',
      cx:'50%',
      cy:'70%',
      distance:1.11,
      legend:circleData[0],
      color:circleData[1],
      data:circleData[2]
   });
      
   //柱状折线图   
   var platData=plat();
   platform({
       id:'table',
       y:'20%',
       maxAmount:platData[3],
       maxBill:platData[4],
       color:["#2E57EC"],
       lineColor:'#188E24',
       legend:[{ name:'交易额',icon: 'image:// <%=request.getContextPath()%>/static/images/line-blue.jpg'},{ name:'交易笔数',icon: 'image:// <%=request.getContextPath()%>/static/images/line.jpg'} ],
		axisLine : platData[0], //时间
		splitNumber : 5,
		barData : platData[1], //交易额 柱状图
		lineData : platData[2]//交易笔数 折线图
	});
 
   var days;//查询交易额的天数
   
   /* 交易额占比---选择饼图展示数据天数 */
	var $selectDays = $('.index-wrap .pie .select-days .select-item');
	$selectDays.on('click',function(){
		var selectedIndex = $(this).index()-1;//因为父级还有一个li'交易额占比'
		$selectDays.each(function(index,item){
			$(item).removeClass('selected');
			if(selectedIndex==index){
				$(item).addClass('selected');
			}
		})
		
	   days = $(this).attr("data-id");
	   var circleData=circlePie({'days':days});
		pie({
		      id:'circle02',
		      rdx:'10%',
		      rdy:'30%',
		      cx:'50%',
		      cy:'70%',
		      distance:1.11,
		      legend:circleData[0],
		      color:circleData[1],
		      data:circleData[2]
	   });

	})
/******************* 支付页面end ********************/
	
	
	
	
/******************* 代付页面start ********************/
	//代付头部汇总
	<%-- payAnotherTotal();
	
	var daysOfPay=1;
	//
	var pieOfPayData = getPieOfPay({"days":daysOfPay});
	
	pieOfPay({
	      id:'circle03',
	      rdx:'10%',
	      rdy:'30%',
	      cx:'50%',
	      cy:'70%',
	      distance:1.11,
	      legend : pieOfPayData[0],
	      color : pieOfPayData[1],
	      data : pieOfPayData[2]
 	}); 
	
	var platOfPayData=platOfPay();
	//console.log(platOfPayData,'geted--data............折线柱状')
	platformOfPay({
	       id:'pieAndLine',
	       y:'20%',
	       maxAmount:platOfPayData[3],
	       maxBill:platOfPayData[4],
	       color:["#2E57EC"],
	       lineColor:'#188E24',
	       legend:[{ name:'交易额',icon: 'image:// <%=request.getContextPath()%>/static/images/line-blue.jpg'},{ name:'交易笔数',icon: 'image:// <%=request.getContextPath()%>/static/images/line.jpg'} ],
			axisLine : platOfPayData[0], //时间
			splitNumber : 5,
			barData : platOfPayData[1], //交易额 柱状图
			lineData : platOfPayData[2]//交易笔数 折线图
		}); --%>
	
	
	/* 代付额额占比---选择饼图展示数据天数 */
	/* var $selectPayDays = $('.index-wrap .pie .select-days .select-item-pay');
	$selectPayDays.on('click',function(){
		var selectedIndex = $(this).index()-1;//因为父级还有一个li'代付额额占比'
		$selectPayDays.each(function(index,item){
			$(item).removeClass('selected');
			if(selectedIndex==index){
				$(item).addClass('selected');
			}
		})
		
		daysOfPay = $(this).attr("data-id");
		
		var pieOfPayData = getPieOfPay({"days":daysOfPay});
		pieOfPay({
		      id:'circle03',
		      rdx:'10%',
		      rdy:'30%',
		      cx:'50%',
		      cy:'70%',
		      distance:1.11,
		      legend : pieOfPayData[0],
		      color : pieOfPayData[1],
		      data : pieOfPayData[2]
	 	});
		
	})  */
	
/******************* 代付页面end ********************/
	
	
/******************* 定时更新start ********************/
	setInterval(function() {
		// 支付今日交易
		totalNum();
		//支付平台交易
		todayBillMoney();
		//支付--饼图
		var circleData = circlePie({'days':days});
		if(pieUpdate.getOption().legend){
			updatePie(circleData[2], circleData[0],circleData[1]);
		}
		
		
		// 支付--柱状折线图
		setTimeout(function() {
			var platData = plat();
			if(platUpdate.getOption().yAxis){
				updatePlat(platData[0], platData[1],platData[2],platData[3],platData[4]);
			}
			
		}, 1000);
		
		
		
		//代付头部汇总
		/* payAnotherTotal();
		//更新代付额占比--饼图
		var pieOfPayData = getPieOfPay({"days":daysOfPay});
		if(myChartOfPay.getOption().legend){
			updatePieOfPay(pieOfPayData[2],pieOfPayData[1],pieOfPayData[0]);
		}
		
		
		// 代付--柱状折线图
		setTimeout(function() {
			var platOfPayData = platOfPay();
			//console.log(platOfPayData,'platOfPayData............')
			if(platUpdateOfPay.getOption().yAxis){
				updatePlatOfPay(platOfPayData[0], platOfPayData[1],platOfPayData[2],platOfPayData[3],platOfPayData[4]);
			}
			
		}, 1000); */
		
	}, 5 * 1000);
/******************* 定时更新end ********************/	

});
</script>




</body>
</html>