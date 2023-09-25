package com.marondal.marondalgram.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.marondalgram.post.domain.Post;

@Repository
public interface PostRepository {
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public Post selectPost(@Param("id") int id);
	public List<Post> selectPostList(@Param("userId") Integer userId);
	
	public List<Post> selectPostByIdList(@Param("idList") List<Integer> idList);
	
	public int deletePost(@Param("postId") int postId);
	

}
