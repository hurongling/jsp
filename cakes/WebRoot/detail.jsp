<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>商品详情</title>
<link rel="stylesheet" type="text/css" href="css/public.css" />
<link rel="stylesheet" type="text/css" href="css/proList.css" />
</head>

<body>
	<!------------------------------head------------------------------>
	<div class="head">
		<div class="wrapper clearfix">
			<div class="clearfix" id="top">
				<h1 class="fl">
					<a href="index.jsp"><img src="image/logo.png" /></a>
				</h1>
				<div class="fr clearfix" id="top1">
					<p class="fl">
						<c:choose>
							<c:when test="${sessionScope.users==null}">
								<a href="/cakes/ulogin.jsp" id="login">登录</a>
								<a href="#" id="reg">注册</a>
							</c:when>
							<c:otherwise>
							您好${sessionScope.users.ulogin}欢迎来到锤子蛋糕店
							<a href="/cakes/exit.jsp" id="login">退出</a>
								<a href="/cakes/register.jsp" id="reg">注册</a>
							</c:otherwise>
						</c:choose>
					</p>
					<form action="#" method="get" class="fl">
						<input type="text" placeholder="热门搜索：榴莲蛋糕" /> <input
							type="button" />
					</form>
					<div class="btn fl clearfix">
						<a href="/cakes/users/showUserInfo.jsp"><img
							src="image/grzx.png" /></a> <a href="#" class="er1"><img
							src="image/ewm.png" /></a> <a href="/cakes/users/showCar.jsp"><img
							src="image/gwc.png" /></a>
						<p>
							<a href="#"><img src="image/smewm.png" /></a>
						</p>
					</div>
				</div>
			</div>
<!------------------------------nav------------------------------>
			<ul class="clearfix" id="bott">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="#">水果蛋糕</a></li>
				<li><a href="flowerDer.html">巧克力蛋糕</a></li>
				<li><a href="decoration.html">儿童蛋糕</a></li>
				<li><a href="paint.html">芝士蛋糕</a></li>
				<li><a href="perfume.html">日系派件</a></li>
			</ul>
		</div>
	</div>
	<!-----------------------Detail------------------------------>
	<%
		String gname = new String(request.getParameter("gname").getBytes(
				"iso-8859-1"), "utf-8");
		String gpic = new String(request.getParameter("gpic").trim()
				.getBytes("iso-8859-1"), "utf-8");
		String gremark = new String(request.getParameter("gremark")
				.getBytes("iso-8859-1"), "utf-8");
		String gxremark = new String(request.getParameter("gxremark")
				.getBytes("iso-8859-1"), "utf-8");
		String ctype = new String(request.getParameter("ctype").getBytes(
				"iso-8859-1"), "utf-8");
		request.setAttribute("gname", gname);//把gname放到session里，在不同的浏览器下，购物车不同步，待解决
		request.setAttribute("gremark", gremark);
		request.setAttribute("gxremark", gxremark);
		request.setAttribute("gpic", gpic);
	%>
	<c:url value="/ForderSer" var="buy">
		<c:param name="status" value="buy" />
		<c:param name="gid" value="${param.gid}" />
		<c:param name="gname" value="${gname}" />
		<c:param name="gprice" value="${param.gprice}" />
		<c:param name="gpic" value="${gpic}" />
	</c:url>
	<div class="detCon">
		<div class="proDet wrapper">
			<div class="proCon clearfix">
				<div class="proImg fl">
					<img class="det" src="/cakes/image/${param.gpic}" />
					<div class="smallImg clearfix">
						<img src="/cakes/image/${param.gpic}"
							data-src="/cakes/image/${param.gpic}"> <img
							src="image/detail1.jpg" data-src="image/detail1_big.jpg"> <img
							src="image/detail2.jpg" data-src="image/detail2_big.jpg"> <img
							src="image/detail3.jpg" data-src="image/detail3_big.jpg">
					</div>
				</div>
				<div class="fr intro">
					<div class="title">
						<h4>
							【<%=ctype%>】${gname}
						</h4>
						<p>【日本名】${gremark}</p>
						<p>【简介】${gxremark}</p>
						<span>${param.gprice}</span>
					</div>
					<div class="proIntro">
						<p>数量&nbsp;&nbsp;</p>
						<div class="num clearfix">
							<img class="fl sub" src="image/sub.jpg"> <span class="fl"
								contentEditable="true">1</span> <img class="fl add"
								src="image/add.jpg">
						</div>
					</div>
					<div class="btns clearfix">
						<a href="${buy}"><p class="buy fl">立即购买</p></a> <a href="${buy}"><p
								class="cart fr">加入购物车</p></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-----------------------Detail content------------------------------>
	<div class="introMsg wrapper clearfix">
		<div class="msgL fl">
			<div class="msgTit clearfix">
				<a class="on">商品详情</a>
			</div>
			<div class="msgAll">
				<div class="msgImgs">
					<img src="image/detail4.jpg"> <img src="image/detail5.jpg">
					<img src="image/detail6.jpg"> <img src="image/detail7.jpg">
				</div>
			</div>
		</div>
	</div>

	<!-----------------------go to top------------------------------>

	<div class="gotop">
		<a href="/cakes/users/showCar.jsp">
			<dl>
				<dt>
					<img src="image/gt1.png" />
				</dt>
				<dd>
					去购<br />物车
				</dd>
			</dl>
		</a> <a href="#" class="dh">
			<dl>
				<dt>
					<img src="image/gt2.png" />
				</dt>
				<dd>
					联系<br />客服
				</dd>
			</dl>
		</a> <a href="/cakes/users/showUserInfo.jsp">
			<dl>
				<dt>
					<img src="image/gt3.png" />
				</dt>
				<dd>
					个人<br />中心
				</dd>
			</dl>
		</a> <a href="#" class="toptop" style="display: none">
			<dl>
				<dt>
					<img src="image/gt4.png" />
				</dt>
				<dd>
					返回<br />顶部
				</dd>
			</dl>
		</a>
		<p>2014-370-3003</p>
	</div>



	<!-------------------footer-------------------------->
	<div class="footer">
		<div class="top">
			<div class="wrapper">
				<div class="clearfix">
					<a href="#2" class="fl"><img src="image/foot1.png" /></a> <span
						class="fl">7小时送货上门</span>
				</div>
				<div class="clearfix">
					<a href="#2" class="fl"><img src="image/foot2.png" /></a> <span
						class="fl">15款主题贺卡免费选</span>
				</div>
				<div class="clearfix">
					<a href="#2" class="fl"><img src="image/foot3.png" /></a> <span
						class="fl">满99包邮</span>
				</div>
				<div class="clearfix">
					<a href="#2" class="fl"><img src="image/foot4.png" /></a> <span
						class="fl">DIY蛋糕特色服务</span>
				</div>
			</div>
		</div>
		<p class="dibu">锤子蛋糕&copy;2017-2017胡荣玲版权所有 计网一班20143703003号</p>
	</div>


	<script src="js/jquery-1.12.4.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>
