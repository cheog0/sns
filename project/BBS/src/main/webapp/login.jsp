<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css?ver=1">
<title>JSP 게시판 웹 사이트</title>
</head>
	<body>
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="loginAction.jsp">
						<h1 class="login-title"><a href ="main.jsp">Welcome</a></h1>
						<label for="username">아이디</label>
				        <input id="username" name="userID">
				        <label for="password">비밀번호</label>
				        <input id="password" name="userPassword" type="password">
						<input type="submit" class="btn btn-primary form-control" value="로그인">
						<a href="join.jsp" class="Joinpage">회원가입</a>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>


