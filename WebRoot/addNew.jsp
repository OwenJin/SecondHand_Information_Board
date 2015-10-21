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

		<title>My JSP 'update.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
	<%
	   if (session.getAttribute("nickName") != null) {
    %>
		<center>
			<h1>
				<font size="9">Second Hand Market</font>
			</h1>
		</center>
		<div class="backtodetail" align="right">
			<a href="main.jsp"><font color="black">Back</font> </a>
		</div>
		<div id="insert">
			<form action="insert_conf.jsp" method="post">
				<table border="1" width="500" align="center">
					<tr>
						<td colspan="150" align="left">
							Title <input type="text" name="title" />
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="detail" rows="5" cols="75">
					        </textarea>
						</td>
					</tr>
				</table>
				<br/>
				<%String name=(String)session.getAttribute("nickName"); %>
				<input type="hidden" name="name" value="<%=name%>"/>
				<input type="submit" value="Add a New Trade" style="margin-left:600px"/>
			</form>
		</div>
		<%} else { %>
		<jsp:forward page="Login.jsp" />
		<%} %>
	</body>
</html>
