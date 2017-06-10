package cakes.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import cakes.dao.ISorder;
import cakes.pojo.Sorder;

public class SorderImpl implements ISorder {

	public void saveSorder(Sorder sorder, int fid, Connection conn) throws SQLException {
		// TODO Auto-generated method stub
		    String sname=sorder.getSname();
		    Double sprice=sorder.getSprice();
		    int snumber=sorder.getSnumber();
		    int gid=sorder.getGoods().getGid();
		    String sql="INSERT INTO sorder(sname,sprice,snumber,fid,gid) VALUES ('"+sname+"','"+sprice+"',"+snumber+","+fid+","+gid+")";
			PreparedStatement pre=conn.prepareStatement(sql);
//			pre.setString(1, sorder.getSname());
//			pre.setDouble(2, sorder.getSprice());
//			pre.setInt(3, sorder.getSnumber());
//			pre.setInt(4, fid);
//			pre.setInt(5, sorder.getGoods().getGid());
			pre.executeUpdate();
	}

}