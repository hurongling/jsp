<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="/cakes/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/cakes/css/login.css"/>
	<style type="text/css">
    .uback{
	width:100%;
	height:100%;
	background: url(/cakes/image/login.JPG) no-repeat;
	background-size: 100% 100%;
}  
    </style>
	</head>
	<body>
		<!-------------------reg-------------------------->
		<div class="reg uback">
			<form action="/cakes/UsersSer" method="post">
				<br>
				<br>
				<p>用户注册</p>
				<p><input type="text" name="ulogin" value="" placeholder="请输入昵称"></p>
				<p><input type="password" name="upass" value=""  placeholder="请输入密码"></p>
				<p><input type="password" name="upass1" value="" placeholder="请确认密码"></p>
				<p class="txtL txt">&nbsp;<input class="code" type="text" name="" value="" placeholder="验证码"><img src="image/code.jpg"></p>
				${error}<br/>
				<p><input type="submit" name="" value="注册"></p>
				<p class="txtL txt">完成此注册，即表明您同意了我们的<a href="#"><使用条款和隐私策略></a></p>
				<p class="txt"><a href="/cakes/ulogin.jsp"><span></span>已有账号登录</a></p>
				<input type="hidden" name="status" value="register" /> 
			</form>
		</div>
  </body>
</html>
