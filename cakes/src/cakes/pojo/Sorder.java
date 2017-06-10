package cakes.pojo;

public class Sorder {
	private int sid;
	private String sname;
	private Double sprice;
	private int snumber;
	private Goods goods;
	
	
	
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	public Double getSprice() {
		return sprice;
	}
	public void setSprice(Double sprice) {
		this.sprice = sprice;
	}
	public int getSnumber() {
		return snumber;
	}
	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
