<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="boardPaging" tagdir="/WEB-INF/tags" %>
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
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-header" style="color:black;"><b>게시글 목록</b></div>
							<div class="card-body">
								<div class="table-responsive">
                                	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                		<div class="row">
                                			<div class="col-sm-12 col-md-6">
                                				<div class="d-flex justify-content-start">
	                                				<div id="dataTable_filter" class="dataTables_filter">
	                                					<label>Search:
	                                						<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
	                                					</label>
	                                				</div>
                                				</div>
                                			</div>
                                			<div class="col-sm-12 col-md-6">
                                				<div class="d-flex justify-content-end">
	                                				<div id="dataTable_filter" class="dataTables_filter mt-3">
	                                					<button class="btn btn-primary" onClick="location.href='<c:url value='/board/write/${boardCategoryId}'/>'">글작성</button>
	                                				</div>
                                				</div>
                                			</div>
                                		</div>
                                		<div class="row">
                                			<div class="col-sm-12">
                                				<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
				                                    <thead>
				                                        <tr role="row">
				                                        	<th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="No: activate to sort column descending" style="width: 10px;">No.</th>
				                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Category: activate to sort column ascending" style="width: 30px;">카테고리</th>
				                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Title: activate to sort column ascending" style="width: 200px;">제목</th>
				                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Writer: activate to sort column ascending" style="width: 10px;">작성자</th>
				                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="boardDate: activate to sort column ascending" style="width: 20px;">작성 날짜</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody> 
				                                    	<c:set var="seq" value="${(page-1)*10+1}" scope="page"/> 
				                                    	<c:forEach var="board" items="${boardList}">
				                                    		<tr onclick="location.href='<c:url value='/board/view/${board.boardId}'/>'" style="cursor:pointer;">
				                                    			<td>${board.boardId}</td>
				                                    			<td>
				                                    				<c:if test="${board.boardCategoryId == 1}">자료실</c:if>
				                                    				<c:if test="${board.boardCategoryId == 2}">문의게시글</c:if>
				                                    			</td>
				                                    			<td>${board.boardTitle}</td>
				                                    			<td>${board.userId}</td>
				                                    			<td><fmt:formatDate value="${board.boardDate}" pattern="YYYY-MM-dd"/></td>
				                                    		</tr>
				                                    	</c:forEach>                                   	
					                            	</tbody>
                               					</table>
                               				</div>
                               			</div>
                               			<div class="row">
                               				<div class="col-sm-12 col-md-5">
                               					<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite"></div>
                               				</div>
                               				<div class="col-sm-12 col-md-1">
                               					<div class="d-flex justify-content-center">
	                               					<table class="table">
														<tr>
															<td align="left">
																<boardPaging:paging boardCategoryId="${boardCategoryId}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
															</td>
														</tr>
													</table>
                               					</div>
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
