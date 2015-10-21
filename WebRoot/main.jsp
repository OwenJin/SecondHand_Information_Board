<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

 <!DOCTYPE HTML PUBLIC "-//W3C// DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'Login_success.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link   type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<center>
			<h1>
				<font size="9">Second Hand Market</font>
			</h1>
		</center>
		<div class="account" align="right">
		    <a href="Login.jsp"><font color="black">Sign in</font> </a>
		    <a href="myAccount.jsp"><font color="black">My Account</font> </a>
			<a href="Logout.jsp"><font color="black">Sign out</font> </a>
		</div>
		<br/>
		<div class="addNew" align="right">
		<%
		   if (session.getAttribute("nickName") != null) {
		%>
		<a href="insert.jsp?name=<%=(String)session.getAttribute("nickName")%>">Add a new trade</a>
		<%} else { %>
		<a href="Login.jsp">Add a new trade</a>
		<%} %>
		</div>
		<%!String dbDriver = "com.mysql.jdbc.Driver";
	       String dbUrl = "jdbc:mysql://localhost:3306/guestbook";
	       String dbUser = "owen";
	       String dbPassword = "lghlmclyhblsqt";
           Connection conn = null;
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;%>
		<%
			try {
				Class.forName(dbDriver);
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				pstmt = conn
						.prepareStatement("SELECT nickname, title, time, id FROM dbSHInformation");
				rs = pstmt.executeQuery();
		%>
		<div class="list">
			<table border="1" width="500" align="center">
				<%
					while (rs.next()) {
							String name = rs.getString(1);
							String title = rs.getString(2);
							int id = rs.getInt(4);
				%>
				<tr>
					<td colspan="100">
						<a href="details.jsp?id=<%=id%>"><%=title%></a>
					</td>
					<td colspan="0"><%=name%>
					</td>
					<%
						if (session.getAttribute("isAdmin") == "admin") {
					%>

					<td colspan="1">
						<a href="Delete.jsp?id=<%=id%>">Delete</a>
					</td>
				</tr>
				<%
					} %>
			</table>
		</div>
		<%}%>

		<%
			rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {%>
		   <jsp:forward page="error.jsp" />
		   <%}finally {
			}
		%>
	</body>
</html>

