package com.marondal.marondalgram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.marondalgram.post.dto.PostDetail;
import com.marondal.marondalgram.post.service.PostService;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@GetMapping("/timeline-view")
	public String timeline(
			@RequestParam(value="userId", required=false) Integer targetUserId
			, HttpSession session
			, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postService.getPostList(userId, targetUserId);
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
	
	@GetMapping("/post/card")
	public String cardView(@RequestParam("id") int id, Model model) {
		
		PostDetail post = postService.getPost(id);
		
		model.addAttribute("post", post);
		return "post/card";
	}

}
