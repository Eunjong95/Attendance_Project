<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>OTI 근태</title>

<!-- Custom fonts for this template-->
<link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

</head>
<body id="page-top">

	<!-- page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- 작성 폼  -->
					<div class="row" style="margin-top: 100px">
						<div class="container-fluid">
							<div class="row">
								<div class="col-12">
									<div class="card border-left-primary shadow py-2">
										<div class="card-header">휴가 신청</div>
										<div class="card-body">
											<form action="<c:url value='/reason/write'/>" method="post"
												enctype="multipart/form-data">
												<div class="container-fluid">
													<div class="row my-2">
														<label for="reasonCategoryId" class="mr-3">신청 유형</label> 
														<select onchange="selectReasonCategory()" id="reasonCategoryId"
															name="reasonCategoryId">
															<option value="1">외출</option>
															<option value="2">병가</option>
															<option value="3">휴가</option>
															<option value="4">지하철 연착</option>
															<option value="5">예비군</option>
															<option value="6">경조사</option>
														</select>
													</div>
													<div id="reasonDateText" class="row my-3">날짜</div>
													<div id="selectReasonDate" class="row my-3">
														<div class="col-6">
															<label for="reasonDate">신청일</label> 
															<input type="date" id="reasonDate" name="reasonDate" class="form-control">
														</div>
													</div>
													<div class="row my-3">
														<h5>사유</h5>
														<div class="col-12">
															<textarea class="form-control" id="reasonContent" name="reasonContent" placeholder="사유를 입력해주세요. (최대  150자)" style="width: 100%"></textarea>
														</div>
													</div>
													<div class="row my-3">
														<label class=" col-1" for="files">파일 첨부</label>
														<div class="col-2">
															<input type="file" class="form-control" id="s" name="files">
														</div>
													</div>
														<input type="hidden" name="userId" value="${userId}">
													<div class="card-footer">
														<div class="d-flex justify-content-center">
															<button type="submit" class="btn btn-primary">신청</button>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- End of page Content -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of page wrapper -->

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