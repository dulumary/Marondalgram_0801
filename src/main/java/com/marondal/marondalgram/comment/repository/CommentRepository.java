package com.marondal.marondalgram.comment.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository {
	
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("content") String content);
}
