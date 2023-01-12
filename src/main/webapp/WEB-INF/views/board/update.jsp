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
			
			<!-- 사이드바 -->
			
				<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
					
					<!-- 사이드바 -Brand -->
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
						<span class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-laugh-wink"></i>
						</span>
						<span class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></span>
					</a>
					
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
					
					<!-- Nav Item - Dashboard -->
					
					<li class="nav-item">
						<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"><i class="fa-solid fa-list"></i><span>근태현황</span></a>
						<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar" >
							<div class="bg-white py-2 collapse-inner rounded">
								<a class="collapse-item" href="#">나의 근태(월별)</a>
								<a class="collapse-item" href="#">휴가신청</a>
							</div>
						</div>
					</li>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item">
						<a class="nav-link" href="#"><i class="fa-solid fa-question"></i><span>문의게시판</span></a>
					</li>
					
					<!-- Nav Item - Tables -->
					<li class="nav-item">
						<a class="nav-link" href="#"><i class="fas fa-fw fa-folder"></i><span>자료실</span></a>
					</li>
					
					<!-- Divider -->
					<hr class="sidebar-divider d-none d-md-block">
					
					<!-- Sidebar Toggler (Sidebar) -->
					<div class="text-center d-none d-md-inline">
						<button class="rounded-circle border-0" id="sidebarToggle"></button>
					</div>
					
				</ul><!-- End of Sidebar -->
			
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				
				<!-- Main Content -->
				<div id="content">
					
					<!-- Topbar -->
					<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
						
						<!-- 사이드바 Toggle(topbar) -->
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
						
						<!-- Topbar Navbar -->
						<ul class="navbar-nav ml-auto">
							<!-- Nav Item - Search Dropdown (Visible Only XS) -->
							<li class="nav-item dropdown no-arrow d-sm-none">
								<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				 					<i class="fas fa-search fa-fw"></i>
								</a> 
							</li>
							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
									<span class="mr-2 d-none d-lg-inline text-gray-600 small">DouglasMcGee</span>
									<img class="img-profile rounded-circle" src="img/undraw_profile.svg">
								</a> 
								<!-- Dropdown - User Information -->
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="<c:url value='/member/login'/>">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Login
									</a> 
									<a class="dropdown-item" href="#"> 
										<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings
									</a> 
									<a class="dropdown-item" href="#"> 
										<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>Activity Log
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout
									</a>
								</div>
							</li>
						</ul>
						
						
					</nav><!-- End of Topbar -->
					
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
											<input type="hidden" name="bFileId" value="${board.bFileId}">
        									<input type="file" id="i_file" name="file">${board.bFileName}<br/>
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