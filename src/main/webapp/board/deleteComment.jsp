<%@page import="vo.Comment"%>
<%@page import="vo.Board"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dao.CommentDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId"); // hong or null
	int no = Integer.parseInt(request.getParameter("no")); // 1002
	int cno = Integer.parseInt(request.getParameter("cno")); // 2001
	
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("댓글삭제", "utf-8"));
		return;
	}
	
	CommentDao commentDao = new CommentDao();
 	Comment comment = commentDao.getCommentByNo(cno);
	
 	if (!loginId.equals(comment.getCustomer().getCustId())){
 		response.sendRedirect("detail.jsp?no=" + no + "&err=id3");
 		return;
 	}
 	
	commentDao.deleteComment(cno);
	
	
	response.sendRedirect("detail.jsp?no=" + no);
%>