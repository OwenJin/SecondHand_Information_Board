<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
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
		<center>
			<h1>
				<font size="9">Second Hand Market</font>
			</h1>
		</center>
		<div class="backtodetail" align="right">
			<a href="details.jsp"><font color="black">Back</font> </a>
		</div>
		<%
		   if (session.getAttribute("nickName") != null) {
		%>
		<%!String dbDriver = "com.miscrosoft.sqlserver.jdbc.SQLServerCriver";
	String dbUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=guestbook";
	String dbUser = "owen";
	String dbPassword = "lghlmclyhblsqt";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;%>
		<%  int id = Integer.parseInt(request.getParameter("id"));
			try {
				Class.forName(dbDriver);
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				pstmt = conn
						.prepareStatement("SELECT nickname, title, detail, time FROM dbSHInformation WHERE id=?");
				pstmt.setInt(1, id);
				rs = pstmt.executeQuery();
		%>
		<div id="update">
			<form action="update_conf.jsp" method="post">
				<table border="1" width="500" align="center">
					<%
						rs.next();
							String name = rs.getString(1);
							String title = rs.getString(2);
							String detail = rs.getString(3);
					%>
					<tr>
						<td colspan="0" align="left"><%=name%>
						</td>
						<td colspan="150" align="left">
							<input type="text" name="title" value="<%=title%>" />
						</td>
					</tr>
					<tr>
						<td colspan="0">
							&nbsp;
						</td>
						<td>
							<textarea name="detail" rows="5" cols="75">
					    <%=detail%></textarea>
						</td>
					</tr>
				</table>
				<br/>
				<input type="hidden" name="id" value="<%=id%>"/>
				<input type="submit" value="update" style="margin-left:600px"/>
			</form>
		</div>
		<%
			rs.close();
			pstmt.close();
			conn.close();
			} catch (Exception e) {
		%>
		<jsp:forward page="error.jsp" />
		<%
			} finally {
			}
		%>
		<%} else { %>
		<jsp:forward page="Login.jsp" />
		<%} %>
	</body>
</html>
