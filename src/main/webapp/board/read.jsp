<%@page import="java.net.URLEncoder"%>
<%@page import="dao.BoardDao"%>
<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String loginId = (String) session.getAttribute("loginId");
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(no);
	
	board.setReadCnt(board.getReadCnt() + 1);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>


