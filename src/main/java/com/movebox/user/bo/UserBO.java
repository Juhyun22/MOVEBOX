package com.movebox.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.movebox.common.FileManagerService;
import com.movebox.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FileManagerService fileManager;

	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public int insertUser(String loginId, String password, String name, String birth, String email, MultipartFile profileImg) {
		String imagePath = null;
		
		if (profileImg != null) {  // 파일에 값이 있다면, 
			// file manager service , input: MultipartFile, output: file path
			imagePath = fileManager.saveFile(loginId, profileImg);
		}
		
		// insert DAO
		return userDAO.insertUser(loginId, password, name, birth, email, imagePath);
	}
	
	
}
