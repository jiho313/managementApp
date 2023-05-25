<%@page import="java.net.URLEncoder"%>
<%@page import="dao.BoardDao"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Board"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String title = request.getParameter("title");
	String content= request.getParameter("content");
	String loginId = (String) session.getAttribute("loginId");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("게시글 등록", "utf-8"));
		return;
	}
	
	BoardDao boardDao = new BoardDao();
	
	Board board = new Board();

	board.setTitle(title);
	board.setContent(content);
	board.setCustomer(new Customer(loginId));
	
	boardDao.insertBoard(board);
	
	response.sendRedirect("list.jsp?");
%>