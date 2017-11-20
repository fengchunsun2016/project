<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
  <link href="<%=request.getContextPath() %>/static/css/global.css" rel="stylesheet" type="text/css" />
  <link href="<%=request.getContextPath() %>/static/css/gzl.css" rel="stylesheet" type="text/css" />
  <script src="<%=request.getContextPath() %>/static/js/jquery-2.2.3.min.js" type="text/javascript" ></script>
  <script src="<%=request.getContextPath() %>/static/js/common.js" type="text/javascript" ></script>
   <style type="text/css">
    body{

      background: -webkit-linear-gradient(left top,#07d0b9 10%, #2281da 65%,#4e89f2 80%);
      background: -o-linear-gradient(bottom right,#07d0b9 10%, #2281da 70%,#4e89f2 80%);
      background: -moz-linear-gradient(bottom right,#07d0b9 10%, #2281da 70%,#4e89f2 80%);
      background: linear-gradient( bottom right, #07d0b9 10%, #2281da 70%,#4e89f2 80%);

      /*background:radial-gradient( at 0px 0px, #07d0b9 10%, #2281da 65%,#4e89f2 80% );*/
    }
  </style>
</head>
<body>
<div class="login-wrap">
  <div class="title">聚融通 生态数据平台</div>
  <div class="login-form">
    <div class="form-name clear"><span class="name"></span><span><input type="text" placeholder ="用户名"/></span></div>
    <div class="form-psd clear"><span class="psd"></span><span><input type="password" placeholder="用户密码"/></span></div>
  </div>
  <!--<div  style="height:34.5rem; "></div>-->
</div>
<script type="text/javascript">
  $(function(){
    $('body').height($(window).height());

  });
</script>
</body>
</html>
