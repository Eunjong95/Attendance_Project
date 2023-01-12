<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="commentPaging" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>OTI 근태</title>
	
	<!-- Custom fonts for this template-->
	<link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	<!-- fullcalendar CDN -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	<!-- fullcalendar 언어 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	<script src="<c:url value='/js/view.js'/>"></script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/WEB-INF/views/include/header.jsp"/>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Card -->
					<div class="card shadow mb-2">
						<div class="card-header py-3">
							<div>
								<c:if test="${board.boardCategoryId==1}">
									<h6 class="m-0 font-weight-bold texy-primary">자료실</h6>
								</c:if>
								<c:if test="${board.boardCategoryId==2}">
									<h6 class="m-0 font-weight-bold texy-primary">문의게시판</h6>
								</c:if>
							</div>
						</div>
						<div class="card-body">
							<div class="row pl-4">
		                        <div class="col-1">
		                           <h6>No.${board.boardId}</h6>
		                        </div>
		                        <div class="col-10">
		                           <h6>${board.boardTitle}</h6>
		                        </div>
		                        <div class="col-1">
		                           <h6>조회수 ${board.readCount}</h6>
		                        </div>
		                    </div>
							<hr/>
							<div class="row pl-4 pb-4">
								<div class="col-6 d-flex">
									<h6>${board.userId}</h6>
								</div>
								<div class="col-6 d-flex justify-content-end pr-4">
									<h6>${board.boardDate}</h6>
								</div>
							</div>
							<div class="row pl-5 py-4">
								<h6>${board.boardContent}</h6>
							</div>
							<hr />
							<div class="row pl-4 pb-2">
								<div class="col-1">
									<h6>첨부파일</h6>
								</div>
								<div class="col-11">
									<c:if test="${!empty board.bFileName}">
										<div>
											<c:set var="len" value="${fn:length(board.bFileName)}" />
											<c:set var="filetype"
												value="${fn:toUpperCase(fn:substring(board.bFileName, len-4, len))}" />
											<c:if
												test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
												<img src='<c:url value="/file/${board.bFileId}"/>'
													class="img-thumbnail">
												<br>
											</c:if>
											<a href='<c:url value="/file/${board.bFileId}"/>'>${board.bFileName}(${board.bFileSize}byte)</a>
										</div>
									</c:if>
								</div>
							</div>
							<hr />
							<div class="d-flex justify-content-center">
								<a href='<c:url value="/board/update/${board.boardId}"/>'
									class="btn btn-primary btn-sm mr-1 text-center" >수정</a>
								<form id="deleteBoard" action="<c:url value='/board/delete'/>" method="POST">
								    <input type="hidden" name="boardId" value="${board.boardId}">
								    <input type="hidden" name="boardCategoryId" value="${board.boardCategoryId}">
								    
								    <button type="submit" class="btn btn-primary btn-sm mr-1 text-center" form="deleteBoard" >삭제</button>
						    	
						    	</form>
							</div>
						</div>
					</div>

					<!-- comment : 카테고리가 문의게시판일 때만 뜨게 -->
					<c:if test="${board.boardCategoryId==2}">
						<div class="card shadow mb-2">
							<div class="card-body">
								<div class="pl-4">
									<h6>Comment</h6>
								</div>
								<hr />

								<!-- 댓글 작성부 -->
								<form id="commentForm" name="commentForm" method="post" action="<c:url value='/board/comment/write'/>">
									<div class="row pl-4">
										<div class="col-8">
											<textarea class="form-control" rows="1" id="commentContent" name="commentContent"></textarea>
										</div>
										<input type="hidden" name="userId" value="${userId}">
										<input type="hidden" name="boardId" value="${board.boardId}">
										<div class="d-flex col-2 justify-content-end">
											<button type="submit" class="btn btn-primary btn-sm">등록</button>
										</div>
									</div>
								</form>
								<hr/>

								<!-- DB에서 댓글 가져오기 -->
								<c:if test="${board.commentList!=null}">
									<c:forEach var="comments" items="${board.commentList}">
										<div id="comment${comments.commentId }" class="row pl-4 my-3">
											<div class="col-1">
												<h6>${comments.userId}</h6>
											</div>
											<div id="commentContent${comments.commentId}" class="col-8">
												<h6>${comments.commentContent}</h6>
											</div>
											<div id="commentDate${comments.commentId}" class="col-1 pl-2">
												<h6 id="commentDate${comments.commentId}">${comments.commentDate}</h6>
											</div>
											<c:if test="${comments.userId eq userId}">
												<div id="commentForm" class="d-flex col-2 justify-content-end">
													<button id="commentUpdateBtn${comments.commentId}" onclick="updateComment(${comments.commentId})" class="btn btn-primary btn-sm text-center mr-1" >수정</button>
													
													<form id="commentdeleteForm" name="commentForm" method="post" action="<c:url value='/board/comment/delete'/>">
														<input type="hidden" name="commentId" value="${comments.commentId}">
														<button type="submit" class="btn btn-primary btn-sm text-center">삭제</button>
													</form> 
												</div>
											</c:if>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${empty board.commentList}">
									<div class="row my-3 justify-content-center">
										<div>작성된 댓글이 없습니다.</div>
									</div>
								</c:if>
								<hr />
								<!-- 댓글 페이징 -->
								<div class="row">
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_info" id="dataTable_info" role="status"
											aria-live="polite"></div>
									</div>
									<div class="col-sm-12 col-md-1">
										<div class="d-flex justify-content-center">
											<table border="0">
												<tr>
													<td align="center"><commentPaging:commentPaging
															boardId="${board.boardId}"
															totalCommentPage="${totalCommentPage}"
															boardPage="${page}" nowPage="${cPage}" /></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<!-- /.container-fluid -->
				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<jsp:include page="/WEB-INF/views/include/logout.jsp"/>

		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		<!-- End of Footer -->
</body>

</html>