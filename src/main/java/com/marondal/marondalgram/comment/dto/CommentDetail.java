package com.marondal.marondalgram.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class CommentDetail {
	
	private int id;
	String content;
	private int userId;
	private String userName;

}
