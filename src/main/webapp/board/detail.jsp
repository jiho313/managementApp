<%@page import="vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommentDao"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String loginId = (String) session.getAttribute("loginId");

	BoardDao boardDao = new BoardDao();
	
	Board board = boardDao.getBoardByNo(no);
	int commentCnt = boardDao.getCommentCntByBoardNo(no);
	String err = request.getParameter("err");
	
	CommentDao commentDao = new CommentDao();
 	List<Comment> commentList = commentDao.getCommentsByBoardNo(no);
	
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">게시글 상세 정보</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글 상세정보를 확인하세요.</p>
<%
	if ("id".equals(err)){
%>
		<div class="alert alert-danger">
			<strong>게시물 삭제/복구 실패</strong> 자신이 등록한 게시물만 삭제/복구할 수 있습니다.
		</div>
<% 		
	} else if ("id2".equals(err)){
%>	
		<div class="alert alert-danger">
			<strong>게시물 수정 실패</strong> 자신이 등록한 게시물만 수정할 수 있습니다.
		</div>
<%
	} else if("id3".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>댓글 삭제 실패</strong> 자신이 등록한 댓글만 삭제할 수 있습니다.
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
						<th class="table-dark">제목</th>
						<td><%=board.getTitle() %></td>
						<th class="table-dark">작성자</th>
						<td><%=board.getCustomer().getCustName() %></td>
					</tr>
					<tr>
						<th class="table-dark">조회수</th>
						<td><%=board.getReadCnt() %></td>
						<th class="table-dark">댓글갯수</th>
						<td><%=commentCnt %></td>
					</tr>
					<tr>
						<th class="table-dark">등록일</th>
						<td><%=board.getCreateDate() %></td>
						<th class="table-dark">최종수정일자</th>
						<td><%=board.getUpdateDate() %></td>
					</tr>
					<tr>
						<th class="table-dark">첨부파일</th>
						<td colspan="3">
<%
	if (board.getFilename() != null) {
		// 첨부파일이 null이 아닐 때만 화면에 파일명이 표시된다.
%>						
						<%= board.getOriginalFilename() %>
						<a href="download?no=<%=no %>" class="btn btn-outline-primary btn-xs ms-3">다운로드</a>
						
<%
	}
%>						
						</td>
					</tr>
				</tbody>
				</table>
				<div class="mt-3">
					<p><%=board.getContent()%></p>
				</div>
				
				<div class="text-end">
<%
	if (board.getCustomer().getCustId().equals(loginId) || "manager".equals(loginId)) {
		// 상품에 맞는 detail.jsp를 재요청하는 Url을 응답으로 보내기 위해 상품 번호를 요청메세지에 포함한다.
%>
				<a href="modifyform.jsp?no=<%=no %>" class="btn btn-warning btn-sm">수정</a>
<%
		if ("N".equals(board.getDeleted())) {
%>				
					<a href="delete.jsp?no=<%=no %>" class="btn btn-danger btn-sm">삭제</a>
<%
		} else {
%>
				<a href="enable.jsp?no=<%=no %>" class="btn btn-success btn-sm">복구</a>
<%
		}
	}
%> 
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
			</div>
		</div>
	</div>
	<div class="row mb-3">
   		<div class="col-12">
			<form class="border bg-light p-2" method="post" action="insertComment.jsp">
				<input type="hidden" name="boardNo" value="<%= no %>" />
 				<div class="row">
					<div class="col-11">
						<textarea rows="2" class="form-control" name="content"></textarea>
					</div>
					<div class="col-1">
						<button class="btn btn-outline-primary h-100">등록</button>
					</div>
				</div>
			</form>   	
   		</div>
   	</div>
	<div class="row mb-3">
   		<div class="col-12">
<%
	for (Comment comment : commentList) { 
%>
   			<div class="border p-2 mb-2">
	   			<div class="d-flex justify-content-between mb-1">
	   				<span><%=comment.getCustomer().getCustName() %></span> <span class="text-muted"><%=comment.getCreateDate() %></span>
	   			</div>
	   			<div>
	   				<%=comment.getContent() %>
<%
	if (comment.getCustomer().getCustId().equals(loginId)) {
%>
	   				<a href="deleteComment.jsp?no=<%=no %>&cno=<%=comment.getNo() %>" 
	   					class="btn btn-link text-danger text-decoration-none float-end"><i class="bi bi-trash"></i></a>
<%
	}
%>
	   			</div>   			
   			</div>
<%
	}
%>
   		</div>
   	</div>
</div>
</body>
</html>