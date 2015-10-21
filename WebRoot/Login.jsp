<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"
	errorPage="erroe.jsp"%>
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
		<center>
			<h1>
				<font size="9">Second Hand Selling</font>
			</h1>
			<form action="Login_conf.jsp" method="post">
				<table border="0">
					<tr>
						<td>
							Email
						</td>
						<td>
							<input type="text" name="username" />
						</td>
					</tr>
					<tr>
						<td>
							Password
						</td>
						<td>
							<input type="password" name="password" />
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<input type="submit" value="Login" />
						</td>
						<td>
							<input type="button" value="register" onclick="window.location.href='register.jsp'" />
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>
