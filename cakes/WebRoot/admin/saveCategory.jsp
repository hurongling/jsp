<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'saveCategory.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
.error {
	color: #ff0000;
}
</style>
    <script type="text/javascript" src="/cakes/js/jquery-1.4.min.js"></script>
    <script type="text/javascript">
    	/*
    		样式有三种: ID Class 标签选择器
    	*/
    	$("document").ready(function (){
    		 // css 中ID选择器只能在页面使用一次 
    		 $("#ctype").blur(function (){
    		 		var ctype=$(this).val();
    		 		$.post("/t31/CategorySer",{status:"checkCype",ctype:ctype},function(data){
    		 			if(data=="true")
    		 				$("#ctypeError").html("已经占用");
    		 			else
    		 				$("#ctypeError").html("已经占用");
    		 		},"text/html");
    		 });
    	});  //当DOM载入就绪可以查询及操纵时绑定一个要执行的函数。
    </script>
	<script type="text/javascript">
	/*var xmlHttpReq = null;
	function checkCtype() {
		//获取验证的数据
		var ctype = document.getElementById("ctype").value;
		//创建一个XMLHTTPRequest对象
		if (window.ActiveXObject) {
			xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP.3.0");
		} else {
			xmlHttpReq = new XMLHttpRequest();
		}
		var url = "/t31/CategorySer?status=checkCype&ctype=" + ctype;
		//构建一个无刷新的异步请求
		xmlHttpReq.open("POST", url, "true");
		//设置回调函数abc,事件注册
		xmlHttpReq.onreadystatechange = callBack;
		//发送异步请求
		xmlHttpReq.send();
	}
	function callBack() {
		if (xmlHttpReq.readyState == 4 && xmlHttpReq.status == 200) {
			if (xmlHttpReq.responseText == "true") {
				document.getElementById("ctypeError").innerHTML = "已经占用";
			} else {
				document.getElementById("ctypeError").innerHTML = "可以注册";
			}
		}
	}
	function clearError() {
		document.getElementById("ctypeError").innerHTML = "";
	}*/
</script>
	</head>
	<body>
		<form action="/cakes/CategorySer" method="post">
			类别名: 
			<input type="text" name="ctype" id="ctype" />
			<span class="error" id="ctypeError"></span>
			<br />
			是否热点:
			<input type="checkbox" name="chot" value="true" />
			<br />
			<input type="submit" value="提交" />
			<input type="hidden" value="saveCategory" name="status" />
		</form>
	</body>
</html>
