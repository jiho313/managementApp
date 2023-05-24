<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String loginId = (String) session.getAttribute("loginId");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("게시글 삭제", "utf-8"));
		return;
	}
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	if(!loginId.equals(board.getCustomer().getCustId())) {
 		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id");
 		return;
	}
	
	boardDao.deleteBoard(boardNo);
	
	response.sendRedirect("list.jsp");

%>