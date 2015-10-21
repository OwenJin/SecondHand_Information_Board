<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login_conf.jsp' starting page</title>
    
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
    <%String dbDriver = "com.mysql.jdbc.Driver";
	  String dbUrl = "jdbc:mysql://localhost:3306/guestbook";
	  String dbUser = "owen";
	  String dbPassword = "lghlmclyhblsqt";
	  Connection conn = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;%>
		<%
			boolean pass = false;
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			try {
				Class.forName(dbDriver);
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				pstmt = conn
						.prepareStatement("SELECT nickname,admin FROM user WHERE email=? and password=?");
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				rs = pstmt.executeQuery();
				if (rs.next() != false) {
					pass = true;
					session.setAttribute("nickName", rs.getString(1));
					if (rs.getInt(2) == 1) {
						session.setAttribute("isAdmin", "admin");
					} else {
						session.setAttribute("isAdmin", "guest");
					}
				}
				rs.close();
				pstmt.close();
				conn.close();
			} 
			catch (Exception e) {%>
			<jsp:forward page="error.jsp" />
			<%}
			finally {
			}
			%>
			<%
			if(pass){ %>
			<jsp:forward page="details.jsp" />
			<%} %>
  </body>
</html>
