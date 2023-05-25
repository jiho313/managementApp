<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String loginId = (String) session.getAttribute("loginId");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("게시글 복구", "utf-8"));
		return;
	}
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	if(loginId.equals(board.getCustomer().getCustId()) || "manager".equals(loginId)) {
		board.setDeleted("Y");
		
		boardDao.updateBoard(board);
		
		response.sendRedirect("list.jsp");
		
	} else {
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id");
 		return;
	}

%>