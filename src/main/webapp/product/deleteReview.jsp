<%@page import="vo.Review"%>
<%@page import="dao.ReviewDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	/*
		 요청 URL
		 	localhost/app3/product/deleteReview.jsp?no=상품번호&rno=리뷰번호
	*/
	
	//요청 파라미터값 조회하기
	int productNo = Integer.parseInt(request.getParameter("no"));
	int reviewNo = Integer.parseInt(request.getParameter("rno"));
	
	// 세션에서 로그인한 사용자 정보 조회학
	String loginId =(String) session.getAttribute("loginId");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("리뷰삭제", "utf-8"));
		return;
	}
	
	// 리뷰의 작성아이디와 로그인아이디가 일치하는지 체크
	ReviewDao reviewDao = new ReviewDao();
 	Review review = reviewDao.getReviewByNo(reviewNo);
 	
 	if (!loginId.equals(review.getCustomer().getCustId())){
 		response.sendRedirect("detail.jsp?no=" + productNo + "&err=id");
 		return;
 	}
 	
 	// 리뷰정보 삭제
 	reviewDao.deleteReviewByNo(reviewNo);
 	
 	// detail.jsp를 재요청하는 Url을 응답으로 보내기 위해 상품 번호를 입력받았다.
 	response.sendRedirect("detail.jsp?no=" + productNo);
	
%>