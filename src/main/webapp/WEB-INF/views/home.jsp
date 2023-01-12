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
<!-- JS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<script>
	$(document).ready(function(){
		$('#workCheck').click(function(){ 
			$.ajax({
				url:'worktime',
				type:'get',
				success : function(data){ 
					var date = data.attendanceDate;
					var time = data.clockIn;
					$('#dateIn').text(date);
					$('#timeIn').text(time);
					$('#workCheck').removeClass('d-sm-inline-block');
					$('#workCheck2').addClass('d-sm-inline-block');
					$('#dateIn').attr('id','dateInInputEnd');
					$('#timeIn').attr('id','timeInInputEnd');
					
				}
			});
		});
		$('#workCheck2').click(function(){ 
			$.ajax({
				url:'worktime',
				type:'post',
				success : function(data){ 
					var date = data.attendanceDate;
					var time = data.clockOut;
					$('#dateOut').text(date);
					$('#timeOut').text(time);
					$('#workCheck2').removeClass('d-sm-inline-block');
					$('#workCheck').addClass('d-sm-inline-block');
					$('#dateOut').attr('id','dateOutInputEnd');
					$('#timeOut').attr('id','timeOutInputEnd');
				}
			});
		});
	});
	
</script>


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
						<c:if test="${clockIn == null}">						
							<a id="workCheck" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-3">
								<span style="font-size:18px;">출근 체크하기</span>
							</a>
						</c:if>
						<c:if test="${clockIn != null}">
							<button id="workCheck" type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-3" data-toggle="modal" data-target="#myModal">출근 체크하기</button>
							<div class="modal fade" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<span>이미 출석 체크를 하셨습니다.</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${clockOut == null}">						
							<a id="workCheck2" class="d-none btn btn-sm btn-primary shadow-sm p-3">
								<span style="font-size:18px;">퇴근 체크하기</span>
							</a>
						</c:if>
						<c:if test="${clockOut != null}">
							<button id="workCheck2" type="button" class="d-none btn btn-sm btn-primary shadow-sm p-3" data-toggle="modal" data-target="#myModal">퇴근 체크하기</button>
							<div class="modal fade" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<span>이미 출석 체크를 하셨습니다.</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm" data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						
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
													<div id="dateIn" class="mb-0 font-weight-bold text-gray-700">
														<c:set var="attendanceDate" value="${attendanceDate}"/>
                                            			<c:out value="${attendanceDate}"/>
													</div>
												</div>
												<div class="col-auto d-flex mt-3 align-content-center">
													<div id="timeIn" class="h3 mb-0 font-weight-bold text-gray-800 mr-3">
														<c:set var="clockIn" value="${clockIn}"/>
                                            			<c:out value="${clockIn}"/>
													</div>
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
													<div id="dateOut" class="mb-0 font-weight-bold text-gray-700">
														<c:set var="attendanceDate" value="${attendanceDate}"/>
                                            			<c:out value="${attendanceDate}"/>
													</div>
												</div>
												<div class="col-auto d-flex mt-3">
													<div id="timeOut" class="h3 mb-0 font-weight-bold text-gray-800 mr-3">
														<c:set var="clockOut" value="${clockOut}"/>
                                            			<c:out value="${clockOut}"/>
													</div>
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
	                                    		<tr onclick="location.href='<c:url value='/board/view/${board.boardId}'/>'" style="cursor:pointer;">
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
	<jsp:include page="/WEB-INF/views/include/logout.jsp"/>
	
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- End of Footer -->

</body>

</html>
