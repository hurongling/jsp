<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="/cakes/css/public.css" />
<link rel="stylesheet" type="text/css" href="/cakes/css/mygrxx.css" />
<style type="text/css">
.inputBorder {
	border: 1px solid #aaa;
	font-size: 20px;
}

#login_click {
	margin-top: 32px;
	height: 40px;
}

#login_click .a {
	text-decoration: none;
	background: #2f435e;
	color: #f2f2f2;
	padding: 10px 30px 10px 30px;
	font-size: 16px;
	font-family: 微软雅黑, 宋体, Arial, Helvetica, Verdana, sans-serif;
	font-weight: bold;
	border-radius: 3px;
	-webkit-transition: all linear 0.30s;
	-moz-transition: all linear 0.30s;
	transition: all linear 0.30s;
}

#login_click a:hover {
	background: #385f9e;
}
</style>

</head>

<body>

	<div class="Bott">
		<div class="wrapper clearfix">
			<div class="zuo fl">
				<h3>
					<a href="#"><img src="/cakes/image/tx.png" /></a>
					<p class="clearfix">
						<span class="fl">[${sessionScope.users.ulogin}]</span><a
							href="/cakes/exit.jsp"><span class="fr"> [退出登录]</span></a>
					</p>
				</h3>
				<div>
					<h4>我的交易</h4>
					<ul>
						<li><a href="/cakes/users/showCar.jsp">我的购物车</a></li>
						<li><a href="#">我的订单</a></li>
						<li><a href="/cakes/index.jsp">继续购物</a></li>
					</ul>

					<h4>账户管理</h4>
					<ul>
						<li><a href="/cakes/users/showUserInfo.jsp">个人信息</a></li>
						<li class="on"><a href="#">修改信息</a></li>
						<li><a href="/cakes/users/alterPass.jsp">修改密码</a></li>
					</ul>
				</div>
			</div>
			<div class="you fl">
				<h2>个人信息</h2>
				<div class="gxin">
					<div class="xx">
						<form action="/cakes/UsersSer" method="post">
							<table>
								<tr>
									<td colspan=5 style="text-align:center;heigh:60px;"></td>
								</tr>
								<tr>
									<td>登陆名:</td>
									<td><input type="text" name="ulogin"
										value="${sessionScope.users.ulogin}" class="inputBorder"></td>
								</tr>
								<tr>
									<td>姓名:</td>
									<td><input type="text" name="uname" class="inputBorder"></td>
								</tr>
								<tr>
									<td>性别:</td>
									<td><input type="text" name="usex" class="inputBorder"></td>
								</tr>
								<tr>
									<td>联系方式:</td>
									<td><input type="text" name="uphone" class="inputBorder"></td>
								</tr>
								<tr>
									<td>收货地址:</td>
									<td><input type="text" name="uaddress" class="inputBorder"></td>
								</tr>
								<tr>
									<td>邮箱:</td>
									<td><input type="text" name="uemail" class="inputBorder"></td>
								</tr>
							</table>
								<br> ${error}<br>
							<div id="login_click">
								<input type="submit" value="提交" name="submit" class="a">
							</div>
							<input type="hidden" name="status" value="addUInfo" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-------------------footer-------------------------->
	<div class="footer">
		<div class="top">
			<div class="wrapper">
				<div class="clearfix">
					<a href="#2" class="fl"><img src="/cakes/image/foot1.png" /></a> <span
						class="fl">7小时送货上门</span>
				</div>
				<div class="clearfix">
					<a href="#2" class="fl"><img src="/cakes/image/foot2.png" /></a> <span
						class="fl">15款主题贺卡免费选</span>
				</div>
				<div class="clearfix">
					<a href="#2" class="fl"><img src="/cakes/image/foot3.png" /></a> <span
						class="fl">满99包邮</span>
				</div>
				<div class="clearfix">
					<a href="#2" class="fl"><img src="/cakes/image/foot4.png" /></a> <span
						class="fl">DIY蛋糕特色服务</span>
				</div>
			</div>
		</div>
		<p class="dibu">锤子蛋糕&copy;2017-2017胡荣玲版权所有 计网一班20143703003号</p>
	</div>



</body>
</html>
