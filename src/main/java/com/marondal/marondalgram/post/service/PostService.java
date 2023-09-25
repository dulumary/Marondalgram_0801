package com.marondal.marondalgram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.marondalgram.comment.dto.CommentDetail;
import com.marondal.marondalgram.comment.service.CommentService;
import com.marondal.marondalgram.common.FileManager;
import com.marondal.marondalgram.like.service.LikeService;
import com.marondal.marondalgram.post.domain.Post;
import com.marondal.marondalgram.post.dto.PostDetail;
import com.marondal.marondalgram.post.repository.PostRepository;
import com.marondal.marondalgram.user.domain.User;
import com.marondal.marondalgram.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CommentService commentService;
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, content, imagePath);
		
	}
	
	public List<PostDetail> getPostList(int userId, Integer targetUserId) {

		List<Post> postList = postRepository.selectPostList(targetUserId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		for(Post post:postList) {
			
			User user = userService.getUser(post.getUserId());
			
			int likeCount = likeService.getCountByPostId(post.getId());
			List<CommentDetail> commentList = commentService.getCommentByPostId(post.getId());
			boolean isLike = likeService.isLike(post.getId(), userId);
			
			PostDetail postDetail = PostDetail.builder()
									.id(post.getId())
									.content(post.getContent())
									.imagePath(post.getImagePath())
									.userId(post.getUserId())
									.userName(user.getName())
									.likeCount(likeCount)
									.commentList(commentList)
									.isLike(isLike)
									.build();
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
	}
	
	public PostDetail getPost(int id) {
		
		Post post = postRepository.selectPost(id);
		User user = userService.getUser(post.getUserId());
		
		int likeCount = likeService.getCountByPostId(post.getId());
		List<CommentDetail> commentList = commentService.getCommentByPostId(post.getId());
		
		PostDetail postDetail = PostDetail.builder()
								.id(post.getId())
								.content(post.getContent())
								.imagePath(post.getImagePath())
								.userId(post.getUserId())
								.userName(user.getName())
								.likeCount(likeCount)
								.commentList(commentList)
								.build();
		
		return postDetail;
		
		
		
	}
	
	public int deletePost(int postId, int userId) {
		
		Post post = postRepository.selectPost(postId);
		if(userId == post.getUserId()) {
			likeService.deleteLikeByPostId(postId);
			commentService.deleteCommentByPostId(postId);
			
			FileManager.removeFile(post.getImagePath());
			
			return postRepository.deletePost(postId);
		} else {
			
			return 0;
		}
		
		
	}

}
