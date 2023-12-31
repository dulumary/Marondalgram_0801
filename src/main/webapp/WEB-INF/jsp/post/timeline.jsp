<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marondalgram</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="contents d-flex justify-content-center">
			<!-- 타임라인 -->
			<div class="timeline">
				<!-- 입력 박스 -->
				<div class="input-box border rounded">
					<textarea rows="4" class="form-control border-0" id="contentInput"></textarea>
					<div class="d-flex justify-content-between p-2">
						<i class="bi bi-image image-icon-size" id="imageIcon"></i>
						<input type="file" id="fileInput" class="d-none">
						<button type="button" class="btn btn-info btn-sm" id="uploadBtn">업로드</button>
					</div>
				</div>
				<!-- /입력박스 -->
				
				<!-- 카드 리스트  -->
				<div class="card-list mt-3">
					<c:forEach var="post" items="${postList }">
					<!-- 카드 -->
					<div class="card my-3">
						<div class="d-flex justify-content-between p-2">
							<div>${post.userName }</div>
							<c:if test="${post.userId == userId }">
							<i data-post-id="${post.id }" class="bi bi-three-dots-vertical more-btn" data-toggle="modal" data-target="#moreModal"></i>
							</c:if>
						</div>
						<div>
							<img class="w-100" src="${post.imagePath }">
						</div>
						<div class="p-2">
							
							<c:choose>
								<c:when test="${post.like }">
									<%-- 채워진 하트 아이콘 --%>
									<i data-post-id="${post.id }" class="bi bi-heart-fill text-danger unlike-btn"></i>
								</c:when>
								<c:otherwise>
									<%-- 비워진 하트 아이콘 --%>
									<i data-post-id="${post.id }" class="bi bi-heart like-btn"></i>
								</c:otherwise>
							
							</c:choose>
							 좋아요 ${post.likeCount }개
						</div>
						<div class="p-2">
							<b>${post.userName }</b> ${post.content }
						</div>
						
						<!-- 댓글 박스 -->
						<div class="comment-box small">
							<div class="px-2">댓글</div>
							
							<div class="px-2">
								<c:forEach var="comment" items="${post.commentList }">
								<div>
									<b>${comment.userName }</b> ${comment.content }
								</div>
								</c:forEach>
								
							</div>
						
							<div class="d-flex mt-2">
								<input type="text" class="form-control" id="commentInput${post.id }">
								<button type="button" class="btn btn-info comment-btn" data-post-id="${post.id }">게시</button>
							</div>
						</div>
						<!-- /댓글 박스 -->
					</div>
					<!-- /카드 -->
					</c:forEach>
					
				</div>
				<!-- /카드 리스트 -->
				
				<button type="button" class="btn btn-info btn-block" id="addCardBtn">카드 추가</button>
				
			</div>
			<!-- /타임라인 -->
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      
	      <div class="modal-body text-center">
	        <a href="#" id="deleteBtn">삭제하기</a>
	      </div>
	      
	    </div>
	  </div>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			
			$("#addCardBtn").on("click", function() {
				
				$.ajax({
					type:"get"
					, url:"/post/card"
					, data:{"id":3}
					, success:function(data) {
						
						$(".card-list").append(data);
					}
					
				});
				
			});
			
			$("#deleteBtn").on("click", function() {
				
				let postId = $(this).data("post-id");
				
				
				$.ajax({
					type:"delete"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						
						alert("삭제 에러");
					}
				});

				
			});
			
			$(".more-btn").on("click", function() {
				let postId = $(this).data("post-id");
				
				$("#deleteBtn").data("post-id", postId);
				
			});
			
			$(".unlike-btn").on("click", function() {
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"delete"
					, url:"/post/unlike"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
						
					}
					, error:function() {
						alert("좋아요 취소 에러");
					}
				});
			});
			
			$(".comment-btn").on("click", function() {
				// 댓글을 작성한 게시글 id
				// 댓글 내용 
				let postId = $(this).data("post-id");
				//let comment = $("#commentInput" + postId).val();
				let comment = $(this).prev().val();
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "content":comment}
					, success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}
						
					}
					, error:function() {
						alert("댓글 작성 에러");
					}
					
				});
				
				
			});
			
			
			$(".like-btn").on("click", function() {
				
				// 좋아요한 대상 게시글 id
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"post"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
						
					}
					, error:function() {
						alert("좋아요 에러");
					}
					
				});
				
			});
			
			
			$("#uploadBtn").on("click", function() {
					
				let content = $("#contentInput").val();
				let file = $("#fileInput")[0];
				
				if(content == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				// 파일이 선택되지 않은 경우 유효성 검사 
				if(file.files.length == 0) {
					alert("파일을 선택하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", file.files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("글쓰기 실패");
						}
						
					}
					, error:function() {
						alert("글쓰기 에러");
					}
					
				});
				
			});
			
			
			$("#imageIcon").on("click", function() {
				// file input을 클릭한것과 똑같은 기능 수행
				$("#fileInput").click();
				
			});
			
		});
	</script>
	
</body>
</html>