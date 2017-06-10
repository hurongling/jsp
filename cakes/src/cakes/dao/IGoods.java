package cakes.dao;

import cakes.pojo.Goods;

import java.util.List;

public interface IGoods {
	public List<Goods> queryGiscommendGoods(int cid);
	
	public void saveGoods(Goods goods);//向goods表插入数据
	
	public List<Goods> queryGoods(int cid);
}
