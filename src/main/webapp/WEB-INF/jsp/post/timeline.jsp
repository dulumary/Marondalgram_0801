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
					<textarea rows="4" class="form-control border-0"></textarea>
					<div class="d-flex justify-content-between p-2">
						<i class="bi bi-image image-icon-size" id="imageIcon"></i>
						<input type="file" id="fileInput" class="d-none">
						<button type="button" class="btn btn-info btn-sm">업로드</button>
					</div>
				</div>
				<!-- /입력박스 -->
				
				<!-- 카드 리스트  -->
				<div class="card-list mt-3">
					<!-- 카드 -->
					<div class="card my-3">
						<div class="d-flex justify-content-between p-2">
							<div>hagulu</div>
							<i class="bi bi-three-dots-vertical"></i>
						</div>
						<div>
							<img class="w-100" src="https://cdn.pixabay.com/photo/2023/07/28/18/23/bird-8155768_1280.jpg">
						</div>
						<div class="p-2">
							<i class="bi bi-heart"></i> 좋아요 11개
						</div>
						<div class="p-2">
							<b>hagulu</b> 독수리가 멋있네요 으하하하핳
						</div>
						
						<!-- 댓글 박스 -->
						<div class="comment-box small">
							<div class="px-2">댓글</div>
							
							<div class="px-2">
								<div>
									<b>hagulu</b> 우와 진짜 멋있네?
								</div>
								<div>
									<b>bada</b> 무서워 ㅠㅠ
								</div>
							</div>
						
							<div class="d-flex mt-2">
								<input type="text" class="form-control">
								<button type="button" class="btn btn-info">게시</button>
							</div>
						</div>
						<!-- /댓글 박스 -->
					</div>
					<!-- /카드 -->
					<!-- 카드 -->
					<div class="card my-3">
						<div class="d-flex justify-content-between p-2">
							<div>hagulu</div>
							<i class="bi bi-three-dots-vertical"></i>
						</div>
						<div>
							<img class="w-100" src="https://cdn.pixabay.com/photo/2023/07/28/18/23/bird-8155768_1280.jpg">
						</div>
						<div class="p-2">
							<i class="bi bi-heart"></i> 좋아요 11개
						</div>
						<div class="p-2">
							<b>hagulu</b> 독수리가 멋있네요 으하하하핳
						</div>
						
						<!-- 댓글 박스 -->
						<div class="comment-box small">
							<div class="px-2">댓글</div>
							
							<div class="px-2">
								<div>
									<b>hagulu</b> 우와 진짜 멋있네?
								</div>
								<div>
									<b>bada</b> 무서워 ㅠㅠ
								</div>
							</div>
						
							<div class="d-flex mt-2">
								<input type="text" class="form-control">
								<button type="button" class="btn btn-info">게시</button>
							</div>
						</div>
						<!-- /댓글 박스 -->
					</div>
					<!-- /카드 -->
					
					<!-- 카드 -->
					<div class="card my-3">
						<div class="d-flex justify-content-between p-2">
							<div>hagulu</div>
							<i class="bi bi-three-dots-vertical"></i>
						</div>
						<div>
							<img class="w-100" src="https://cdn.pixabay.com/photo/2023/07/28/18/23/bird-8155768_1280.jpg">
						</div>
						<div class="p-2">
							<i class="bi bi-heart"></i> 좋아요 11개
						</div>
						<div class="p-2">
							<b>hagulu</b> 독수리가 멋있네요 으하하하핳
						</div>
						
						<!-- 댓글 박스 -->
						<div class="comment-box small">
							<div class="px-2">댓글</div>
							
							<div class="px-2">
								<div>
									<b>hagulu</b> 우와 진짜 멋있네?
								</div>
								<div>
									<b>bada</b> 무서워 ㅠㅠ
								</div>
							</div>
						
							<div class="d-flex mt-2">
								<input type="text" class="form-control">
								<button type="button" class="btn btn-info">게시</button>
							</div>
						</div>
						<!-- /댓글 박스 -->
					</div>
					<!-- /카드 -->
				</div>
				<!-- /카드 리스트 -->
				
			</div>
			<!-- /타임라인 -->
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			$("#imageIcon").on("click", function() {
				// file input을 클릭한것과 똑같은 기능 수행
				$("#fileInput").click();
				
			});
			
		});
	</script>
	
</body>
</html>