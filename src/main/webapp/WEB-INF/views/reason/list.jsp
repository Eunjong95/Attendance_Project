<%@ page contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="reasonPaging" tagdir="/WEB-INF/tags"%>
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

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">휴가 신청 내역</h1>
						<button class="btn btn-primary"
							onClick="location.href='<c:url value="/reason/write"/>'">휴가 신청</button>
					</div>

					<!-- 사유서 신청 내역 -->
					<div class="container-fluid">
						<c:forEach var="reason" items="${reasonList}">
							<div class="card border-left-primary shadow"
								style="margin: 15px;">
								<div class="card-body">
									<input type="hidden" name="userId" value="${userId}">

									<div class="row">
										<div class="row col-md-1 ml-1 pt-1">
											<c:if test="${reason.reasonStatus==0}">
												<h6 class="font-weight-bold" style="color: #000000;">미승인</h6>
											</c:if>
											<c:if test="${reason.reasonStatus==1}">
												<h6 class="font-weight-bold" style="color: #009933;">승인</h6>
											</c:if>
											<c:if test="${reason.reasonStatus==2}">
												<h6 class="font-weight-bold" style="color: #e60000;">반려</h6>
											</c:if>
											<c:if test="${reason.reasonStatus==3}">
												<h6 class="font-weight-bold" style="color: #ff6600;">취소요청</h6>
											</c:if>
										</div>

										<div class="row col-md-10">
											<div class="row col-md-12">
												<div
													class="text-xㅣ font-weight-bold text-primary text-uppercase mb-2 pl-2">${reason.reasonWriteDate}</div>
											</div>
											<div class="row col-md-12">
												<div class="col-6">
													<div
														class="text-xㅣ font-bold text-muted text-uppercase mb-2">휴가명</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<c:if test="${reason.reasonCategoryId==1}">외출</c:if>
														<c:if test="${reason.reasonCategoryId==2}">병가</c:if>
														<c:if test="${reason.reasonCategoryId==3}">휴가</c:if>
														<c:if test="${reason.reasonCategoryId==4}">지하철 연착</c:if>
														<c:if test="${reason.reasonCategoryId==5}">예비군</c:if>
														<c:if test="${reason.reasonCategoryId==6}">경조사</c:if>
													</div>
												</div>
												<div class="col-6 pl-5">
													<div
														class="text-xㅣ font-bold text-muted text-uppercase mb-2 ">휴가
														날짜</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">${reason.reasonDate}</div>
												</div>
											</div>
										</div>

										<div class="row col-md-1">
											<input type="hidden" name="reasonId"
												value="${reason.reasonId}">
											<button class="btn btn-primary"
												onClick="location.href='<c:url value="/reason/view/${reasonId}"/>'">자세히
												보기</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- 페이징 -->
				<div class="row">
					<div class="col-sm-12 col-md-5">
						<div class="dataTables_info" id="dataTable_info" role="status"
							aria-live="polite"></div>
					</div>
					<div class="col-sm-12 col-md-1">
						<div class="d-flex justify-content-center">
							<table border="0">
								<tr>
									<td align="center"><reasonPaging:reasonPaging
											nowPage="${page}" totalPageCount="${totalPageCount}" /></td>
								</tr>
							</table>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
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
