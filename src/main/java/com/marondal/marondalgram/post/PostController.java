package com.marondal.marondalgram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {
	
	@GetMapping("/timeline-view")
	public String timeline() {
		return "post/timeline";
	}

}
