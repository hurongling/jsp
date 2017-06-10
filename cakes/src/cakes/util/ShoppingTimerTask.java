package cakes.util;

import java.util.TimerTask;
import cakes.dao.ICategory;
import cakes.dao.IGoods;
import cakes.impl.CategoryImpl;
import cakes.impl.GoodsImpl;
import cakes.pojo.Category;
import cakes.pojo.Goods;
import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

public class ShoppingTimerTask extends TimerTask {

	private ICategory categoryImpl = new CategoryImpl();

	private IGoods goodsImpl = new GoodsImpl();
	
	private ServletContext application=null;//tomcat容器

	@Override
	public void run() {
		// TODO Auto-generated method stub
		//查询热点类别的推荐商品
				List<List<Goods>> bigList = new ArrayList<List<Goods>>();
				// 查询出最多4个热点类别
				for (Category category : categoryImpl.queryCategory()) {
					List<Goods> goodss = goodsImpl.queryGiscommendGoods(category.getCid());
					bigList.add(goodss);
				}
				//把大集合存储到app中
				application.setAttribute("bigList", bigList);
			}
			
			public ServletContext getApplication() {
				return application;
			}

			public void setApplication(ServletContext application) {
				this.application = application;
			}

		}
