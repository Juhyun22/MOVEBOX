package com.movebox.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public boolean existLoginId(String loginId);
	
	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("name") String name, 
			@Param("birth") String birth, 
			@Param("email") String email, 
			@Param("profileImgPath") String profileImgPath);
}
