<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="webapp/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/writestyle.css?ver=1">
	<title>JSP 게시판 웹 사이트</title>
</head>
	<body>
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
		%>
		<%
			if(userID == null) {
		%>
			<script>
				location.href = "login.jsp";
			</script>
		<%
			} else {
		%>
		<form action="writeAction.jsp" method="post">
		    <h3><a href="main.jsp">메인으로 돌아가기</a></h3>
			<table> 
			    <tr><td><h2>글쓰기</h2></td></tr>
			    <tr><td class="header"><strong>Title</strong></td></tr>
			    <tr><td><input type="text" placeholder="제목을 입력하세요" name="bbsTitle"></td></tr>
			    <tr><td class="header"><strong>Comment</strong></td></tr>
			    <tr><td><textarea placeholder="내용을 입력하세요" name="bbsContent"></textarea></td></tr>
			    <tr><td><input type = "file" name = "bbsImage"></td></tr>
			    <tr><td><input type="submit" value="등록"></td></tr>
			</table>
		</form>
		<%
			}
		%>
	</body>
</html>