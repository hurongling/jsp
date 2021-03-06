<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>锤子蛋糕店</title>
<link rel="stylesheet" type="text/css" href="/cakes/css/public.css" />
<link rel="stylesheet" type="text/css" href="/cakes/css/idea.css" />

</head>

<body>
	<!------------------------------head------------------------------>
	<div class="head">
		<div class="wrapper clearfix">
			<div class="clearfix" id="top">
				<h1 class="fl">
					<a href="index.jsp"><img src="/cakes/image/logo.png" /></a>
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
						<a href="/cakes/users/showUserInfo.jsp"><img src="image/grzx.png" /></a> <a href="#"
							class="er1"><img src="image/ewm.png" /></a> <a
							href="/cakes/users/showCar.jsp"><img src="image/gwc.png" /></a>
						<p>
							<a href="#"><img src="image/smewm.png" /></a>
						</p>
					</div>
				</div>
			</div>
<!------------------------------nav------------------------------>
			<ul class="clearfix" id="bott">
				<li><a href="/cakes/index.jsp">首页</a></li>
				<li><a href="/cakes/GoodsSer?status=Cake&cid=1">水果蛋糕</a></li>
				<li><a href="/cakes/GoodsSer?status=Cake&cid=2">巧克力蛋糕</a></li>
				<li><a href="/cakes/GoodsSer?status=Cake&cid=3">儿童蛋糕</a></li>
				<li><a href="/cakes/GoodsSer?status=Cake&cid=5">芝士蛋糕</a></li>
				<li><a href="/cakes/GoodsSer?status=Cake&cid=4">日系派件</a></li>
			</ul>
		</div>
	</div>


	<!-------------------------content--------------------------->
	<div class="imgList1">
		<div class="wrapper">
			<div class="box1">

				<ul>
					<c:forEach items="${sessionScope.cakesList}" var="goods" begin="0"
						end="2">
					<c:url value="/detail.jsp" var="detail">
					<c:param name="gid" value="${goods.gid}"></c:param>
					<c:param name="gname" value="${goods.gname}" />
					<c:param name="gprice" value="${goods.gprice}" />
					<c:param name="gpic" value="${goods.gpic}" />
					<c:param name="gremark" value="${goods.gremark}" />
					<c:param name="gxremark" value="${goods.gxremark}" />
					<c:param name="ctype" value="${goods.category.ctype}" />
				</c:url>
						<li><a href="${detail}">
								<dl>
									<dt>
										<img src="/cakes/image/${goods.gpic}"  height="354" width="354"/>
									</dt>
									<dd>【${goods.gname}】${goods.gxremark}</dd>
									<dd>¥${goods.gprice}</dd>
								</dl>
						</a></li>
					</c:forEach>
				</ul>
				<ul>
					<c:forEach items="${sessionScope.cakesList}" var="goods" begin="3"
						end="6">
						<c:url value="/detail.jsp" var="detail">
					<c:param name="gid" value="${goods.gid}"></c:param>
					<c:param name="gname" value="${goods.gname}" />
					<c:param name="gprice" value="${goods.gprice}" />
					<c:param name="gpic" value="${goods.gpic}" />
					<c:param name="gremark" value="${goods.gremark}" />
					<c:param name="gxremark" value="${goods.gxremark}" />
					<c:param name="ctype" value="${goods.category.ctype}" />
				</c:url>
						<li><a href="${detail}">
								<dl>
									<dt>
										<img src="/cakes/image/${goods.gpic}"  height="354" width="354"/>
									</dt>
									<dd>【${goods.gname}】${goods.gxremark}</dd>
									<dd>¥${goods.gprice}</dd>
								</dl>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>


<!--返回顶部-->
		<div class="gotop">
			<a href="/cakes/users/showCar.jsp">
			<dl>
				<dt><img src="image/gt1.png"/></dt>
				<dd>去购<br/>物车</dd>
			</dl>
			</a>
			<a href="#" class="dh">
			<dl>
				<dt><img src="image/gt2.png"/></dt>
				<dd>联系<br/>客服</dd>
			</dl>
			</a>
			<a href="/cakes/users/showUserInfo.jsp">
			<dl>
				<dt><img src="image/gt3.png"/></dt>
				<dd>个人<br/>中心</dd>
			</dl>
			</a>
			<a href="#" class="toptop" style="display: none">
			<dl>
				<dt><img src="image/gt4.png"/></dt>
				<dd>返回<br/>顶部</dd>
			</dl>
			</a>
			<p>2014-370-3003</p>
		</div>



<!-------------------footer-------------------------->
	  <div class="footer">
			<div class="top">
				<div class="wrapper">
					<div class="clearfix">
						<a href="#2" class="fl"><img src="/cakes/image/foot1.png"/></a>
						<span class="fl">7小时送货上门</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="/cakes/image/foot2.png"/></a>
						<span class="fl">15款主题贺卡免费选</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="/cakes/image/foot3.png"/></a>
						<span class="fl">满99包邮</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="/cakes/image/foot4.png"/></a>
						<span class="fl">DIY蛋糕特色服务</span>
					</div>
				</div>
			</div>
			<p class="dibu">锤子蛋糕&copy;2017-2017胡荣玲版权所有 计网一班20143703003号</p>
		</div>

		<script src="/cakes/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/cakes/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="/cakes/js/nav.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>
