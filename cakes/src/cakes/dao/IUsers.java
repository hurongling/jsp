package cakes.dao;

import cakes.pojo.Users;

public interface IUsers {
	public Users queryUsers(Users users);
	
	public boolean queryUlogin(String ulogin);
	
	public void saveUlogin(Users users);
	
	public String addUInfo(Users users);
	
	public String alterPass(String upass,String pass,String pass1, int uid);

}
