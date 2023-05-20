<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 값 조회
	String name = request.getParameter("name");
	String maker= request.getParameter("maker");
	int amount = Integer.parseInt(request.getParameter("amount")) ;
	int price = Integer.parseInt(request.getParameter("price")) ;
	String description = request.getParameter("description") ;
	
	Product product = new Product();
	product.setName(name);
	product.setMaker(maker);
	product.setStock(amount);
	product.setPrice(price);
	product.setDiscountPrice((int)(product.getPrice() *0.9));
	product.setDescription(description);
	
	// 업무로직 수행 - 새 상품정보를 저장시킨다.
	ProductDao dao = new ProductDao();
	dao.insertProduct(product);
	
	// 재요청URL 응답
	// 현재요청URL - http://localhost/app3/product/insert.jsp
	// 재요청URL   - http://localhost/app3/product/list.jsp
	response.sendRedirect("list.jsp");
%>