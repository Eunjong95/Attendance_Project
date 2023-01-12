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
<script >
	function showMemberList(lectureId){
		if($("#member"+lectureId+" tbody tr").length==0){
			$.ajax({
				url:"/myapp/admin/lecture/list/members/"+lectureId,
				type:"GET",
				success:function(result){
					console.log(result.length);
					if(result.length!=0){
						result.forEach((value)=>{
							$("#member"+lectureId+" tbody").append(
									"<tr>"+
									"	<td>"+value.userId+"</td>"+
									"	<td>"+value.userName+"</td>"+
									"	<td>"+value.phone+"</td>"+
									"	<td>"+value.email+"</td>"+
									"</tr>"
							);
						});
						$("#more"+lectureId).attr("onclick","showMemberListMore("+lectureId+",2)")
						$("#more"+lectureId).text("더보기");
					}else{
						$("#more"+lectureId).removeAttr("onclick");
						$("#more"+lectureId).text("");
						$("#member"+lectureId+" tbody").html("<tr><td></td><td colspan='2'>수강중인 학생이 없습니다.</td><td></td></tr>")
					}
				}
			});
		}
	}
function showMemberListMore(lectureId,page){
		
		$.ajax({
			url:"/myapp/admin/lecture/list/members/"+lectureId+"/"+page,
			type:"GET",
			success:function(result){
				console.log(result.length);
				if(result.length!=0){
					result.forEach((value)=>{
						$("#member"+lectureId+" tbody").append(
								"<tr>"+
								"	<td>"+value.userId+"</td>"+
								"	<td>"+value.userName+"</td>"+
								"	<td>"+value.phone+"</td>"+
								"	<td>"+value.email+"</td>"+
								"</tr>"
						);
					});
					$("#more"+lectureId).removeAttr("onclick")
					page+=1;
					$("#more"+lectureId).attr("onclick","showMemberListMore("+lectureId+","+page+")");
				}else{
					$("#more"+lectureId).removeAttr("onclick");
					$("#more"+lectureId).text("");
				}
			}
		});
	}
</script>
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
							<div class="card-header" style="color:black;font-size:36px"><b>강의 목록</b></div>
							<div class="card-body">
								<div class="table-responsive" style="overflow:hidden">
                                	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                		
                                		<div class="row">
                                			<div class="col-sm-12" >
                                				<table class="table table-hover dataTable" id="dataTable"   role="grid" aria-describedby="dataTable_info" style="width: 100%;">
				                                    <thead>
				                                        <tr role="row" >
				                                        	<th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="No: activate to sort column descending" style="width: 10px; font-size:20px">No.</th>
				                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Category: activate to sort column ascending" style="width: 30px;font-size:20px">강의번호</th>
				                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Title: activate to sort column ascending" style="width: 20px;font-size:20px">강의명</th>
				                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Writer: activate to sort column ascending" style="width: 10px;font-size:20px">학생수</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody> 
				                                    	<c:set var="seq" value="${(page-1)*5+1}" scope="page"/> 
				                                    	<c:forEach var="lecture" items="${lectureList}">
				                                    		<tr data-toggle="collapse" data-target="#member${lecture.lectureId}" onclick="showMemberList(${lecture.lectureId})">
				                                    			<td></td>
				                                    			<td>${lecture.lectureId}</td>
				                                    			
				                                    			<td ><a class="btn" data-toggle="collapse" data-target="#member${lecture.lectureName}" style="text-decoration: none;">${lecture.lectureName}</a></td>
				                                    			<td>${lecture.memberNum}</td>
				                                    		</tr>
				                                    		<tr id="member${lecture.lectureId}" class="collapse" style="border-style:inset hidden inset hidden;">
				                                    			<td colspan="4">
				                                    				<div >
				                                    					<h4>${lecture.lectureName}의 학생리스트</h4>
				                                    					<table class="table table-border">
				                                    						<thead>
				                                    							<tr>
				                                    								<th>아이디</th>
				                                    								<th>이름</th>
				                                    								<th>전화번호</th>
				                                    								<th>이메일</th>
				                                    							</tr>
				                                    						</thead>
				                                    						<tbody>
					                                    						
				                                    						</tbody>
				                                    						<tfoot>
				                                    							<tr>
				                                    								<td id="more${lecture.lectureId}"  colspan="4">더보기</td>
				                                    							</tr>
				                                    						</tfoot>
				                                    					</table>
				                                    				</div>
				                                    			</td>
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
																<boardPaging:lecturePaging  totalPageCount="${totalPageCount}" nowPage="${page}"/>
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
