<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>个人信息</title>
		<link rel="stylesheet" type="/cakes/text/css" href="css/public.css"/>
		<link rel="stylesheet" type="/cakes/text/css" href="css/myorder.css" />
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
						<li class="on"><a href="/cakes/ForderSer?status=showForder&uid='${sessionScope.users.uid}'">个人信息</a></li>
						<li><a href="/cakes/users/userInfo.jsp">修改信息</a></li>
						<li><a href="/cakes/users/alterPass.jsp">修改密码</a></li>
					</ul>
				</div>
			</div>  

	<!-------------------左边内容-------------------------->
	<c:forEach items="${sessionScope.forders}" var="forder" >


				<div class="you fl">
					<div class="my clearfix">
						<h2>订单详情</h2>
						<h3>订单号：<span>${forder.fid}</span></h3>
					</div>
					<div class="orderList">
						<div class="orderList1">
							<h3>已收货</h3>
							<div class="clearfix">
								<a href="#" class="fl"><img src="img/g1.jpg"/></a>
								<p class="fl"><a href="#">家用创意菜盘子圆盘 釉下彩复古</a><a href="#">¥99.00×1</a></p>
							</div>
						</div>
						<div class="orderList1">
							<h3>收货信息</h3>
							<p>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<span>杨小黄</span></p>
							<p>联系电话：<span>157*****121</span></p>
							<p>收货地址：<span>河北 唐山市 路北区 高新软件园</span></p>
						</div>
						<div class="orderList1">
							<h3>支付方式及送货时间</h3>
							<p>支付方式：<span>在线支付</span></p>
							<p>送货时间：<span>不限送货时间</span></p>
						</div>
						<div class="orderList1 hei">
							<h3><strong>商品总价：</strong><span>¥99</span></h3>
							<p><strong>运费：</strong><span>¥0</span></p>
							<p><strong>订单金额：</strong><span>¥99</span></p>
							<p><strong>实付金额：</strong><span>¥99</span></p>
						</div>
						
					</div>
					
					
				</div>
				
				
				
				
				</c:forEach>
			</div>
		</div>













  </body>
</html>
