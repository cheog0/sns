<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My SNS</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainde.css?ver=1">
</head>
	<body>
		<%
		    int pageNumber = 1;
		    if (request.getParameter("pageNumber") != null) {
		        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		    }
		    String userID = (String) session.getAttribute("userID");  // 세션에서 userID 가져오기
		    if (userID == null) {
		%>
		    <script>
		        location.href = 'login.jsp';
		    </script>
		<%
		    } else {
		%>
		<%
			int bbsID = 0;
			if (request.getParameter("bbsID") != null) {
				bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
		%>
		    <div id="body-container">
		        <div class="header-container desktop">
		            <div id="header-wrapper">
		                <div id="header-wrapper-left">
		                    <a href="write.jsp" class="write">글쓰기</a>
		                </div>
		                <div id="header-wrapper-center">
		                    <input type="text" placeholder="검색">
		                </div>
		                <div id = "header-wrapper-center">
		                	<a href="logoutAction.jsp" class="logout-link">Logout</a>
		                </div>
		                <div id="header-wrapper-right">
		                    <img class="header-items" src="img/insta-logo/home@3x.png" alt="">
		                </div>
		            </div>
		        </div>
		        <div class="content-container desktop">
		            <div id="content-wrapper-left">
		                <%
		                    BbsDAO bbsDAO = new BbsDAO();
		                    ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
		                    for(int i =0; i < list.size(); i++) {
		                %>
		                <div class="content-post-wrapper">
		                    <div class="posts">
							    <div class="post-id">
							        <div class="post-id-left">
							            <%
							                Bbs currentPost = list.get(i); // Get the current post from the list
							                if (userID != null && userID.equals(currentPost.getUserID())) {
							            %>
							                <a href="update.jsp?bbsID=<%= currentPost.getBbsID() %>"><b><%= currentPost.getUserID() %></b></a>
							            <%
							                } else {
							            %>
							                <b><%= currentPost.getUserID() %></b>
							            <%
							                }
							            %>
							        </div>
							    </div>
							    <div class="post-photo">
							        <img src="img/<%= currentPost.getBbsImage() %>" alt="<%= currentPost.getBbsImage() %>">
							    </div>
							    <div class="post-buttons">
							        <div class="post-buttons-left">
							            <img src="img/insta-logo/like@3x.png" alt="">
							        </div>
							        <div class="post-buttons-right">
							            <img src="img/insta-logo/favorite@3x.png" alt="">
							        </div>
							    </div>
							    <div class="post-like-msg">
							        <div class="post-like-msg-wrapper">
							            <span><b><%= currentPost.getBbsContent() %></b></span>
							        </div>
							    </div>
							    <div class="post-comment">
							        <p>설유준<span class="friends-comment">안녕하세요</span></p>
							        <p>설유준<span class="friends-comment">안녕하세요</span></p>
							        <form action="chatAction.jsp" method="post">
							            <table>
							                <tr><td><input type="text" placeholder="댓글을 입력하세요" name="bbsChat"></td></tr>
							                <tr><td><input type="submit" value="등록"></td></tr>
							            </table>
							        </form>
							        <div class="post-time">
							            <p>
							                <%= currentPost.getBbsDate().substring(0, 11) %>
							                <%= currentPost.getBbsDate().substring(11, 13) %>시
							                <%= currentPost.getBbsDate().substring(14, 16) %>분
							            </p>
							        </div>
							    </div>
						    </div>
						</div>
					<% } %>
		            </div>
		            <div id="content-wrapper-right">
		                <div id="recommend-header">
		                    <div id="recommend-header-left">회원님을 위한 추천</div>
		                    <div id="recommend-header-right">모두 보기</div>
		                </div>
		                <div id="recommend-content">
		                    <div class="recommend-item">
		                        <div class="recommend-content-left">
		                            <img class="post-id-photo" src="img/my-photo.jpg" alt="">
		                            <div>
		                                <div class="recommend-id">설유준</div>
		                                <div class="recommend-notice">설유준님이 팔로우 합니다</div>
		                            </div>
		                        </div>
		                        <div class="recommend-content-right">
		                            <a href="#">팔로우</a>
		                        </div>
		                    </div>
		                    <!-- 추가 추천 아이템들 -->
		                </div>
		            </div>
		        </div>
		    </div>
		    <div id="footer-container">
		        <img class="footer-items" src="img/insta-logo/home@3x.png" alt="">
		        <img class="footer-items" src="img/insta-logo/search@3x.png" alt="">
		        <img class="footer-items" src="img/insta-logo/trending@3x.png" alt="">
		        <img class="footer-items" src="img/insta-logo/like@3x.png" alt="">
		        <img class="footer-items" src="img/insta-logo/home@3x.png" alt="">
		    </div>
		<% 
			} 
		%>
	</body>
</html>
