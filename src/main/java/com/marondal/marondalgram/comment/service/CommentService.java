package com.marondal.marondalgram.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.marondalgram.comment.domain.Comment;
import com.marondal.marondalgram.comment.dto.CommentDetail;
import com.marondal.marondalgram.comment.repository.CommentRepository;
import com.marondal.marondalgram.user.domain.User;
import com.marondal.marondalgram.user.service.UserService;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private UserService userService;
	
	public int addComment(int postId, int userId, String content) {
		return commentRepository.insertComment(postId, userId, content);
	}
	
	public List<CommentDetail> getCommentByPostId(int postId) {
		
		List<Comment> commentList = commentRepository.selectCommentByPostId(postId);
		
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		for(Comment comment:commentList) {
			
			User user = userService.getUser(comment.getUserId());
			
			CommentDetail commentDetail = CommentDetail.builder()
											.id(comment.getId())
											.content(comment.getContent())
											.userId(comment.getUserId())
											.userName(user.getName())
											.build();
			
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
	}

}
