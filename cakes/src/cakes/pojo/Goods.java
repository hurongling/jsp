package cakes.pojo;

import java.util.Date;

public class Goods {
	private int gid;
	private String gname;
	private double gprice;
	private String gremark;
	private String gxremark;
	private Date gdate;
	private int giscommend;
	private int gisopen;
	private String gpic;
	private Category category;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}

	public double getGprice() {
		return gprice;
	}
	public void setGprice(double gprice) {
		this.gprice = gprice;
	}
	public String getGremark() {
		return gremark;
	}
	public void setGremark(String gremark) {
		this.gremark = gremark;
	}
	public String getGxremark() {
		return gxremark;
	}
	public void setGxremark(String gxremark) {
		this.gxremark = gxremark;
	}
	public Date getGdate() {
		return gdate;
	}
	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}
	public int getGiscommend() {
		return giscommend;
	}
	public void setGiscommend(int giscommend) {
		this.giscommend = giscommend;
	}
	public int getGisopen() {
		return gisopen;
	}
	public void setGisopen(int gisopen) {
		this.gisopen = gisopen;
	}
	public String getGpic() {
		return gpic;
	}
	public void setGpic(String gpic) {
		this.gpic = gpic;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}

}
