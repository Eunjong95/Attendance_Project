<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="col-1">
		<h6>${comment.userId}</h6>
	</div>
	<div id="commentContent${comment.commentId}" class="col-8">
		<h6>${comment.commentContent}</h6>
	</div>
	<div class="col-1 pl-2">
		<h6 id="commentDate${comment.commentId}">${comment.commentDate}</h6>
	</div>
	<c:if test="${comment.userId eq userId}">
		<div id="commentForm" class="d-flex col-2 justify-content-end">
			<button id="commentUpdateBtn${comment.commentId}" onclick="updateComment(${comment.commentId})" class="btn btn-primary btn-sm text-center mr-1" >수정</button>
			
			<form id="commentdeleteForm" name="commentForm" method="post" action="<c:url value='/board/comment/delete'/>">
				<input type="hidden" name="commentId" value="${comment.commentId}">
				<button type="submit" class="btn btn-primary btn-sm text-center">삭제</button>
			</form> 
		</div>
	</c:if>
