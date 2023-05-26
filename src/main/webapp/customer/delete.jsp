<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
// 고객의 삭제 기능을 구현하세요.
	String custId = request.getParameter("id");

	CustomerDao dao = new CustomerDao();
	Customer customer = dao.getCustomerById(custId);
	if("No".equals(customer.getCustDisabled())){	// 사용중인 고객인지 체크
		response.sendRedirect("detail.jsp?id=" + custId + "&err=fail");
		return;
	}
	
	dao.deleteCustomerById(custId);
	
	response.sendRedirect("list.jsp");
%>