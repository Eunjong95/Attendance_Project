<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 작성</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- Custom fonts for this template-->
		<link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

		<!-- Custom styles for this template-->		
		<link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		
	</head>
	<body id="page-top">
		
		<!-- page Wrapper -->
		<div id= "wrapper">
			
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
						
						<!-- 작성 폼  -->
						<div class="card border-left-primary shadow h-100 py-2" style="margin-top:5%;">
							<div class="card-header" style="color:black;"><b>게시글 수정</b></div>
						    <div class="card-body">
						    	<form id="updateBoard" action="<c:url value='/board/update'/>" method="post" enctype="multipart/form-data">
									
									<div class="form-group">
										<div class="row">
											<div class="col-2">
												<label>카테고리</label>
											</div>
											<div class="col-10">
												<c:if test="${board.boardCategoryId eq '1'}" var="boardCategoryId" scope="session">
													<span>자료실</span>
												</c:if>
												<c:if test="${board.boardCategoryId eq '2'}" var="boardCategoryId" scope="session">
													<span>문의 게시글</span>
												</c:if>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-2">
											<label>제목</label>
										</div>
										<div class="col-10">
											<input type="text" value="${board.boardTitle}" name="boardTitle" id="boardTitle" class="form-control"/>
										</div>
									</div>

									<div class="row mt-3">
										<div class="col-2 ">
											<label>내용</label>
										</div>
										<div class="col-10">
											<textarea class="form-control" name="boardContent" id="boardContent" rows="5">${board.boardContent}</textarea>
										</div>
									</div>
									<div class="row mx-2 bottonbox d-flex justify-content-left mt-3">
										<div>
											<input type="hidden" name="boardFileId" value="${board.boardFileId}">
        									<input type="file" id="i_file" name="file">${board.boardFileName}<br/>
						    				<span id="droparea" class="help-block">파일 용량은 50MB 이하로만 업로드 가능합니다.</span>
										</div>
									</div>
									<input type="hidden" name="boardId" value="${board.boardId}">
									<input type="hidden" name="boardCategoryId" value="${board.boardCategoryId}">
								</form>
						    </div> 
						    <div class="card-footer">
						    	<div class="d-flex justify-content-center">
							    	<button type="submit" class="btn btn-primary" form="updateBoard">작성 완료</button>
						    	</div>
						    </div>
						   <%--  <form action="<c:url value='/board/delete'/>" method="POST">
							    <input type="hidden" name="boardId" value="${board.boardId}">
							    <input type="hidden" name="boardCategoryId" value="${board.boardCategoryId}">
							    
							    <button type="submit" class="btn btn-primary" >삭제</button>
						    	
						    </form> --%>
						</div>
					
					</div><!-- End of page Content -->
					
				</div><!-- End of Main Content -->
				
			</div><!-- End of Content Wrapper -->
			
		</div><!-- End of page wrapper -->
		
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fas fa-angle-up"></i>
		</a>
	
		<!-- Logout Modal-->
		<jsp:include page="/WEB-INF/views/include/logout.jsp"/>
	
		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		<!-- End of Footer -->
	</body>
</html>