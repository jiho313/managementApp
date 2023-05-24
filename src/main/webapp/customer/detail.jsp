<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 1. 요청 URL - http://localhost/app3/customer/detail.jsp?id=?
	String custId = request.getParameter("id");

	// 2. 요청 URL - http://localhost/app3/customer/detail.jsp?id=?&err=fail
	// 1번의 URL 요청이 온다면 err은 null일 것이다. 그렇기 때문에 이퀄 비교를 할 때는 문자열 리터럴을
	// 왼쪽에 오도록(("fail".equals(err))하여 비교하는 것이 바람직하다. 문자열 객체의 equals메서드는 매개 변수에 null값이 입력될 수 있고,
	// null값이 입력된다면 false를 반환한다. 만약(err.equals("fail")) 이런 코드를 사용했을 떄 err이 null이라면,
	// null.equals("fail")이라는 코드는 실행할 수 없기에 NullPointException예외가 발생한다.
	String err = request.getParameter("err");

	CustomerDao dao = new CustomerDao();
	Customer customer = dao.getCustomerById(custId);
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="고객"/>
</jsp:include>
	<div class="container my-3">
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">고객 상세 정보</h1>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<p>고객의 상세정보를 확인하세요.</p>
				<%
					// 사용중인 고객을 삭제하려 했을 때 출력되게 한다.
					if("fail".equals(err)){
				%>
				<div class="alert alert-danger">
					<strong>삭제 실패</strong> 사용중인 고객은 삭제할 수 없습니다.
				</div>	
				<%
					}
				%>
				<table class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th class="table-dark">아이디</th>
							<td><%=customer.getCustId()%></td>
							<th class="table-dark">이름</th>
							<td><%=customer.getCustName()%></td>
						</tr>
						<tr>
							<th class="table-dark">전화번호</th>
							<td><%=customer.getCustTel()%></td>
							<th class="table-dark">이메일</th>
							<td><%=customer.getCustEmail()%></td>
						</tr>
						<tr>
							<th class="table-dark">적립포인트</th>
							<td><%=customer.getCustPoint()%></td>
							<th class="table-dark">탈퇴여부</th>
							<td><%
		if("No".equals(customer.getCustDisabled())){
%>
					<span class="badge text-bg-primary">사용중</span>
<%		
		} else if ("Yes".equals(customer.getCustDisabled())){
%>
					<span class="badge text-bg-secondary">탈퇴</span>
<%
		}
%>
							</td>
						</tr>
						<tr>
							<th class="table-dark">가입일자</th>
							<td><%=customer.getCustCreateDate()%></td>
							<th class="table-dark">수정일자</th>
							<td><%=customer.getCustUpdateDate()%></td>
						</tr>
					</tbody>
				</table>
				<div class="text-end">
				<%
				// 탈퇴처리가 된 고객일 때 삭제 버튼이 나오도록한다.
					if("Yes".equals(customer.getCustDisabled())){
				%>
					<a href="delete.jsp?id=<%=customer.getCustId()%>"class="btn btn-danger btn-sm">삭제</a> 
				<%
				}
				%>
						<a href="modifyform.jsp?id=<%=customer.getCustId()%>"class="btn btn-warning btn-sm">수정</a> <a href="list.jsp"
						class="btn btn-primary btn-sm">목록</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>