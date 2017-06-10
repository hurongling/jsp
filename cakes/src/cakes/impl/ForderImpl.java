package cakes.impl;

import cakes.dao.IForder;
import cakes.dao.ISorder;
import cakes.pojo.Forder;
import cakes.pojo.Sorder;
import cakes.util.Conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ForderImpl implements IForder {
	private ISorder sorderImpl=new SorderImpl();

	@Override
	public Forder addSorder(Forder forder, Sorder sorder) {
		// TODO Auto-generated method stub
		List<Sorder> sorders = forder.getSorders();
		int i = 0;
		for (; i < sorders.size(); i++) {
			if (sorders.get(i).getGoods().getGid() == sorder.getGoods().getGid()) {
				break;
			}
		}
		if (i < sorders.size())
			sorders.get(i).setSnumber(sorders.get(i).getSnumber() + 1);
		else
			sorders.add(sorder);
		forder.setSorders(sorders);
		// 重新计算购物总价
		forder.setFtotal(this.cluTotal(forder));
		return forder;
	}

	@Override
	public double cluTotal(Forder forder) {
		// TODO Auto-generated method stub
		float total = 0;
		for (Sorder sorder : forder.getSorders()) {
			total += sorder.getSnumber() * sorder.getSprice();
		}
		return total;
	}

	public Forder deleteSorder(Forder forder, int gid) {
		// TODO Auto-generated method stub
		List<Sorder> sorders = forder.getSorders();
		for (int i = 0; i < sorders.size(); i++) {
			if (sorders.get(i).getGoods().getGid() == gid) {
				sorders.remove(i);
				break;
			}
		}
		// 删除后的购物项集合放入到购物车中
		forder.setSorders(sorders);
		// 从新计算购物总价
		forder.setFtotal(this.cluTotal(forder));
		return forder;
	}

	@Override
	public Forder saveForder(Forder forder) {
		// TODO Auto-generated method stub
		int fid=0;
		Connection connection = null;
		PreparedStatement pre = null;
		ResultSet rs=null;
		Double ftotal=forder.getFtotal();
		String fname=forder.getFname();
		String fphone=forder.getFphone();
		String fremark=forder.getFremark();
		String femail=forder.getFemail();
		String fpost=forder.getFpost();
		int uid=forder.getUsers().getUid();
		String sql = "INSERT INTO forder (ftotal,fname,fphone,fremark,femail,fpost,uid) values ("
		+ftotal+",'"+fname+"','"+fphone+"','"+fremark+"','"+femail+"','"+fpost+"',"+uid+")";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			connection.setAutoCommit(false); // 手动提交事务
			pre = connection.prepareStatement(sql);
//			pre.setDouble(1, forder.getFtotal());
//			pre.setString(2, forder.getFname());
//			pre.setString(3, forder.getFphone());
//			pre.setString(4, forder.getFremark());
//			pre.setString(5, forder.getFemail());
//			pre.setString(6, forder.getFpost());  // 读取 分析 执行
//			pre.setInt(7, forder.getUsers().getUid());
			pre.executeUpdate();
			//查询出插入订单的主键
			pre=connection.prepareStatement("SELECT @@IDENTITY id FROM forder");
			//@@identity 是表示的是最近一次向具有identity属性(即自增列)的表插入
			//数据时对应的自增列的值，是系统定义的全局变量。一般系统定义的全局变
			//量都是以@@开头，用户自定义变量以@开头
			rs=pre.executeQuery();
			if(rs.next())
				fid=rs.getInt("id");
			//插入订单项,由于要在同一个事务中,所以要使用同一个connection
			for(Sorder sorder:forder.getSorders()){
				sorderImpl.saveSorder(sorder, fid, connection);
			}
			connection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return forder;
	}

	@Override
	public Forder updateSorder(Forder forder, int gid, int snumber) {
		// TODO Auto-generated method stub
		for(Sorder temp:forder.getSorders()){
			if(temp.getGoods().getGid()==gid){
				temp.setSnumber(snumber);
			}
		}
		forder.setFtotal(this.cluTotal(forder));
		return forder;
	}

	@Override
	public void updateForderStatus(int fid, int sid) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement pre = null;
		String sql = "UPDATE forder SET sid=? WHERE fid=?";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			pre = connection.prepareStatement(sql);
			pre.setInt(1, sid);
			pre.setInt(2, fid);
			pre.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public List<Forder> queryForder(int uid) {
		// TODO Auto-generated method stub
		List<Forder> forders = new ArrayList<Forder>();
		List<Sorder> sorders=new ArrayList<Sorder>();
		Connection connection = null;
		Statement sql = null;
		ResultSet rs = null;
		String str = "SELECT * FROM forder f INNER JOIN sorder s ON f.fid=s.fid WHERE  f.uid="+uid+"  ORDER by gdate DESC";
		Conn conns = new Conn();
		connection = conns.getConn();
		try {
			sql=connection.createStatement();
			rs = sql.executeQuery(str);
			while (rs.next()) {
				Forder forder = new Forder();
				forder.setFid(rs.getInt("fid"));
				forder.setFtotal(rs.getDouble("ftotal"));
				forder.setFname(rs.getString("fname"));
				forder.setFphone(rs.getString("fphone"));
				forder.setFremark(rs.getString("fremark"));
				forder.setFemail(rs.getString("femail"));
				forder.setFpost(rs.getString("fpost"));
				forder.setFdate(rs.getDate("fdate"));
				Sorder sorder=new Sorder();
				sorder.setSid(rs.getInt("sid"));
				sorder.setSname(rs.getString("sname"));
				sorder.setSprice(rs.getDouble("sprice"));
				sorder.setSnumber(rs.getInt("snumber"));
				sorders.add(sorder);
                forder.setSorders(sorders);
                forders.add(forder);
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
		return forders;
	}
	
	

}
