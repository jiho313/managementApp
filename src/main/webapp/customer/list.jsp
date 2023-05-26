<%@page import="vo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	CustomerDao dao = new CustomerDao();
	List<Customer> customers = dao.getCustomers();
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
				<h1 class="border bg-light fs-4 p-2">고객 목록</h1>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<p>전체 고객 목록을 확인하세요.</p>

				<table class="table table-sm">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>연락처</th>
							<th>이메일</th>
							<th>탈퇴여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Customer customer : customers) {
						%>
						<tr>
							<td><%=customer.getCustId()%></td>
							<td><a href="detail.jsp?id=<%=customer.getCustId()%>"class="text-black text-decoration-none"><%=customer.getCustName()%></a></td>
							<td><%=customer.getCustTel()%></td>
							<td><%=customer.getCustEmail()%></td>
							<td>
<%
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
							
							<%
							if ("No".equals(customer.getCustDisabled())) {
							%>
							<td><a href="disable.jsp?id=<%=customer.getCustId()%>"class="btn btn-outline-danger btn-xs">탈퇴처리</a></td>
							<%
							} else {
							%>
							<td><a href="enable.jsp?id=<%=customer.getCustId()%>"class="btn btn-outline-success  btn-xs">복구처리</a></td>
							<%
							}
							%>
						</tr>
						<%
	}
%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>