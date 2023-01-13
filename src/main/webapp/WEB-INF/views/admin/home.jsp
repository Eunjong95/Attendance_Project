<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<script src="<c:url value='/js/member/adminMember.js'/>"></script>
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
						<h1 class="mb-0 ml-2 text-gray-800"><strong>어서오세요 ${userId}님</strong></h1>
						<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-3"><span style="font-size:18px;">출석 체크하기<i class="fa-solid fa-check ml-2"></i></span></a> -->
					</div>
					
					<!-- 출퇴근 표시 -->
					<div class="row">
						<div class="container-fluid">
							<div class="row">
								<div class="col-3">
									<div class="card border-left-warning shadow h-100 py-2" onclick="location.href='<c:url value='/admin/reason/list/0/1'/>'">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xl font-bold text-primary text-uppercase mb-1"><b>대기중인 요청</b></div>
													<div class="mb-0 font-weight-bold text-gray-700"> </div>
												</div>
												<div class="col-auto d-flex mt-3 align-content-center">
													<div class="h3 mb-0 font-weight-bold text-gray-800 mr-3">${newReasonCount}</div>
													<div><i class="fa-regular fa-bell fa-2x"></i></div>
												</div>
											</div>
										</div>
									</div>
									
								</div>
								<div class="col-3">
									<div class="card border-left-warning shadow h-100 py-2">
										<div class="card-body nav-link dropdown-toggle" href="#" id="attendanceDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xl font-bold text-primary text-uppercase mb-1"><b>출석인원</b></div>
													<div class="mb-0 font-weight-bold text-gray-700"> </div>
												</div>
												<div class="col-auto d-flex mt-3 align-content-center">
													<div class="h3 mb-0 font-weight-bold text-gray-800 mr-3">${fn:length(attendanceList)+fn:length(attendanceList2)}/${totalMemberCount }</div>
													<div><i class="fa-regular fa-clock fa-2x"></i></div>
												</div>
											</div>
										</div>
										<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
											aria-labelledby="attendanceDropdown" >
											<c:forEach var="attend" items="${attendanceList}" varStatus="attStatus">
												<div class="dropdown-item"> 
													<span>${attStatus.count} </span>
													<span>${attend.userName} </span>
													<span><fmt:formatDate value="${attend.clockIn }" pattern="hh : mm"/></span>
												</div> 
											</c:forEach>
											<c:forEach var="attend" items="${attendanceList2}" varStatus="attStatus">
												<div class="dropdown-item"> 
													<span>${attStatus.count} </span>
													<span>${attend.userName} </span>
													<span><fmt:formatDate value="${attend.clockIn }" pattern="hh : mm"/></span>
												</div> 
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="col-3">
									<div class="card border-left-warning shadow h-100 py-2">
										<div class="card-body nav-link dropdown-toggle" href="#" id="lateDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xl font-bold text-primary text-uppercase mb-1"><b>지각인원</b></div>
													<div class="mb-0 font-weight-bold text-gray-700"> </div>
												</div>
												<div class="col-auto d-flex mt-3 align-content-center">
													<div class="h3 mb-0 font-weight-bold text-gray-800 mr-3">${fn:length(lateList)}/${totalMemberCount }</div>
													<div><i class="fas fa-clock fa-2x"></i></div>
												</div>
											</div>
										</div>
										<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
											aria-labelledby="lateDropdown" >
											<c:forEach var="late" items="${lateList}" varStatus="lateStatus">
												<div class="dropdown-item"> 
													<span>${lateStatus.count} </span>
													<span>${late.userName} </span>
													<span><fmt:formatDate value="${late.clockIn }" pattern="hh : mm"/></span>
												</div> 
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="col-3">
									<div class="card border-left-warning shadow h-100 py-2">
										<div class="card-body nav-link dropdown-toggle" href="#" id="vacationDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xl font-bold text-primary text-uppercase mb-1"><b>휴가인원</b></div>
													<div class="mb-0 font-weight-bold text-gray-700"> </div>
												</div>
												<div class="col-auto d-flex mt-3 align-content-center">
													<div class="h3 mb-0 font-weight-bold text-gray-800 mr-3">${fn:length(vacationList)}/${totalMemberCount }</div>

													<div><i class="fa-regular fa-calendar-check fa-2x"></i></div>
												</div>
											</div>
										</div>
										<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
											aria-labelledby="vactionDropdown" >
											<c:forEach var="vaction" items="${vactionList}" varStatus="vactionStatus">
												<div class="dropdown-item"> 
													<span>${vactionStatus.count} </span>
													<span>${vaction.userName} </span>
												</div> 
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 자료실 게시글 목록 및 달력 -->
					
							<div class="row" style="margin-top:100px">
								<div class="container-fluid ">
									<div class="row">
										<div class="col-6 ">
											<div class="card border-left-warning shadow h-100 py-2">
												<div class="card-body ">
													<span>강의 목록</span>
													<div style="overflow-y:scroll;">
														<table class="table" style="background-color: white;">
															<thead>
																<tr>
																	<th>No.</th>
					
																	<th>강의 번호</th>
					
																	<th>강의명</th>
																	<th>인원</th>
																	<!-- <th>대기중인 요청</th> -->
																</tr>
															</thead>
															<tbody>
																<%-- <c:set var="seq" value="${(page-1)*10+1}" scope="page"/> --%> 
						                                    	<c:forEach var="lecture" items="${lectureList}" varStatus="status">
						                                    		<tr>
						                                    			<td>${status.count}</td>
					
						                                    			<td>${lecture.lectureId}</td>
						                                    			<td>
						                                    				${lecture.lectureName}
						                                    			</td>
						                                    			<td>${lecture.attendMemberNum}/${lecture.memberNum}</td>
						                                    			<%-- <td>${lecture.reasonCount}</td> --%>
						                                    		</tr>
						                                    	</c:forEach>    
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
		
										<div  class="col-6" >
											<div class="card border-left-warning shadow h-100 py-2">
												<div class="card-body">
													<span>학생 목록</span>
													<div id="memberWraper" onscroll="getMemberList()" style="overflow-y:scroll; height:300px">
														<table id="memberList" class="table" style="background-color: white;width:100%">
															<thead>
																<tr>
																	<th>No.</th>
																	<th>성명</th>
																	<th>강의</th>
																	<th>출석현황</th>
																</tr>
															</thead>
															<tbody>
																<%-- <c:set var="seq" value="${(page-1)*10+1}" scope="page"/> --%> 
						                                    	<c:forEach var="member" items="${memberList}" varStatus="mStatus">
						                                    		<tr>
						                                    			<td>${mStatus.count}</td>
						                                    			<td>${member.userName}</td>
						                                    			<td>${member.lectureName}</td>
						                                    			<td>
						                                    				<c:if test="${empty member.todayStatus}">
						                                    					미출석
						                                    				</c:if>
						                                    				<c:if test="${member.todayStatus==0}">정상출근</c:if>
								                                          	<c:if test="${member.todayStatus==1}">결근</c:if>
								                                          	<c:if test="${member.todayStatus==2}">지각</c:if>
								                                          	<c:if test="${member.todayStatus==3}">휴가</c:if>
								                                          	<c:if test="${member.todayStatus==4}">조퇴</c:if>
								                                          	<c:if test="${member.todayStatus==5}">출근중</c:if>
						                                    			</td>
						                                    		</tr>
						                                    	</c:forEach>    
															</tbody>
														</table>
													</div>
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