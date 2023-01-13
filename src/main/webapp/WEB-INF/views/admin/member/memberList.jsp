<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
	#memberCursor>tr:hover {
	   background-color: #e1e2e4;
	}
</style>	
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
						
						<!-- 게시글 목록 -->
						<div class="card border-left-primary shadow h-100 py-2" >
							<div class="card-header" style="color:black;"><b>학생 목록</b></div>
							<div class="card-body" style="height: 730px">
								<div class="table-responsive" style="overflow:hidden">
                                	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                		<div class="row">
                                			<div class="col-sm-12 col-md-6">
                                				<div class="d-flex justify-content-start">
	                                				<div id="dataTable_filter" class="dataTables_filter">
	                                					<label>강의명
	                                						<button class="btn btn-secondary" onclick="location.href='<c:url value="/admin/member/list/0/1"/>'">전체</button>
	                                						<button class="btn btn-secondary" onclick="location.href='<c:url value="/admin/member/list/1/1"/>'">JAVA</button>
	                                						<button class="btn btn-secondary" onclick="location.href='<c:url value="/admin/member/list/2/1"/>'">C언어</button>
	                                		 				<button class="btn btn-secondary" onclick="location.href='<c:url value="/admin/member/list/3/1"/>'">Python</button>
	                                					</label>
	                                					
	                                				</div>
                                				</div>
                                			</div>
                                			<div class="col-sm-12 col-md-6">
                                				<div class="d-flex justify-content-end">
	                                				<div id="dataTable_filter" class="dataTables_filter mt-3">
	                                					
	                                				</div>
                                				</div>
                                			</div>
                                		</div>
                                		<div class="row" style="height:580px">
                                			<div class="col-sm-12">
                                				<table class="table table-bordered dataTable" id="dataTable"  cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
				                                    <thead>
				                                        <tr role="row">
				                                        	<th style="width: 5%;">No.</th>
				                                        	<th style="width: 15%;">강의명</th>
				                                        	<th style="width: 10%;">이름</th>
				                                        	<th style="width: 20%;">날짜</th>
				                                        	<th style="width: 10%;">출근 상태</th>
				                                        	<th style="width: 20%;">출근 시간</th>
				                                        	<th style="width: 20%;">퇴근 시간</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody id="memberCursor"> 
				                                    	<c:forEach var="member" items="${memberList}"  varStatus="status">
				                                    		<tr style="cursor:pointer;">
				                                    			<td>${status.count}</td>
				                                    			<c:if test="${member.lectureId==1}">
								                                	<td class="font-weight-bold">JAVA</td>
								                                </c:if>
									                            <c:if test="${member.lectureId==2}">
									                            	<td class="font-weight-bold">C언어</td>
									                            </c:if>
									                            <c:if test="${member.lectureId==3}">
									                            	<td class="font-weight-bold">Python</td>
									                            </c:if>
				                                    			<td>${member.userName}</td>
				                                    			<td>${member.attendanceDate}</td>
				                                    			<c:if test="${member.todayStatus!=null}">
									                                <c:if test="${member.todayStatus==0}">
									                                	<td class="font-weight-bold" style="color: #009933;">정상 출근</td>
									                                </c:if>
										                            <c:if test="${member.todayStatus==1}">
										                            	<td class="font-weight-bold" style="color: #e60000;">결석</td>
										                            </c:if>
										                            <c:if test="${member.todayStatus==2}">
										                            	<td class="font-weight-bold" style="color: #e60000;">지각</td>
										                            </c:if>
										                            <c:if test="${member.todayStatus==3}">
										                            	<td class="font-weight-bold" style="color: #ff6600;">휴가</td>
										                            </c:if>
										                            <c:if test="${member.todayStatus==4}">
										                            	<td class="font-weight-bold" style="color: #ff6600;">조퇴</td>
										                            </c:if>
										                            <c:if test="${member.todayStatus==5}">
										                            	<td class="font-weight-bold" style="color: #009933;">출근중</td>
										                            </c:if>
										                            <td><fmt:formatDate value="${member.clockIn}" pattern="HH:mm:ss"/></td>
				                                    				<td><fmt:formatDate value="${member.clockOut}" pattern="HH:mm:ss"/></td>
										                        </c:if>
										                        <c:if test="${member.todayStatus==null}">
										                        	<td>미출근</td>
										                        	<td> </td>
										                        	<td> </td>
										                        </c:if>
				                                    			
				                                    		</tr>
				                                    	</c:forEach>                                   	
					                            	</tbody>
                               					</table>
                               				</div>
                               			</div>
                               			<div class="row">
                               				<div class="col-sm-12 d-flex justify-content-center mt-4">
                               					<ul class="pagination">
                               						<c:if test="${pager.groupNo > 1}">
														<li class="page-item"><a href="<c:url value='/admin/member/list/${lectureId}/${pager.startPageNo-1}'/>" class="page-link">Previous</a></li>
													</c:if>
													<c:if test="${pager.pageNo > 1}">
														<li class="page-item"><a href="<c:url value='/admin/member/list/${lectureId}/${page-1}'/>" class="page-link">◀</a></li>
													</c:if>
													   
													<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
														<c:if test="${pager.pageNo != i}">
															<li class="page-item"><a href="<c:url value='/admin/member/list/${lectureId}/${i}'/>" class="page-link">${i}</a></li>
														</c:if>
														<c:if test="${pager.pageNo == i}">
															<li class="page-item active"><a href="<c:url value='/admin/member/list/${lectureId}/${i}'/>" class="page-link">${i}</a></li>
														</c:if>
													</c:forEach>
													   
													<c:if test="${pager.pageNo < pager.totalPageNo}">
														<li class="page-item"><a href="<c:url value='/admin/member/list/${lectureId}/${page+1}'/>" class="page-link">▶</a></li>
													</c:if>
													
													<c:if test="${pager.groupNo < pager.totalGroupNo}">
														<li class="page-item"><a href="<c:url value='/admin/member/list/${lectureId}/${pager.endPageNo+1}'/>" class="page-link">Next</a></li>
                             						</c:if>
                             					</ul>
                             				</div>
                               			</div>
                               		</div>
                            	</div>
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
