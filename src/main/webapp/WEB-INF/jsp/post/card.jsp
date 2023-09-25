<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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