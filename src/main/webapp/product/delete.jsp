<%@page import="dao.ReviewDao"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL - localhost/app3/product/delete.jsp?no= ?
			
	// 요청 파라미터 값 조회
	int productNo = Integer.parseInt( request.getParameter("no"));

	// 업무 로직 수행 - 요청 파라미터로 전달받은 상품번호에 해당하는 상품정보를 삭제하기
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(productNo);
	// 재요청 URL 응답보내기
	response.sendRedirect("list.jsp");
%>