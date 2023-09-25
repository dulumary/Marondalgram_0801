package com.marondal.marondalgram.like.service;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class LikeServiceTest {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LikeService likeService;

	@Test
	void likeCountTest() {
		
		int count = likeService.getCountByPostId(15);
		logger.info("좋아요 개수 테스트 : " + count);
		
	}
	
	

}
