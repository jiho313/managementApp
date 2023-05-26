<%@page import="dao.CustomerDao"%>
<%@page import="util.DaoHelper"%>
<%@page import="vo.Customer"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 회원가입 기능을 구현하세요.
	Customer customer = new Customer();
	CustomerDao dao = new CustomerDao();

	String id = request.getParameter("id");
	String password= request.getParameter("password");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	
	customer.setCustId(id);
	customer.setCustPassword(password);
	customer.setCustName(name);
	customer.setCustTel(tel);
	customer.setCustEmail(email);
	
	// 아이디 중복체크
	if (dao.getCustomerById(id) != null){
		response.sendRedirect("form.jsp?err=id");
		return;
	}
	
	// 이메일 중복체크
	if (dao.getCustomerByEmail(email) != null){
		response.sendRedirect("form.jsp?err=email");
		return;
	}
	
	dao.insertCustomer(customer);
	
	response.sendRedirect("registered.jsp");
	
	
%>