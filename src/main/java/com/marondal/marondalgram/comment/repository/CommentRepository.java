package com.marondal.marondalgram.comment.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.marondalgram.comment.domain.Comment;

@Repository
public interface CommentRepository {
	
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("content") String content);
	
	public List<Comment> selectCommentByPostId(@Param("postId") int postId);

}
