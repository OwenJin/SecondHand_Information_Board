<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'update_conf.jsp' starting page</title>

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
		<%! String dbDriver = "com.mysql.jdbc.Driver";
	        String dbUrl = "jdbc:mysql://localhost:3306/guestbook";
		    String dbUser = "owen";
		    String dbPassword = "lghlmclyhblsqt";
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;%>
			
		<%  String title = request.getParameter("title");
		    String detail = request.getParameter("detail");
		    int id = Integer.parseInt(request.getParameter("id"));
		    boolean update = false;
			try {
				Class.forName(dbDriver);
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				pstmt = conn
						.prepareStatement("UPDATE dbSHInformation set title=?, detail=? WHERE id=?");
				pstmt.setString(1, title);
				pstmt.setString(2, detail);
				pstmt.setInt(3, id);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
				update=true;
				} catch (Exception e) {
			%>
		<jsp:forward page="error.jsp" />
		<%
			} finally {
			}
		%>
		
		<%if(update) {%>
		 <jsp:forward page="details.jsp" />
		 <% } else { %>
		 <jsp:forward page="details.jsp?update=false" />
		 <%}%>
	</body>
</html>
