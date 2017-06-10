<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="/cakes/css/public.css" />
<link rel="stylesheet" type="text/css" href="/cakes/css/mygrxx.css" />

</head>

<body>
	<!-------------------content-------------------------->
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
						<li><a href="/cakes/users/userInfo.jsp">修改信息</a></li>
						<li class="on"><a href="#">修改密码</a></li>
					</ul>
				</div>
			</div>
			<div class="you fl">
				<h2>修改密码</h2>
				<form action="/cakes/UsersSer" method="get" class="remima">
					<p>
						<span>原密码：</span><input type="text" name="upass" />
					</p>
					<p class="op">输入原密码</p>
					<p>
						<span>新密码：</span><input type="text" name="pass" />
					</p>
					<p class="op">6-16 个字符，需使用字母、数字或符号组合，不能使用纯数字、纯字母、纯符号</p>
					<p>
						<span>重复新密码：</span><input type="text" name="pass1" />
					</p>
					<p class="op">请再次输入密码</p>
					<p>
						<span>验证码：</span><input type="text" /><img
							src="/cakes/image/code.jpg" alt="" />
					</p>
					<p class="op">按右图输入验证码，不区分大小写</p>
					<br />${error}<br /> <input type="submit" value="提交" /> <input
						type="hidden" name="status" value="alterPass" />
				</form>
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
