<%@page import="dao.CustomerDao"%>
<%@page import="util.DaoHelper"%>
<%@page import="vo.Customer"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 회원가입 기능을 구현하세요.
	Customer customer = new Customer();
	CustomerDao dao = new CustomerDao();

	String custId = request.getParameter("id");
	String custPassword= request.getParameter("password");
	String custName = request.getParameter("name");
	String custTel = request.getParameter("tel");
	String custEmail = request.getParameter("email");
	
	
	customer.setCustId(custId);
	customer.setCustPassword(custPassword);
	customer.setCustName(custName);
	customer.setCustTel(custTel);
	customer.setCustEmail(custEmail);
	
	dao.insertCustomer(customer);
	
	response.sendRedirect("registered.jsp");
	
	
%>