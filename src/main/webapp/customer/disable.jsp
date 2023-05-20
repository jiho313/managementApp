<%@page import="java.util.Date"%>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 탈퇴여부를 Yes로 변경해서 탈퇴처리 시키세요.
	String custId = request.getParameter("id");
	CustomerDao dao = new CustomerDao();
	Customer customer = dao.getCustomerById(custId);
	
	// 고객 상세정보 조회에서 사용하기 위해 만든 getCustomerById메서드를 재사용해 Customer객체를 가져오고
	// 가져온 Customer객체의 custDisabled값을 현 jsp 목적에 맞게 "Yes"로 변경했다. 
	customer.setCustDisabled("Yes");
	customer.setCustUpdateDate(new Date());
	
	dao.UpdateCustomer(customer);
	
	response.sendRedirect("list.jsp");
	
%>
