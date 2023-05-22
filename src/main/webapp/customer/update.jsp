<%@page import="java.util.Date" %>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객 정보 변경 구현
	String custId = request.getParameter("id");
	String custPassword = request.getParameter("password");
	String custTel = request.getParameter("tel");
	String custEmail = request.getParameter("email");
	int custPoint = Integer.parseInt(request.getParameter("point"));

	CustomerDao dao = new CustomerDao();
	Customer customer = dao.getCustomerById(custId);
	customer.setCustPassword(custPassword);
	customer.setCustTel(custTel);
	customer.setCustEmail(custEmail);
	customer.setCustPoint(custPoint);
	customer.setCustUpdateDate(new Date());	
	dao.UpdateCustomer(customer);
	
	response.sendRedirect("detail.jsp?id=" + custId);
%>