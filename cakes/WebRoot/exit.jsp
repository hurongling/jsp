<%@ page contentType="text/html;charset=utf-8" %>
<html>
<body>

<%
session.removeAttribute("email");
out.print("<script>alert('退出成功！');window.location.href='ulogin.jsp'</script>");
 %>

</body></html>
