<%@page import="java.util.Date"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 상품 정보 변경
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String maker = request.getParameter("maker");
	int price = Integer.parseInt(request.getParameter("price"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	String description = request.getParameter("description");

	ProductDao dao = new ProductDao();
	Product product = dao.getProductByNo(no);
	product.setName(name);
	product.setMaker(maker);
	product.setPrice(price);
	product.setStock(amount);
	product.setDescription(description);
	product.setUpdateDate(new Date());

	dao.updateProduct(product);
	
	response.sendRedirect("detail.jsp?no=" + no);
	
	

%>