package com.movebox.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.movebox.common.EncryptUtils;
import com.movebox.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	/**
	 * 아이디 중복확인 
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		
		// check
		boolean isDuplicatedId = userBO.existLoginId(loginId);
		result.put("result", isDuplicatedId);
		
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("birth") String birth,
			@RequestParam("email") String email,
			@RequestParam(value="file", required=false) MultipartFile profileImg) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.Hashing(password, loginId);
		
		// DB insert
		int row = userBO.insertUser(loginId, encryptPassword, name, birth, email, profileImg);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "회원가입이 되지 않았습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
}
