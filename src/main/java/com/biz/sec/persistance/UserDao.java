package com.biz.sec.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.biz.sec.domain.UserDetailsVO;
import com.biz.sec.domain.UserVO;

public interface UserDao {

	
	public List<UserDetailsVO> selectAll();
		
	public void create_table(String create_table);
	
	public UserDetailsVO findByUserName(String username);
	
	public int insert(UserDetailsVO userVO);

	
	public UserDetailsVO findById(long id);

	public int update(UserDetailsVO userVO);
	
}












