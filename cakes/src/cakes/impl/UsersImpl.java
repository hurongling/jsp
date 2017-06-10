package cakes.impl;

import cakes.dao.IUsers;
import cakes.pojo.Users;
import cakes.util.Conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsersImpl implements IUsers {

	@Override
	public Users queryUsers(Users users) {
		// TODO Auto-generated method stub
		Users temp = null;
		Connection connection = null;
		PreparedStatement pre = null;
		String sql = "SELECT * FROM users WHERE ulogin=? AND upass=?";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			pre = connection.prepareStatement(sql);
			pre.setString(1, users.getUlogin());
			pre.setString(2, users.getUpass());
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				temp = new Users();
				temp.setUlogin(rs.getString("ulogin"));
				temp.setUpass(rs.getString("upass"));
				temp.setUname(rs.getString("uname"));
				temp.setUemail(rs.getString("uemail"));
				temp.setUaddress(rs.getString("uaddress"));
				temp.setUphone(rs.getString("uphone"));
				temp.setUid(rs.getInt("uid"));
				temp.setUsex(rs.getString("usex"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return temp;
	}

	@Override
	public boolean queryUlogin(String ulogin) {
		// TODO Auto-generated method stub
		boolean guess=false;
		Connection connection = null;
		PreparedStatement pre = null;
		String sql = "SELECT * FROM users WHERE ulogin='"+ulogin+"'";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			pre = connection.prepareStatement(sql);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				guess=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return guess;
	}

	@Override
	public void saveUlogin(Users users) {
		// TODO Auto-generated method stub
		Connection connection = null;
		Statement sql = null;
		String ulogin=users.getUlogin();
		String upass=users.getUpass();
		String str = "INSERT INTO users(ulogin,upass) VALUES ('"+ulogin+"','"+upass+"')";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			sql=connection.createStatement();
			sql.execute(str);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public String addUInfo(Users users) {
		// TODO Auto-generated method stub
		String result=null;
		int uid=users.getUid();
		String ulogin=users.getUlogin();
		String uname=users.getUname();
		String usex=users.getUsex();
		String uphone=users.getUphone();
		String uaddress=users.getUaddress();
		String uemail=users.getUemail();
		
		
//		System.err.println("我来函数里了");
//		System.err.println("uid是"+uid);
//		System.err.println("uname是"+uname);
//		System.err.println("usex是"+usex);
//		System.err.println("uphone是"+uphone);
//		System.err.println("uaddress是"+uaddress);
		
		
		
		Connection connection = null;
		Statement sql = null;
	    ResultSet rs; 
		String str = "SELECT * FROM users where uid="+uid;
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			 sql=connection.createStatement();
			 rs=sql.executeQuery(str);
	          if(rs.next()){
	           sql.executeUpdate("update users set ulogin='"+ulogin+"' where uid="+uid);	
	           sql.executeUpdate("update users set uname='"+uname+"' where uid="+uid);
	           sql.executeUpdate("update users set usex='"+usex+"' where uid="+uid);	
	           sql.executeUpdate("update users set uphone='"+uphone+"' where uid="+uid);
	           sql.executeUpdate("update users set uaddress='"+uaddress+"' where uid="+uid);	
	           sql.executeUpdate("update users set uemail='"+uemail+"' where uid="+uid);
	           result="修改成功！";
	          }	 else{result="修改失败！";}  		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;				
	}

	@Override
	public String alterPass(String upass, String pass, String pass1,int uid) {
		// TODO Auto-generated method stub
    
		String result=null;	
		if(pass==pass1){result="前后密码输入不一致！";}
		else {
			Connection connection = null;
			Statement sql = null;
		    ResultSet rs; 
			Conn conns = new Conn();
			connection = conns.getConn();	
		    		
				    try{ 
				    	sql=connection.createStatement();
				          rs=sql.executeQuery("SELECT * FROM users where uid='"+uid+"' and upass='"+upass+"'");
				          if(rs.next()){
				           sql.executeUpdate("update users set upass='"+pass+"' where uid='"+uid+"'");	
				           result="修改成功！";
				          }
				          else	{
				          	 result="输入密码错误！请重新输入";
				          	 
				          }		          
				     }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		}
				
		return result;
	}
	
	
	

}
