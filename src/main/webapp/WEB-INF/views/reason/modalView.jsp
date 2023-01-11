<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	function show(reasonId) {
		//result는 컨트롤러 리턴타입
		$.ajax({
					url : "/myapp/reason/view/" + reasonId,
					type : "GET",
					success : function(result) {
						console.log("성공");
						console.log(result);

						//reasonStatus 값 매칭
						var reasonStatus;

						if (result.reasonStatus == 0) {
							reasonStatus = "미승인";
						} else if (result.reasonStatus == 1) {
							reasonStatus = "승인";
						} else if (result.reasonStatus == 2) {
							reasonStatus = "반려";
						} else if (result.reasonStatus == 3) {
							reasonStatus = "취소요청";
						} else if (result.reasonStatus == 4) {
							reasonStatus = "취소완료";
						}

						//모달 띄우기
						$("#modalView").modal("show");

						//table에 json값 넣기
						$("#MreasonId").html(result.reasonId);
						$("#MreasonCategory").html(result.reasonCategoryName);
						$("#MreasonStatus").html(reasonStatus);
						$("#MreasonUser").html(result.userName);
						$("#MreasonWriteDate").html(result.reasonWriteDate);
						$("#MreasonDate").html(result.reasonDate);
						$("#MreasonContent").html(result.reasonContent);
						//파일 이미지 경로 받아와서 넣어주기
						if (result.reasonFileName != null) {
							$("#MreasonFile")
									.html(
											"<a href='/myapp/rfile/"+result.reasonId+"'><img src='/myapp/rfile/"+result.reasonId+"'></a>");
						} else {
							$("#MreasonFile").empty();
						}

						// reasonStatus 값에 따라 버튼 만듣어주기
						// 저장된 값 비우고 시작
						$("#updateBtn").empty();
						$("#deleteBtn").empty();

						if (result.reasonStatus == 1) {
							// reasonId와 reasonStatus hidden으로 전달
							let param1 = '<input type="hidden" name="reasonId" value="'+ result.reasonId +'">';
							param1 += '<input type="hidden" name="reasonStatus" value="3">';						
							$("#inputBtn").html(param1);
							let param2 = '<button type="submit" class="btn btn-primary" formaction="/myapp/reason/update">신청취소</button>';
							$("#updateBtn").html(param2);
						} else if (result.reasonStatus == 0) {
							// reasonId hidden으로 전달
							let param3 = '<input type="hidden" name="reasonId" value="'+ result.reasonId +'">';
							$("#inputBtn2").html(param3);
							let param4 = '<button type="submit" class="btn btn-primary" formaction="/myapp/reason/delete">신청취소</button>';
							$("#deleteBtn").html(param4);
						}
					},
					error : function() {
						console.log("실패");
					}
				});
	}
</script>

<style>
	.modal-header {
		background-color: #3c62d1;
		color: white;
	}
	
	img {
		width: 300px;
	}
</style>
<!------------- Modal --------------->
<!-- div id값으로 모달 호출 -->
<div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="reasonModalLabel">사유신청서 조회</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-hover" id="reasonDetail">
					<thead>
						<tr>
							<th></th>
							<th>항목</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>신청 번호</td>
							<td id="MreasonId"></td>
						</tr>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>신청 유형</td>
							<td id="MreasonCategory"></td>
						</tr>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>승인 상태</td>
							<td id="MreasonStatus"></td>
						</tr>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>신청인</td>
							<td id="MreasonUser"></td>
						</tr>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>사유서 작성일</td>
							<td id="MreasonWriteDate"></td>
						</tr>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>신청 휴가일</td>
							<td id="MreasonDate"></td>
						</tr>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>신청 내용</td>
							<td id="MreasonContent"></td>
						</tr>
						<tr>
							<th scope="row"><i class='fas fa-caret-right' style='font-size: 18px'></i></th>
							<td>첨부파일</td>
							<td id="MreasonFile"></td>
						</tr>
					</tbody>
				</table>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary" data-dismiss="modal">확인</button>
					<form method="post">
						<div id="inputBtn"></div>
						<div id="updateBtn"></div>
						<div id="inputBtn2"></div>
						<div id="deleteBtn"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
