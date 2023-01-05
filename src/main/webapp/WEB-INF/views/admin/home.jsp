<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="mb-0 ml-2 text-gray-800"><strong>JAVA</strong></h1>
						<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-3"><span style="font-size:18px;">출석 체크하기<i class="fa-solid fa-check ml-2"></i></span></a> -->
					</div>
					<div class="d-sm-flex align-items-center justify-content-end mb-4 mr-3">
						<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-3"><span style="font-size:18px;">출석 체크하기<i class="fa-solid fa-check ml-2"></i></span></a>
					</div>
					<!-- 출퇴근 표시 -->
					<div class="row">
						<div class="container-fluid">
							<div class="row">
								<div class="col-6">
									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xl font-bold text-primary text-uppercase mb-1"><b>IN</b></div>
													<div class="mb-0 font-weight-bold text-gray-700">2023년 01월 02일(월)</div>
												</div>
												<div class="col-auto d-flex mt-3 align-content-center">
													<div class="h3 mb-0 font-weight-bold text-gray-800 mr-3">08:45:00</div>
													<div><i class="fa-regular fa-clock fa-2x"></i></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="card border-left-danger shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xl font-bold text-danger text-uppercase mb-1"><b>OUT</b></div>
													<div class="mb-0 font-weight-bold text-gray-700">2023년 01월 02일(월)</div>
												</div>
												<div class="col-auto d-flex mt-3">
													<div class="h3 mb-0 font-weight-bold text-gray-800 mr-3">08:45:00</div>
													<div><i class="fa-regular fa-clock fa-2x"></i></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 자료실 게시글 목록 및 달력 -->
					<div class="row" style="margin-top:100px">
						<div class="container-fluid">
							<div class="row">
								<div class="col-6">
									<span>강의 자료 목록</span>
									<table class="table" style="background-color: white;">
										<thead>
											<tr>
												<th>No.</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="seq" value="${(page-1)*10+1}" scope="page"/> 
	                                    	<c:forEach var="board" items="${boardList}">
	                                    		<tr>
	                                    			<td>${board.boardId}</td>
	                                    			<td>
	                                    				<c:if test="${board.boardCategoryId == 1}">자료실</c:if>
	                                    			</td>
	                                    			<td>${board.boardTitle}</td>
	                                    			<td>${board.userId}</td>
	                                    			<td><fmt:formatDate value="${board.boardDate}" pattern="YYYY-MM-dd"/></td>
	                                    		</tr>
	                                    	</c:forEach>    
										</tbody>
									</table>
								</div>
	
								<div class="col-6">
									<span>달력</span>
									<div class="card">
										 <div class="card-body">
											 <div class="content">
												<div id='calendar'></div>
											</div>
										 	<script src="<c:url value='/calendar/resources/js/'/>"></script>
												<script>
												
												  document.addEventListener('DOMContentLoaded', function() {
												    var calendarEl = document.getElementById('calendar');
												
												    var calendar = new FullCalendar.Calendar(calendarEl, {
												      headerToolbar: {
												        left: 'prev,next today',
												        center: 'title',
												        right: 'dayGridMonth,timeGridWeek,timeGridDay'
												      },
												      initialDate: '2023-01-03',
												      navLinks: true, // can click day/week names to navigate views
												      selectable: true,
												      selectMirror: true,
												      select: function(arg) {
												        var title = prompt('Event Title:');
												        if (title) {
												          calendar.addEvent({
												            title: title,
												            start: arg.start,
												            end: arg.end,
												            allDay: arg.allDay
												          })
												        }
												        calendar.unselect()
												      },
												      eventClick: function(arg) {
												        if (confirm('Are you sure you want to delete this event?')) {
												          arg.event.remove()
												        }
												      },
												      editable: true,
												      dayMaxEvents: true, // allow "more" link when too many events
												      events: []
												    });
												
												    calendar.render();
												  });
												
												</script>
										</div>
									</div>
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

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<br>
					로그아웃을 원하시면 로그아웃 버튼을 눌러주세요.	
					<br>
					<br>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="<c:url value='/member/logout'/>">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- End of Footer -->
</body>

</html>
