<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
// 고객의 삭제 기능을 구현하세요.
	String custId = request.getParameter("id");

	CustomerDao dao = new CustomerDao();
	dao.deleteCustomerById(custId);
	
	response.sendRedirect("list.jsp");
%>