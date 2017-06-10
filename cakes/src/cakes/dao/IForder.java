package cakes.dao;

import java.util.List;

import cakes.pojo.Forder;
import cakes.pojo.Sorder;

public interface IForder {
	
	public Forder addSorder(Forder forder,Sorder sorder);
	
	public Forder updateSorder(Forder forder,int gid,int snumber);
	
	public double cluTotal(Forder forder);
	
	public Forder deleteSorder(Forder forder,int gid);
	
	public Forder saveForder(Forder forder);
	
	public void updateForderStatus(int fid,int sid);
	
	public List<Forder> queryForder(int uid);	


}
