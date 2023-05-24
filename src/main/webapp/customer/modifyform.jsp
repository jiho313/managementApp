<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String custId = request.getParameter("id");
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
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="고객"/>
</jsp:include>
	<div class="container my-3">
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">회원 정보 수정</h1>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<p>변경할 고객 정보를 입력하세요.</p>

				<form class="border bg-light p-3" method="post" action="update.jsp">
					<div class="form-group mb-2">
						<label class="form-label">아이디</label> <input type="text"class="form-control bg-light" name="id" value="<%=custId%>" readonly="readonly" />
					</div>
					<div class="form-group mb-2">
						<label class="form-label">비밀번호</label> <input type="password"
							class="form-control" name="password" />
					</div>
					<div class="form-group mb-2">
						<label class="form-label">전화번호</label> <input type="text"
							class="form-control" name="tel" />
					</div>
					<div class="form-group mb-2">
						<label class="form-label">이메일</label> <input type="text"
							class="form-control" name="email" />
					<div class="form-group mb-2">
						<label class="form-label">적립포인트</label> <input type="text"
							class="form-control" name="point" />
					</div>
					</div>
					<div class="text-end">
						<button type="reset" class="btn btn-secondary btn-sm">취소</button>
						<button type="submit" class="btn btn-primary btn-sm">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>