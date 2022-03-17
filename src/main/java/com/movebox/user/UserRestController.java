package com.movebox.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.movebox.common.EncryptUtils;
import com.movebox.user.bo.UserBO;
import com.movebox.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	/**
	 * 회원가입 시, 아이디 중복확인 
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
	
	/**
	 * 회원 가입 기능 - AJAX 호출 
	 * @param loginId
	 * @param password
	 * @param name
	 * @param birth
	 * @param email
	 * @param profileImg
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("birth") String birth,
			@RequestParam("email") String email,
			@RequestParam(value="file", required=false) MultipartFile profileImg) throws Exception {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.Hashing(password, loginId);
		
		// DB insert
		int row = userBO.insertUser(loginId, encryptPassword, name, birth, email, profileImg);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "회원가입이 되지 않았습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
	
	/**
	 * 로그인 기능 - AJAX 호출 
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) throws Exception {
		
		// 비밀번호 암호화 
		String encryptPassword = EncryptUtils.Hashing(password, loginId);
		
		// 로그인 id, 암호화 password로 DB에서 select
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// 로그인 성공 시 
		if (user != null) {
			// 로그인 - 세션에 저장(로그인 상태 유지)
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
		} else {
			result.put("result", "error");
			result.put("errorMessage", "로그인이 되지 않았습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
}
