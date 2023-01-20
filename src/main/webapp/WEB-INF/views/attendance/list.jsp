<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="attendancePaging" tagdir="/WEB-INF/tags" %>
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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">내 출결 현황</h1>
					</div>

					<!-- 출퇴근 표시 -->
					<div class="row" >
						<div class="container-fluid">
							<div class="row">
								<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xㅣ font-bold text-primary text-uppercase mb-1"> 출석</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<c:set var="attendanceCount" value="${attendanceCount}"/>
                                            	<c:out value="${attendanceCount} 회"/>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-bold text-info text-uppercase mb-1">출석률</div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                    	<c:set var="attendancePercent" value="${attendancePercent}"/>
                                            			<fmt:formatNumber value="${attendancePercent}" pattern=".00"/>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                    	<c:set var="attendancePercent" value="${attendancePercent}"/>
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: ${attendancePercent}%" aria-valuenow="${attendancePercent}" aria-valuemin="0"
                                                            aria-valuemax="30"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
						<!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-bold text-warning text-uppercase mb-1">지각</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<c:set var="lateCount" value="${lateCount}"/>
                                            	<c:out value="${lateCount} 회"/>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clock fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-bold text-danger text-uppercase mb-1">결근</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<c:set var="absenceCount" value="${absenceCount}"/>
                                            	<c:out value="${absenceCount} 회"/>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user-xmark fa-2x text-gray-300"></i>
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
									<span>출석 현황</span>
									<table class="table" style="background-color: white;">
										<thead>
											<tr>
												<th>날짜</th>
												<th>출근시간</th>
												<th>퇴근시간</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="seq" value="${(page-1)*5+1}" scope="page"/> 
	                                    	<c:forEach var="attendance" items="${attendanceList}">
	                                    		<tr>
	                                    			<td><fmt:formatDate value="${attendance.attendanceDate}" pattern="YYYY-MM-dd"/></td>
	                                    			<td><fmt:formatDate value="${attendance.clockIn}" pattern="HH:MM:ss"/></td>
	                                    			<td><fmt:formatDate value="${attendance.clockOut}" pattern="HH:MM:ss"/></td>
	                                    			<c:if test="${attendance.status==0}"><td>정상출근</td></c:if>
	            									<c:if test="${attendance.status==1}"><td>결근</td></c:if>
	            									<c:if test="${attendance.status==2}"><td>지각</td></c:if>
	            									<c:if test="${attendance.status==3}"><td>휴가</td></c:if>
	            									<c:if test="${attendance.status==4}"><td>조퇴</td></c:if>
	            									<c:if test="${attendance.status==5}"><td>출근중</td></c:if>
	                                    		</tr>
	                                    	</c:forEach> 
										</tbody>
										<tfoot class="d-flex justify-content-center">
											<tr>
												<td align="left">
													<attendancePaging:attendancePaging totalPageCount="${totalPageCount}" nowPage="${page}"/>
												</td>
											</tr>
										</tfoot>
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
										        			left: 'prev,next',
												        	center: 'title',
												        	right: 'dayGridMonth'
												      	},
												      	initialView: 'dayGridMonth',
												      	events: [
												      		
												      		<c:forEach var="attendance" items="${calendarList}">
												      		{
												      			title :'<c:if test="${attendance.status==0}">출근</c:if>
												      				<c:if test="${attendance.status==1}">결근</c:if>
												      				<c:if test="${attendance.status==2}">지각</c:if>
												      				<c:if test="${attendance.status==3}">휴가</c:if>
												      				<c:if test="${attendance.status==4}">조퇴</c:if>
												      				<c:if test="${attendance.status==5}">업무중</c:if>',
												      			start :'${attendance.attendanceDate}',
												      			<c:if test="${attendance.status==1}">backgroundColor:'#e74a3b'</c:if>
											      				<c:if test="${attendance.status==2}">backgroundColor:'#f6c23e'</c:if>
											      				<c:if test="${attendance.status==3}">backgroundColor:'#36b9cc'</c:if>
											      				<c:if test="${attendance.status==4}">backgroundColor:'#49a3f1'</c:if>
												      		},
												      		</c:forEach>
												      	]
												      	,eventClick:function(info){
												      		window.location.href(info.event.url);
												      	}
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
