<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>사유서 상세보기</title>

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

	<!-- Page Wrapper -->
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

					<!-- Card -->
					<div class="card shadow mb-2">
						<div class="card-header py-3">
							<div>
								<h6 class="m-0 font-weight-bold texy-primary">사유신청서 조회</h6>
							</div>
						</div>
						<div class="card-body">
							<div class="row pl-4">
								<div class="col-1">
									<h6>신청 번호</h6>
								</div>
								<div class="col-11">
									<h6>1204</h6>
								</div>
							</div>
							<hr />

							<div class="row pl-4">
								<div class="col-1">
									<h6>신청 유형</h6>
								</div>
								<div class="col-11">
									<h6>조퇴</h6>
								</div>
							</div>
							<hr />
							<div class="row pl-4">
								<div class="col-1">
									<h6>신청인</h6>
								</div>
								<div class="col-11">
									<h6>홍길동</h6>
								</div>
							</div>
							<hr />
							<div class="row pl-4">
								<div class="col-1">
									<h6>신청일</h6>
								</div>
								<div class="col-11">
									<h6>2023.01.03</h6>
								</div>
							</div>
							<hr />
							<div class="row pl-4">
								<div class="col-1">
									<h6>신청 내용</h6>
								</div>
								<div class="col-11">
									<h6>집가고 싶어서 갑니다.</h6>
								</div>
							</div>
							<hr />

							<div class="row pl-4 pb-2">
								<div class="col-1">
									<h6>첨부파일</h6>
								</div>
								<div class="col-11">
									<div>
										<a href="#">230103.png</a>
									</div>
									<div>
										<a href="#">230104.png</a>
									</div>
									<div>
										<a href="#">230105.png</a>
									</div>
								</div>
							</div>
							<hr />

							<!-- 관리자가 승인한 신청서면 수정 및 삭제 불가하게 바꾸기 -->
							<div class="d-flex justify-content-center">
								<button type="button"
									class="btn btn-primary btn-sm mr-1 text-center" onclick="">수정</button>
								<button type="button" class="btn btn-primary btn-sm text-center"
									onclick="">삭제</button>
							</div>
						</div>
					</div>
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
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="js/demo/chart-area-demo.js"></script>
		<script src="js/demo/chart-pie-demo.js"></script>
</body>

</html>