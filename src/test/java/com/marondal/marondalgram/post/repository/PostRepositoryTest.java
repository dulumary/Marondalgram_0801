package com.marondal.marondalgram.post.repository;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.marondal.marondalgram.post.domain.Post;

@SpringBootTest
class PostRepositoryTest {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostRepository postRespository;

	@Test
	void selectListTest() {
		
		List<Integer> idList = new ArrayList<>();
		idList.add(3);
		idList.add(7);
		idList.add(8);
		
		List<Post> postList = postRespository.selectPostByIdList(idList);
		logger.info(postList.toString());
		
	}

}
