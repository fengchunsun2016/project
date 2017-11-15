

$(function () {
  /*支付授权页面*/
  $('.click-display').on('click',function () {
    $(this).parent().next().toggle();
  })


  /*交易查询页面-日历插件*/
  $('#datetimepicker-deal-start').daterangepicker({
    singleDatePicker: true
  });


  /*$(".date-picker").datetimepicker({
    minView: 'hour',
    format: "yyyy-mm-dd hh:ii",
    language: 'zh',
    clearBtn: true,
    autoclose: true
  });*/




  //格式化时间
  function formatTime(date){
    var date=date?date:new Date();
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


})





