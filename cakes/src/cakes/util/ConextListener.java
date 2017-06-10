package cakes.util;

import java.util.Timer;

import cakes.dao.ICategory;
import cakes.impl.CategoryImpl;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConextListener implements ServletContextListener {
	private ICategory categoryImpl=new CategoryImpl();
	
	//ServletContextListener经常用来设置应用范围内资源、数据的初始值	
	public void contextDestroyed(ServletContextEvent arg0) {
		//当Servlet容器终止Web应用时调用该方法。在调用该方法之前，
		//容器会先销毁所有的Servlet和Filter过滤器。
	}	

	public void contextInitialized(ServletContextEvent event) {
		// 当Servlet容器启动Web应用时调用该方法。在调用完该方法之后，
		// 容器再对Filter初始化，并且对那些在Web应用启动时就需要被初始化的Servlet进行初始化。
		// 将要共享的通过 setAttribute （ name,data ）方法提交到内存中去
		// 应用项目通过 getAttribute(name) 将数据取到 
		// 用在插入商品那
		event.getServletContext().setAttribute("categorys",categoryImpl.queryCategory(""));
		
		
		ShoppingTimerTask shoppingTimer=new ShoppingTimerTask();
		shoppingTimer.setApplication(event.getServletContext());
		//定时器，每隔5秒加载新增类别
		new Timer().schedule(shoppingTimer,0L,1000*5);
	}
}
