<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String loginId = (String)session.getAttribute("loginId");	

	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("게시글 수정", "utf-8"));
		return;
	}
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(no);
	
	if (!loginId.equals(board.getCustomer().getCustId())){
		response.sendRedirect("detail.jsp?no=" + no + "&err=id2");
		return;
	}
	
	board.setTitle(title);
	board.setContent(content);
	board.setDeleted("N");
	board.setNo(no);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no=" + no);
	
%>