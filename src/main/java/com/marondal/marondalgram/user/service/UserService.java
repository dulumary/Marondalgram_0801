package com.marondal.marondalgram.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.marondalgram.common.EncryptUtils;
import com.marondal.marondalgram.user.domain.User;
import com.marondal.marondalgram.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User addUser(String loginId, String password, String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = userRepository.save(User.builder()
				.loginId(loginId)
				.password(encryptPassword)
				.email(email)
				.name(name)
				.build());

		return user;
	}

}
