<%@page import="vo.Board"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	String loginId = (String) session.getAttribute("loginId");
	int boardNo = Integer.valueOf(request.getParameter("boardNo"));
	String content = request.getParameter("content");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("댓글등록", "utf-8"));
		return;
	}

	CommentDao commentDao = new CommentDao();
	Comment comment = new Comment();
	
	comment.setContent(content);
	comment.setCustomer(new Customer(loginId));
	comment.setBoard(new Board(boardNo));
	
	commentDao.insertComment(comment);
	
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>

