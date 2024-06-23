<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/joinsns.css?ver=1">
<title>JSP 게시판 웹 사이트</title>
</head>
	<body>
		<form method="post" action = "joinAction.jsp">
		      <h1 class="login-title">회원가입</h1>
		      <div>
		        <label for="userId">아이디</label>
		        <input id="userId" name="userID">
		      </div>
		      <div>
		        <label for="password">비밀번호</label>
		        <input id="password" name="userPassword" type="password">
		      </div>
		      <div>
		        <label for="username">이름</label>
		        <input id="username" name="userName">
		      </div>
		      <div>
		        <label for="email">이메일</label>
		        <input id="email" name="userEmail" type="email">
		      </div>
		      <div>
		        <label>성별</label>
		        <label>
		        <input name="userGender" value="male" type="radio">
		        남성
		        </label>
		        <label>
		        <input name="userGender" value="female" type="radio">
		        여성
		        </label>
		      </div>  
		      <input type = "submit" id = "join" value = "회원가입">
		      <a href="login.jsp" class="button">Go to login</a>
		</form>
	</body>
</html>
