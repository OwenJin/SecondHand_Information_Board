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
		<style>
          textarea {
	         resize: none;
          }
       </style>
		<base href="<%=basePath%>">

		<title>My JSP 'Login_success.jsp' starting page</title>

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
		<div class="account" align="right">
			<a href="Logout.jsp"><font color="black">Logout</font> </a>
		</div>
		<%!String dbDriver = "com.mysql.jdbc.Driver";
	       String dbUrl = "jdbc:mysql://localhost:3306/guestbook";
	       String dbUser = "owen";
	       String dbPassword = "lghlmclyhblsqt";
	       Connection conn = null;
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;%>
		<%
			int id=0;
			int rid = 0;
			try {
			     id = Integer.parseInt(request.getParameter("id"));
				 Class.forName(dbDriver);
				 conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				 pstmt = conn
						 .prepareStatement("SELECT nickname, title, detail, time FROM dbSHInformation WHERE id=?");
				 pstmt.setInt(1, id);
				 rs = pstmt.executeQuery();
		%>
		<div class="details">
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
						<%=title%>
					</td>
					<%
						if (session.getAttribute("isAdmin") == "admin") {
					%>
					<td colspan="1">
						<a href="Delete.jsp?id=<%=id%>">Delete</a>
					</td>
					<%
						}
					%>
				</tr>
				<tr>
					<td colspan="0">
						&nbsp;
					</td>
					<td colspan="150" align="left"><%=detail%></td>
				</tr>
			</table>
			<br/>
			<%String nameFromsession= (String)session.getAttribute("nickName");
			if(name == nameFromsession) { 
			%>
			<input type="button" onclick="window.location.href='update.jsp?id=<%=id%>'" value="update" style="margin-left:500px">
			<%} %>
			<%String update = request.getParameter("update"); 
			if("false".equals(update)) { %>
			Fail to update, please try again.
			<%} %>
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

		<%
			try {
				Class.forName(dbDriver);
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				pstmt = conn
						.prepareStatement("SELECT commenter, comment, rtime, rid FROM dbComment WHERE id=?");
				pstmt.setInt(1, id);
				rs = pstmt.executeQuery();
				while (rs.next() != false) {
					String commenter = rs.getString(1);
					String comment = rs.getString(2);
					rid = rs.getInt(4);
		%>
		<div class="commend">
			<table border="1" width="500" align="center">
				<tr>
					<td colspan="0" align="left"><%=commenter%></td>
					<td colspan="150">
						&nbsp;
					</td>
					<%
						if (session.getAttribute("isAdmin") == "admin") {
					%>
					<td colspan="1" align="right">
						<a href="Delete.jsp?rid=<%=rid%>&id=<%=id%>">Delete</a>
					</td>
					<%
						}
					%>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td colspan="150">
						<%=comment%></td>
				</tr>
			</table>
		</div>
		<%
			}
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
		<div class="reply">
			<h3>
				Reply:
			</h3>
			<br />
			<center>
				<form action="reply_conf.jsp" method="post">
					<%
						if (session.getAttribute("nickName") != null) {
					%>  
					 <textarea name="comment" rows="5" cols="75">
					 </textarea>
					 <br />
					 <input style="width:80px;" type="submit" value="Reply" /><br/>
					<%
					} else {%>
					<textarea readonly="readonly" name="comment" rows="5" cols="75">
		        Please Login or Register Here.
					</textarea><br/>
					<input style="width:80px;" type="button" value="Login" onclick="window.location.href='Login.jsp'" />
					<input style="width:80px;" type="button" value="Register" onclick="window.location.href='register.jsp'" />
					<input type="hidden" name="id" value="<%=id%>"/>
					<input type="hidden" name="rid" value="<%=rid%>"/>
					<%
						}
					%>
				</form>
			</center>
		</div>
	</body>
</html>
