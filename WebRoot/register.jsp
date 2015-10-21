<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	errorPage="error.jsp"%>
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
				<font size="9">Register for Membership</font>
			</h1>
		</center>
		<center>
			<form action="register_conf" method="post">
				<table border="0">
					<tr>
						<td align="left">
							Email
						</td>
						<td>
							<input type="text" name="email">
						</td>
					</tr>
					<tr>
						<td align="left">
							Password
						</td>
						<td>
							<input type="password" name="password" />
						</td>
					</tr>
					<tr>
						<td align="left">
							Retype Password
						</td>
						<td>
							<input type="password" name="re-password" />
						</td>
					</tr>
					<tr>
						<td align="left">
							Gender
						</td>
						<td>
							<input type="radio" name="gender" value="male" />
							Male
							<br />
							<input type="radio" name="gender" value="female" />
							Female
							<br />
						</td>
					</tr>
					<tr>
						<td align="left">
							Nickname
						</td>
						<td>
							<input type="text" name="nickname" />
						</td>
					</tr>
					<tr><td colspan="2" align="center"><input type="submit" value="Register"/></td></tr>
				</table>
			</form>
		</center>
	</body>
</html>
