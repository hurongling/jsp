package cakes.dao;

import cakes.pojo.Category;

import java.util.List;

public interface ICategory {

	public void saveCategory(Category category);//向Category表插入数据
	
	public List<Category> queryCategory(String ctype);//根据名字查询Category表数据
	
	public List<Category> queryCategory();//根据是否为热点来查询类别
}
