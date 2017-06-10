package cakes.ser;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cakes.dao.IGoods;
import cakes.impl.GoodsImpl;
import cakes.pojo.Category;
import cakes.pojo.Goods;

public class GoodsSer extends HttpServlet {
	private IGoods goodsImpl=new GoodsImpl();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public GoodsSer() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String status = request.getParameter("status");
		if (status.equals("saveGoods")) {
		Goods goods = new Goods();		
		goods.setGname(request.getParameter("gname"));
		goods.setGprice(Float.parseFloat(request.getParameter("gprice").trim()));
		goods.setGpic(request.getParameter("gpic"));
		goods.setGremark(request.getParameter("gremark"));
		goods.setGxremark(request.getParameter("gxremark"));
		goods.setGiscommend(Integer.parseInt(request.getParameter("giscommend").trim()));
		goods.setGisopen(Integer.parseInt(request.getParameter("gisopen").trim()));
		
		
		//怎么处理cid,是不是很厉害！
		//goods.setCategory((Category)categoryImpl.queryCategory(request.getParameter("ctype")));
		//不能这样子做，返回的是Category list
		Category category=new Category();
		category.setCid(Integer.parseInt(request.getParameter("cid").trim()));
		goods.setCategory(category);
		goodsImpl.saveGoods(goods);
		response.sendRedirect("/cakes/admin/main.jsp");
		}else if(status.equals("Cake")) {
		int cid=Integer.parseInt(request.getParameter("cid").trim());
		List<Goods>  cakesList = new ArrayList<Goods>();
	
//	System.err.println(cid);	

		switch(cid){
		case 1: cakesList=goodsImpl.queryGoods(1); break;
		case 2: cakesList=goodsImpl.queryGoods(2); break;
		case 3: cakesList=goodsImpl.queryGoods(3); break;
		case 4: cakesList=goodsImpl.queryGoods(4); break;
		case 5: cakesList=goodsImpl.queryGoods(5); break;			
		}
		request.getSession().setAttribute("cakesList",cakesList);			
//			将查询到的表放到session中
		response.sendRedirect("/cakes/cheeseCake.jsp");
			
		}
		
		
		

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
