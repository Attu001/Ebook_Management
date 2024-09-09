package com.DOA;

import com.entity.User;

public interface UserDAo {
	public boolean userRegister(User us);
	
	public User userLogin(String email,String password);

	public boolean checkpassword(String ps,int id);
	
	public boolean updateuser(User us);
	
	public boolean updateaddress(String address);
	
}
