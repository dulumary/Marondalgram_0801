package com.marondal.marondalgram.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.marondalgram.comment.repository.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;
	
	public int addComment(int postId, int userId, String content) {
		return commentRepository.insertComment(postId, userId, content);
	}

}
