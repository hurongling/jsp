package cakes.impl;

import java.util.ArrayList;
import java.util.List;

import cakes.dao.ICategory;
import cakes.pojo.Category;
import cakes.pojo.Account;
import cakes.util.Conn;

import java.sql.*;

public class CategoryImpl implements ICategory {

	@Override
	public void saveCategory(Category category) {
		// TODO Auto-generated method stub
		Connection connection = null;
		Statement sql = null;
		String ctype=category.getCtype();
		int chot =category.getChot();
		int aid =category.getAccount().getAid();
		String str = "INSERT INTO category(ctype,chot,aid) VALUES ('"+ctype+"',"+chot+","+aid+")";
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
	public List<Category> queryCategory(String ctype) {
		// 如果根据ctype找得到相应的记录，则把该记录的信息全部返回，
		// 还要返回account的信息，实例一个Category类，并返回一个Categorys list
		List<Category> categorys = new ArrayList<Category>();
		Connection connection = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM category c INNER JOIN account a on c.aid=a.aid  WHERE ctype LIKE ?";
		String sql1 = "SELECT * FROM category c INNER JOIN account a on c.aid=a.aid";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			//字符串有空格这里终于解决了，哈哈哈！
			if(ctype==null){
				pre = connection.prepareStatement(sql1);
				rs = pre.executeQuery();
			}else{
				pre = connection.prepareStatement(sql);
				pre.setString(1, "%" + ctype + "%");
				rs = pre.executeQuery();
			}
			while (rs.next()) {
				Category category = new Category();
				category.setCid(rs.getInt("cid"));
				category.setCtype(rs.getString("ctype"));
				category.setChot(rs.getInt("chot"));
				Account account = new Account();
				account.setAid(rs.getInt("aid"));
				account.setAlogin(rs.getString("alogin"));
				category.setAccount(account);
				categorys.add(category);//把一项category加入到categorys list中
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
		return categorys.size() == 0 ? null : categorys;
		//如果直接返回categorys，query jsp页面的requestScope.categorys!=null这里无论如何都不为null，
		//因为即使是一个空list，也不等于null
	}

	@Override
	public List<Category> queryCategory() {
		// TODO Auto-generated method stub
		List<Category> categorys = new ArrayList<Category>();
		Connection connection = null;
		Statement sql = null;
		ResultSet rs = null;
		String str = "SELECT * FROM category where chot=1";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			sql=connection.createStatement();
			rs = sql.executeQuery(str);
			while (rs.next()) {
				Category category = new Category();
				category.setCid(rs.getInt("cid"));
				category.setCtype(rs.getString("ctype"));
				category.setChot(rs.getInt("chot"));
				categorys.add(category);
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
		return categorys;
	}

}
