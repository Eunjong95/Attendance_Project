<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
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
							<div class="card-header" style="color:black;"><b>게시글 작성</b></div>
						    <div class="card-body">
						    	<form action="<c:url value='/board/write'/>" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<div class="row">
											<div class="col-2">
												<label>카테고리</label>
											</div>
											<div class="col-10">
												<c:if test="${boardCategoryId eq '1'}" var="boardCategoryId" scope="session">
													<span>자료실</span>
												</c:if>
												<c:if test="${boardCategoryId eq '2'}" var="boardCategoryId" scope="session">
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
											<input type="text" name="boardTitle" id="boardTitle" class="form-control"/>
										</div>
									</div>

									<div class="row mt-3">
										<div class="col-2 ">
											<label>내용</label>
										</div>
										<div class="col-10">
											<textarea class="form-control" name="boardContent" id="boardContent" rows="5"></textarea>
										</div>
									</div>
                                    	<div class="row my-3 bottonbox d-flex">         
                                          <div>
	                                          <label for="file">파일 첨부</label>
	                                          <input type="file" class="form-control" id="file" name="file">
	                                          <span id="droparea" class="help-block">파일 용량은 50MB 이하로만 업로드 가능합니다.</span>      
                                          </div>
                                       	</div>
									<input type="hidden" name="boardCategoryId" value="${boardCategoryId}">
									<input type="hidden" name="userId" value="${sessionScope.userId}">
									
									<div class="card-footer">
								    	<div class="d-flex justify-content-center">
									    	<button type="submit" class="btn btn-primary">작성 완료</button>
								    	</div>
								    </div>
								</form>
						    </div> 
						    
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