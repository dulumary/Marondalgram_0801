package com.marondal.marondalgram.post.dto;

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

}
