<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="/cakes/css/public.css" />
<link rel="stylesheet" type="text/css" href="/cakes/css/mygrxx.css" />
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
					<!-- /cakes/ForderSer?status=showForder&uid='${sessionScope.users.uid}' -->
						<li class="on"><a href="#">个人信息</a></li>
						<li><a href="/cakes/users/userInfo.jsp">修改信息</a></li>
						<li><a href="/cakes/users/alterPass.jsp">修改密码</a></li>
					</ul>
				</div>
			</div>
			<div class="you fl">
				<h2>个人信息</h2>
				<div class="gxin">
					<div class="xx">
						<div>姓名：${sessionScope.users.ulogin}</div>
						<div>性别：${sessionScope.users.usex}</div>
						<div>电话：${sessionScope.users.uphone}</div>
						<div>邮箱：${sessionScope.users.uemail}</div>
						<div>收货地址：${sessionScope.users.uaddress}</div>
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
