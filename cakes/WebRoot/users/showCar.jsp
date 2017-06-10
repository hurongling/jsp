<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="/cakes/css/public.css" />
<link rel="stylesheet" type="text/css" href="/cakes/css/proList.css" />
</head>

<body>
<div class="cart mt">
	<!-----------------head------------------->
	<div class="site">
		<p class=" wrapper clearfix">
			<span class="fl">购物车</span> <img class="top"
				src="/cakes/image/cartTop01.jpg"> <a href="/cakes/index.jsp" class="fr">继续购物&gt;</a>
		</p>
	</div>
	<!-----------------table------------------->

		
		
	<div class="table wrapper">
		<div class="tr">
			<div>商品</div>
			<div>价格</div>
			<div>数量</div>
			<div>小计</div>
			<div>操作</div>
		</div>
			<c:choose>
			<c:when test="${sessionScope.forder.ftotal==0.0}">
			<!-- <div class="goOn">空空如也~<a href="/cakes/index.jsp">去逛逛</a></div> -->
    		<div style="width: 100%; height:400px;text-align:center;line-height:300px; border:1px dotted #FFF;font-size:24px; ">空空如也~<a href="/cakes/index.jsp">去逛逛</a></div>
    		</c:when>
			<c:otherwise>
				<c:forEach items="${sessionScope.forder.sorders}" var="sorder">
		<div class="th">
			<div class="pro clearfix">
			<a class="fl" href="#">
					<dl class="clearfix">
						<dt class="fl" >
							&emsp;&emsp;&emsp;&emsp;<img src="/cakes/image/${sorder.goods.gpic}" style="width:120px;height:120px">
						</dt>
						<dd class="fl">
							<p>${sorder.sname}</p>
						</dd>
					</dl>
					</a>
			</div>
			<div class="price">&emsp;&emsp;&emsp;&emsp;&emsp;${sorder.goods.gprice}</div>
			<div class="number">
				<p class="num clearfix">
					<!-- <img class="fl sub" src="/cakes/image/sub.jpg"> 
					<span class="fl"><input type="text" value="${sorder.snumber}" size="2" /></span>
					<img class="fl add" src="/cakes/image/add.jpg"> -->
					&emsp;&emsp;&emsp;<input type="text" value="${sorder.snumber}" size="2" />
				</p>
			</div>
			<div class="price sAll">&emsp;&emsp;&emsp;&emsp;&emsp;${sorder.sprice}</div>
			<div class="price">
				 &emsp;&emsp;&emsp;&emsp;&emsp;<a class="del" href="/cakes/ForderSer?status=deleteSorder&gid=${sorder.goods.gid}">删除</a>
			</div>
		</div>				
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<div class="tr clearfix">
			<p class="fl">
				<a href="/cakes/ForderSer?status=deleteForder" class="del">清空购物车</a>
			</p>
			<p class="fr">
				<span>合计:&nbsp;<small id="all">${sessionScope.forder.ftotal}</small></span> <a
					href="/cakes/users/forderInfo.jsp" class="count">结算</a>
			</p>
		</div>
	</div>
	</div>
	<div style="width:100%;height=300px;border:1px dotted #FFF;"><br><br><br><br><br><br><br></div>

<!--返回顶部-->
		<div class="gotop">
			<a href="/cakes/users/showCar.jsp">
			<dl>
				<dt><img src="/cakes/image/gt1.png"/></dt>
				<dd>去购<br/>物车</dd>
			</dl>
			</a>
			<a href="#" class="dh">
			<dl>
				<dt><img src="/cakes/image/gt2.png"/></dt>
				<dd>联系<br/>客服</dd>
			</dl>
			</a>
			<a href="/cakes/users/showUserInfo.jsp">
			<dl>
				<dt><img src="/cakes/image/gt3.png"/></dt>
				<dd>个人<br/>中心</dd>
			</dl>
			</a>
			<a href="#" class="toptop" style="display: none">
			<dl>
				<dt><img src="/cakes/image/gt4.png"/></dt>
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






	<script src="/cakes/js/jquery-1.12.4.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="/cakes/js/public.js" type="text/javascript" charset="utf-8"></script>
	<script src="/cakes/js/pro.js" type="text/javascript" charset="utf-8"></script>
	<script src="/cakes/js/cart.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>
