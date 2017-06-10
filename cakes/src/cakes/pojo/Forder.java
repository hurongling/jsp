package cakes.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Forder{

	private int fid;
	private Date fdate;
	private double ftotal;
	private String fname;
	private String fphone;
	private String fremark;
	private String femail;
	private String fpost;
	private Users users;
	private Status status;

	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	/* 存储购物项 */
	private List<Sorder> sorders=new ArrayList<Sorder>();
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFphone() {
		return fphone;
	}
	public void setFphone(String fphone) {
		this.fphone = fphone;
	}
	public String getFremark() {
		return fremark;
	}
	public void setFremark(String fremark) {
		this.fremark = fremark;
	}
	public String getFemail() {
		return femail;
	}
	public void setFemail(String femail) {
		this.femail = femail;
	}
	public String getFpost() {
		return fpost;
	}
	public void setFpost(String fpost) {
		this.fpost = fpost;
	}
	public List<Sorder> getSorders() {
		return sorders;
	}
	public void setSorders(List<Sorder> sorders) {
		this.sorders = sorders;
	}
	public double getFtotal() {
		return ftotal;
	}
	public void setFtotal(double ftotal) {
		this.ftotal = ftotal;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
}
