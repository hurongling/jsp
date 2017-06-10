<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		.trBg{
			background-color: gray;
		}
		.trBg2{
			background-color:white;
		}
		.red1{
			background-color: red;
		}
	</style>
	<script type="text/javascript" src="/cakes/js/jquery-1.4.min.js"></script>
	<script type="text/javascript">
		$("document").ready(function(){
			$("#table1 tr:first").addClass("red1");
			$("#table1 tr").not(":first").mouseover(function(){
				$(this).addClass("trBg");
			});
			$("#table1 tr").mouseout(function(){
				$(this).removeClass("trBg");
			});
			$(".delBtn").click(function(){
				$(this).parent().parent().remove();
				//发送一个删除请求个Ser 
			});
			$(".updBtn").click(function(){
				var chkbox=$(this).parent().prev().prev().children();
				var ctypeTd=chkbox.parent().prev();
				if($(this).val()=="更新"){
					$(this).val("确认");
				 	chkbox.removeAttr("disabled");
				 	ctypeTd.html("<input type='text' size='6' value=" + ctypeTd.html()  + " />");
				}else{
					$(this).val("更新");
					chkbox.attr("disabled","disabled");
					ctypeTd.html(ctypeTd.children().val());
					//发送一个异步请求,让后台与前台同步
					$.post("/cakes/CategorySer",{
						status:"updateCategory",
						cid:$(this).attr("name"),
						ctype:ctypeTd.html(),
						chot:chkbox.attr("checked")});
				}
				
			});
		});
	</script>
  </head>
  
  <body>
    <form action="/cakes/CategorySer" method="post"> 
    	查询:<input type="text" name="ctype" /><br />
    	<input type="submit" value="提交" />
    	<input type="hidden" value="queryCategory" name="status" />
    </form>
    <c:if test="${requestScope.categorys!=null}">
    	<table border="1" width="600" id="table1">
	    	<tr>
	    		<th>编号</th>
	    		<th>类别名</th>
	    		<th>是否热点</th>
	    		<th>所属客服</th>
	    		<th>更新操作</th>
	    		<th>删除操作</th>
	    	</tr>
	    	<c:forEach items="${requestScope.categorys}" var="category" varStatus="num">
	    		<tr>
	    			<td>${num.count}|${category.cid}</td>
	    			<td>${category.ctype}</td>
	    			<td>
	    				<c:choose>
	    					<c:when test="${category.chot==1}">
	    						<input type="checkbox" checked="checked" value="true" disabled="disabled" />
	    					</c:when>
	    					<c:otherwise>
	    						<input type="checkbox" value="true" disabled="disabled" />
	    					</c:otherwise>
	    				</c:choose>
	    			</td>
	    			<td>${category.account.alogin}</td>
	    			<td><input type="button" value="更新" class="updBtn" name="${category.cid}" /></td>
	    			<td><input type="button" value="删除" class="delBtn" name="${category.cid}" /></td>
	    		</tr>
	    	</c:forEach>
    	</table>
    </c:if>
  </body>
</html>
