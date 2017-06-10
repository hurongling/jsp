package cakes.impl;

import cakes.dao.IAccount;
import cakes.pojo.Account;
import cakes.util.*;

import java.sql.*;

public class AccountImpl implements IAccount {

	@Override
	public Account queryAccount(Account account) {
		// TODO Auto-generated method stub
		Account temp = null;
		Connection con=null;
    	PreparedStatement pre = null;
    	String sql = "SELECT * FROM account WHERE alogin=? AND apass=?";
	    Conn cn=new Conn();
    	con=cn.getConn();
    	try { 
    		pre = con.prepareStatement(sql);
			pre.setString(1, account.getAlogin());
			pre.setString(2, account.getApass());
			ResultSet rs = pre.executeQuery();
			
//			如果找到该用户，实例化Account对象temp并返回
			if (rs.next()) {
				temp = new Account();
				temp.setAid(rs.getInt("aid"));
				temp.setAlogin(rs.getString("alogin"));
				temp.setApass(rs.getString("apass"));
				temp.setAname(rs.getString("aname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return temp;
	}
}