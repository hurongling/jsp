package cakes.impl;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import cakes.dao.IGoods;
import cakes.pojo.Goods;
import cakes.pojo.Category;
import cakes.util.Conn;

public class GoodsImpl implements IGoods {

	@Override
	public List<Goods> queryGiscommendGoods(int cid) {
		// TODO Auto-generated method stub
		List<Goods> goodss = new ArrayList<Goods>();
		Connection connection = null;
		Statement sql = null;
		ResultSet rs = null;
		String str = "SELECT * FROM goods g INNER JOIN category c ON g.cid=c.cid WHERE giscommend=1 AND gisopen=1 AND g.cid='"+cid+"'"+"  ORDER by gdate DESC";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			sql=connection.createStatement();
			rs = sql.executeQuery(str);
			while (rs.next()) {
				Goods goods = new Goods();
				goods.setGid(rs.getInt("gid"));
				goods.setGname(rs.getString("gname"));			
				goods.setGdate(rs.getDate("gdate"));
				goods.setGiscommend(rs.getInt("giscommend"));
				goods.setGisopen(rs.getInt("gisopen"));
				goods.setGprice(rs.getFloat("gprice"));
				goods.setGremark(rs.getString("gremark"));
				goods.setGxremark(rs.getString("gxremark"));
				goods.setGpic(rs.getString("gpic"));
				Category category = new Category();
				category.setCid(rs.getInt("cid"));
				category.setCtype(rs.getString("ctype"));
				category.setChot(rs.getInt("chot"));
				goods.setCategory(category);
				goodss.add(goods);
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
		return goodss;
	}

	@Override
	public void saveGoods(Goods goods) {
		// TODO Auto-generated method stub
		Connection connection = null;
		Statement sql = null;
		
		String gname=goods.getGname();
		double gprice=goods.getGprice();
		String gremark=goods.getGremark();
		String gxremark=goods.getGxremark();
		int giscommend=goods.getGiscommend();
		int gisopen=goods.getGisopen();
		String gpic=goods.getGpic();
		int cid=goods.getCategory().getCid();
		
		String str = "INSERT INTO goods(gname,gprice,gpic,gremark,gxremark,gdate,giscommend,gisopen,cid) VALUES('"+gname+"',"+gprice+",'"+gpic+"','"+gremark+"','"+gxremark+"',DEFAULT,"+giscommend+","+gisopen+","+cid+")";
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
	public List<Goods> queryGoods(int cid) {
		// TODO Auto-generated method stub
		List<Goods> goodss = new ArrayList<Goods>();
		Connection connection = null;
		Statement sql = null;
		ResultSet rs = null;
		String str = "SELECT * FROM goods g INNER JOIN category c ON g.cid=c.cid WHERE  g.cid='"+cid+"'"+"  ORDER by gdate DESC";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			sql=connection.createStatement();
			rs = sql.executeQuery(str);
			while (rs.next()) {
				Goods goods = new Goods();
				goods.setGid(rs.getInt("gid"));
				goods.setGname(rs.getString("gname"));			
				goods.setGdate(rs.getDate("gdate"));
				goods.setGiscommend(rs.getInt("giscommend"));
				goods.setGisopen(rs.getInt("gisopen"));
				goods.setGprice(rs.getFloat("gprice"));
				goods.setGremark(rs.getString("gremark"));
				goods.setGxremark(rs.getString("gxremark"));
				goods.setGpic(rs.getString("gpic"));
				Category category = new Category();
				category.setCid(rs.getInt("cid"));
				category.setCtype(rs.getString("ctype"));
				category.setChot(rs.getInt("chot"));
				goods.setCategory(category);
				goodss.add(goods);
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
		return goodss;
	}
	
	
	

}
