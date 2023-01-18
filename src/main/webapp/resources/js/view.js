function updateComment(commentId){
	var content=$("#commentContent"+commentId+" h6").text();
	
	$("#commentContent"+commentId).empty();
	$("#commentContent"+commentId).append(
			"<form id=\"commentUpdateForm"+commentId+"\" name=\"commentForm\" >" +
			"	<input type=\"hidden\" name=\"commentId\" value=\""+commentId+"\">" +
			"	<input type='text' id='content' name='commentContent' value='"+content+"'>" +
			"</form>"
	);
	$("#commentUpdateBtn"+commentId).removeAttr();
	$("#commentUpdateBtn"+commentId).attr("onclick","updateConfilm("+commentId+")");
	$("#commentUpdateBtn"+commentId).text("수정완료");
	
}
function updateConfilm(commentId){
	var updateData=$("#commentUpdateForm"+commentId).serialize();
	$.ajax({
		url:"/myapp/board/comment/update",
		type:'POST',
		data:updateData,
		success:function(result){
			$("#comment"+commentId).empty();
			$("#comment"+commentId).append(result);
			
		}
	});
}