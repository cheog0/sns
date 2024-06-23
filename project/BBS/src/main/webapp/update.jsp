<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/writestyle.css?ver=1">
	<title>JSP 게시판 웹 사이트</title>
</head>
	<body>
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if (userID == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href = 'login.jsp");
				script.println("<script>");
			}
			int bbsID = 0;
			if (request.getParameter("bbsID") != null) {
				bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if (bbsID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href = 'main.jsp");
				script.println("<script>");
				
			}
			Bbs bbs = new BbsDAO().getBbs(bbsID);
			if(!userID.equals(bbs.getUserID())) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href= 'main.jsp'");
				script.println("</script>");
			}
		%>
		<form method="post" action="updateAction.jsp?bbsID=<%=bbsID %>">
		    <h3><a href="main.jsp" class="main-btn">메인으로 돌아가기</a></h3>
			<table> 
			    <tr><td><h2>글쓰기</h2></td></tr>
			    <tr><td class="header"><strong>Title</strong></td></tr>
			    <tr><td><input type="text" placeholder="글 제목" name="bbsTitle"></td></tr>
			    <tr><td class="header"><strong>Comment</strong></td></tr>
			    <tr><td><textarea placeholder="글 내용" name="bbsContent"></textarea></td></tr>
			    <tr><td><input type = "file" name = "bbsImage"></td></tr>
			    <tr><td><input type="submit" value="수정"></td></tr>
			</table>
		</form>
		<div>
			<a href = "deleteAction.jsp?bbsID=<%= bbsID %>" class ="delete-btn">삭제</a>
		</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>