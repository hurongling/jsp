<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>提交订单</title>
<link rel="stylesheet" type="text/css" href="/cakes/css/public.css" />
<link rel="stylesheet" type="text/css" href="/cakes/css/proList.css" />
<link rel="stylesheet" type="text/css" href="/cakes/css/mygxin.css" />

<style>
.inputBorder {
	border: 1px solid #aaa;
}

#login_click{ margin-top:32px; height:40px;}  
#login_click .a   
{  
      
  
    text-decoration:none;  
    background:#2f435e;  
    color:#f2f2f2;  
      
    padding: 10px 30px 10px 30px;  
    font-size:16px;  
    font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;  
    font-weight:bold;  
    border-radius:3px;  
      
    -webkit-transition:all linear 0.30s;  
    -moz-transition:all linear 0.30s;  
    transition:all linear 0.30s;  
      
    }  
   #login_click a:hover { background:#385f9e; }  



</style>

</head>

<body>
	<div class="order cart mt">
		<!-----------------site------------------->
		<div class="site">
			<p class="wrapper clearfix">
				<span class="fl">订单确认</span> <img class="top"
					src="/cakes/image/cartTop02.png"><a
					href="/cakes/users/showCar.jsp" class="fr">返回购物车&gt;</a>
			</p>
		</div>
		<div class="table wrapper">
			<div class="tr">
				<div>商品编号</div>
				<div>商品名称</div>
				<div>商品价格</div>
				<div>商品数量</div>
			</div>
			<c:forEach items="${sessionScope.forder.sorders}" var="sorder">
				<div class="th">
					<div class="pro clearfix">
						<a class="fl" href="#">
							<dl class="clearfix">

								<dt class="fl">
									&emsp;&emsp;&emsp;&emsp;<img
										src="/cakes/image/${sorder.goods.gpic}"
										style="width:120px;height:120px">
								</dt>
								<dd class="fl">
									<br> <br> <br>
									<p>&emsp;&emsp;&emsp;&emsp;${sorder.goods.gid}</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">&emsp;&emsp;&emsp;&emsp;&emsp;${sorder.sname}</div>
					<div class="price">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${sorder.sprice}</div>
					<div class="price">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${sorder.snumber}</div>
				</div>
			</c:forEach>
			<div class="tr clearfix">
				<p class="fr">
					<span>合计:&nbsp;<small id="all">${sessionScope.forder.ftotal}</small></span>
				</p>
			</div>

			<h1>配送信息填写:</h1>
			<br />
			<form action="/cakes/ForderSer" method="post" style="font-size:20px;">
				收货人姓名:<input type="text" name="fname"
					value="${sessionScope.users.uname}" size=14px class="inputBorder" /><br />
				电话:<input class="inputBorder" type="text" name="fphone"
					value="${sessionScope.users.uphone}" /><br /> 
					地址:<input class="inputBorder" type="text" name="fphone"
					value="${sessionScope.users.uaddress}" /><br />邮箱:<input
					class="inputBorder" type="text" name="femail"
					value="${sessionScope.users.uemail}" /><br /> 邮编:<input
					class="inputBorder" type="text" name="fpost"
					value="${sessionScope.users.upost}" /><br /> 留言:<input
					class="inputBorder" type="text" name="fremark" /><br />
				<br /> 
				<div id="login_click">
				<input class="a" style="background-color: red;" type="submit" value="去支付" /> 
				<input type="hidden" name="status" value="saveForder" />
				</div >
				<br /> 
				
			</form>
			
		</div>
	</div>
	<br />
	<br />
	<!--返回顶部-->
	<div class="gotop">
		<a href="/cakes/users/showCar.jsp">
			<dl>
				<dt>
					<img src="/cakes/image/gt1.png" />
				</dt>
				<dd>
					去购<br />物车
				</dd>
			</dl>
		</a> <a href="#" class="dh">
			<dl>
				<dt>
					<img src="/cakes/image/gt2.png" />
				</dt>
				<dd>
					联系<br />客服
				</dd>
			</dl>
		</a> <a href="/cakes/users/showUserInfo.jsp">
			<dl>
				<dt>
					<img src="/cakes/image/gt3.png" />
				</dt>
				<dd>
					个人<br />中心
				</dd>
			</dl>
		</a> <a href="#" class="toptop" style="display: none">
			<dl>
				<dt>
					<img src="/cakes/image/gt4.png" />
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
