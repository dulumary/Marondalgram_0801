package com.marondal.marondalgram.comment.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Comment {
	
	private int id;
	private int postId;
	private int userId;
	private String content;
	private Date createdAt;
	private Date updatedAt;

}
