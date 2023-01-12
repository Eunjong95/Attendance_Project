<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="reasonPaging" tagdir="/WEB-INF/tags" %>

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
								<h6 class="m-0 font-weight-bold texy-primary">사유신청서 조회</h6>
							</div>
						</div>
						<div class="card-body">
							<div class="row pl-4">
								<div class="col-2">
									<h6>신청 번호</h6>
								</div>
								<div class="col-10">
									<h6>${reason.reasonId}</h6>
								</div>
							</div>
							<hr />

							<div class="row pl-4">
								<div class="col-2">
									<h6>신청 유형</h6>
								</div>
								<div class="col-10">
									<h6>${reason.reasonCategoryName}</h6>
								</div>
							</div>
							<hr />
							
							<div class="row pl-4">
								<div class="col-2">
									<h6><b>승인 상태</b></h6>
								</div>
								<div class="col-10">
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
									<c:if test="${reason.reasonStatus==4}">
										<h6 class="font-weight-bold" style="color: #009933;">취소완료</h6>
									</c:if>
								</div>
							</div>
							<hr />
							
							<div class="row pl-4">
								<div class="col-2">
									<h6>신청인</h6>
								</div>
								<div class="col-10">
									<h6>${reason.userName}</h6>
								</div>
							</div>
							<hr />
							
							<div class="row pl-4">
								<div class="col-2">
									<h6>사유서 작성일</h6>
								</div>
								<div class="col-10">
									<h6>${reason.reasonWriteDate}</h6>
								</div>
							</div>
							<hr />
							
							<div class="row pl-4">
								<div class="col-2">
									<h6><b>신청 휴가일</b></h6>
								</div>
								<div class="col-10">
									<h6><b>${reason.reasonDate}</b></h6>
								</div>
							</div>
							<hr />
							<div class="row pl-4">
								<div class="col-2">
									<h6>신청 내용</h6>
								</div>
								<div class="col-10">
									<h6>${reason.reasonContent}</h6>
								</div>
							</div>
							<hr />

							<div class="row pl-4 pb-2">
								<div class="col-2">
									<h6>첨부파일</h6>
								</div>
								<div class="col-10">
									<c:if test="${!empty reason.reasonFileName}">
										<div>
											<c:set var="len" value="${fn:length(reason.reasonFileName)}" />
											<c:set var="filetype"
												value="${fn:toUpperCase(fn:substring(reason.reasonFileName, len-4, len))}" />
											<c:if
												test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
												<img src='<c:url value="/rfile/${reason.reasonId}"/>'
													class="img-thumbnail">
												<br>
											</c:if>
											<a href='<c:url value="/rfile/${reason.reasonId}"/>'>${reason.reasonFileName}(${reason.reasonFileSize}byte)</a>
										</div>
									</c:if>
								</div>
							</div>
							
							<form>
								<input type="hidden" name="reasonId" value="${reason.reasonId}">
								<input type="hidden" name="reasonDate" value="${reason.reasonDate}">
								<input type="hidden" name="userId" value="${reason.userId}">
								<div class="d-flex justify-content-center">
									<c:if test="${reason.reasonStatus==0}">
										<button type="submit" class="btn btn-success btn-sm mr-1 text-center" formmethod="post"
											formaction="<c:url value="/admin/reason/approve"/>" name="reasonStatus" value="1">승인</button>
									</c:if>
									<c:if test="${reason.reasonStatus==3}">
										<input type="hidden" name="reasonId" value="${reason.reasonId}">
										<button type="submit" class="btn btn-success btn-sm mr-1 text-center" formmethod="post"
											formaction="<c:url value="/admin/reason/cancel"/>" name="reasonStatus" value="4">승인</button>
									</c:if>
									<c:if test="${reason.reasonStatus==0}">
										<button type="submit" class="btn btn-danger btn-sm mr-1 text-center" formmethod="post"
											formaction="<c:url value="/admin/reason/reject"/>" name="reasonStatus" value="2">반려</button>
									</c:if>
								</div>
							</form>
							<div class="d-flex justify-content-end">
								<button type="button" class="btn btn-primary btn-sm text-center d-flex justify-content-end"
									onclick="location.href='<c:url value="/admin/reason/list/${reasonListStatus}/${lectureId}/${page}"/>'">목록으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->
	</div>
	<!-- End of Content Wrapper -->

	<!-- End of Page Wrapper -->

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