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

		<title>My JSP 'reply_conf.jsp' starting page</title>

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

		<%!String dbDriver = "com.mysql.jdbc.Driver";
	       String dbUrl = "jdbc:mysql://localhost:3306/guestbook";
           String dbUser = "owen";
	       String dbPassword = "lghlmclyhblsqt";
	       Connection conn = null;
	       PreparedStatement pstmt = null;%>
		<%
			if (session.getAttribute("nickName") != null) {
				int id = 0;
				int rid = 0;
				String comment = "";
				String commenter = "";
				boolean insert = false;
				try {
					comment = request.getParameter("comment");
					commenter = (String) session.getAttribute("nickName");
					id = Integer.parseInt(request.getParameter("id"));
					rid = Integer.parseInt(request.getParameter("rid")) + 1;
				} catch (Exception e) {
				}

				try {
					Class.forName(dbDriver);
					conn = DriverManager.getConnection(dbUrl, dbUser,
							dbPassword);
					pstmt = conn
							.prepareStatement("INSERT INTO dbComment (commenter, comment, id, rid, rtime) VALUES(?,?,?,?,?)");
					pstmt.setString(1, commenter);
					pstmt.setString(2, comment);
					pstmt.setInt(3, id);
					pstmt.setInt(4, rid);
					pstmt.executeUpdate();
					pstmt.close();
					conn.close();
					insert = true;
				} catch (Exception e) {
		%>
		<jsp:forward page="error.jsp" />
		<%
			} finally {
				}

				if (insert) {
		%>
		<jsp:forward page="details.jsp" />
		<%
			} else {
		%>
		<jsp:forward page="error.jsp" />
		<%
			}
			} else {
		%>
		<jsp:forward page="Login.jsp" />
		<%
			}
		%>


	</body>
</html>
