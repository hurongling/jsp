<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员登陆</title>
    <link rel="stylesheet" type="text/css" href="/cakes/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="/cakes/css/login.css"/>
    <style type="text/css">
    .aback{
	width:100%;
	height:100%;
	background: url(/cakes/image/alogin.jpg) no-repeat;
	background-size: 100% 100%;
}  
    </style>
  </head>
  
  <body>
  <div class="login aback">
    <form action="/cakes/AccountSer" method="post">
    <br>
    <br>
    <div class="msg-warn hide"><b></b>请用管理员账户登陆</div>
    	<p><input type="text" name="alogin" placeholder="昵称"/></p>
    	<p><input type="password" name="apass" placeholder="密码"/></p>
    	${error}<br/>
    	<p><input type="submit" name="" value="登  录"></p>
		<p class="txt"><a class="" href="#">授权注册</a>
		<a href="#">忘记密码？</a></p>
    	<input type="hidden" name="status" value="login" /> 
    </form>
  </div>
  </body>
</html>
