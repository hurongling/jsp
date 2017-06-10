<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>用户登陆</title>
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
    <div class="login uback">
    <form action="/cakes/UsersSer" method="post">
    <br>
    <br>
    <div class="msg-warn hide"><b></b>公共场所不建议自动登录，以防账号丢失</div>
    	<p><input type="text" name="ulogin"  placeholder="昵称"/></p>
    	<p><input type="password" name="upass" placeholder="密码"/></p>
    	${error}<br/>
    	<p><input type="submit" name="" value="登  录"></p>
		<p class="txt"><a class="" href="/cakes/register.jsp">免费注册</a>
		<a href="#">忘记密码？</a></p>
    	<input type="hidden" name="status" value="login" /> 
    </form>
    </div>
  </body>
</html>
