package com.marondal.marondalgram.post.dto;

import java.util.List;

import com.marondal.marondalgram.comment.dto.CommentDetail;

import lombok.Builder;
import lombok.Getter;


@Builder
@Getter
public class PostDetail {
	
	// id, content, imagePath, userId, userName
	private int id;
	private String content;
	private String imagePath;
	private int userId;
	private String userName;
	
	// 좋아요 개수 
	private int likeCount;
	// 좋아요 여부 
	private boolean isLike;
	
	// 댓글 목록
	private List<CommentDetail> commentList;
	
}
