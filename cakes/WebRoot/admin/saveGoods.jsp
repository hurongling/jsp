<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>糕糕在上</title>
	</head>
	<body>
		<div id="top">
			<h1>
				商品添加页面
			</h1>
			<div id="form">
				<form action="/cakes/GoodsSer" method="post" >
					<div id="infor">
						<div id="inputs2">
							<span>商品名称:</span>
							<span><input type="text" name="gname" id="gname" /> </span><span
								id="gnameError">*</span>
						</div>
					</div>


					<div id="infor">
						<div id="inputs1">
							<span>商品单价:</span>
							<span><input type="text" name="gprice" id="gprice" /> </span><span
								id="gpriceError">*</span>
						</div>
					</div>

					<div id="infor">
						<div id="inputs1">
							<span>商品图片:</span>
							<!--<span><input type="file" name="gpic" /></span>-->
							<span><input type="text" name="gpic" id="gpic" /></span> 
						</div>
						<div id="infor">
							<div id="inputs1">
								<span>是否推荐:</span>
								<input type="radio" name="giscommend" value="1" />是 
								<input type="radio" name="giscommend" value="0" checked="checked"/>否
							</div>
							<div id="inputs2">
								<span>是否有效:</span>
								<span> 
									<input type="radio" name="gisopen" value="1" checked="checked" />是 
									<input type="radio" name="gisopen" value="0" />否
								</span>
							</div>
						</div>
						<div id="inputs2">
						
						
						<!-- 改为用ctype查询,优化 -->
							<span>商品类别:</span>
							<select name="cid" id="cid">
							<!-- 因为在ConextListener中有这句event.getServletContext().setAttribute("categorys",categoryImpl.queryCategory(""));-->
								<c:forEach items="${applicationScope.categorys}" var="category">
									<option value="${category.cid}">${category.ctype}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div id="textarea1">
						<span id="mesage">产品描述:</span>
						<span><textarea rows="4" cols="64" name="gremark"></textarea></span>
					</div>

					<div id="textarea1">
						<span id="mesage">详细介绍:</span>
						<span><textarea rows="5" cols="64" name="gxremark"></textarea> </span>
					</div>
					<input type="submit" value="添加" />
					<input type="hidden" name="status" value="saveGoods" />
				</form>
			</div>
		</div>
	</body>
</html>
