<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
    String userID = (String) session.getAttribute("userID");
    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요');");
        script.println("location.href = 'login.jsp';");
        script.println("</script>");
        return;
    }

    int bbsID = 0;
    if (request.getParameter("bbsID") != null) {
        try {
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        } catch (NumberFormatException e) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.');");
            script.println("location.href = 'main.jsp';");
            script.println("</script>");
            return;
        }
    }

    Bbs bbs = null;
    BbsDAO bbsDAO = new BbsDAO();
    try {
        bbs = bbsDAO.getBbs(bbsID);
    } catch (Exception e) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('게시물 검색 중 오류가 발생했습니다.');");
        script.println("location.href = 'main.jsp';");
        script.println("</script>");
        return;
    }

    if (bbs == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('게시물을 찾을 수 없습니다.');");
        script.println("location.href = 'main.jsp';");
        script.println("</script>");
        return;
    }

    String bbsTitle = request.getParameter("bbsTitle");
    String bbsContent = request.getParameter("bbsContent");
    String bbsImage = request.getParameter("bbsImage");

    if (bbsTitle == null || bbsContent == null || bbsImage == null ||
        bbsTitle.isEmpty() || bbsContent.isEmpty() || bbsImage.isEmpty()) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        return;
    }

    int result = bbsDAO.update(bbsID, bbsTitle, bbsContent, bbsImage);
    if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('글 수정에 실패했습니다.');");
        script.println("history.back();");
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'main.jsp';");
        script.println("</script>");
    }
%>
</body>
</html>

