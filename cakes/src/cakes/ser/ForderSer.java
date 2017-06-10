package cakes.ser;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cakes.dao.IForder;
import cakes.impl.ForderImpl;
import cakes.pojo.Forder;
import cakes.pojo.Goods;
import cakes.pojo.Sorder;
import cakes.pojo.Status;
import cakes.pojo.Users;

public class ForderSer extends HttpServlet {
	private IForder forderImpl = new ForderImpl();

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ForderSer() {
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
		if (status.equals("buy")) {
			// 从Session中拿出Forder
			Forder forder = (Forder) request.getSession().getAttribute("forder");
			// 获取要买的商品信息
			Sorder sorder = new Sorder();
			String sname=new String(request.getParameter("gname").getBytes("iso-8859-1"),"utf-8");
			String gpic=new String(request.getParameter("gpic").trim().getBytes("iso-8859-1"),"utf-8");
			sorder.setSname(sname);
			sorder.setSnumber(1);
			sorder.setSprice(Double.parseDouble(request.getParameter("gprice")));
			Goods goods = new Goods();
			goods.setGid(Integer.parseInt(request.getParameter("gid")));
			goods.setGpic(gpic);
			goods.setGprice(Double.parseDouble(request.getParameter("gprice")));
			sorder.setGoods(goods);
			// 把购物项添加到Forder
			request.getSession().setAttribute("forder",forderImpl.addSorder(forder, sorder));
			response.sendRedirect("/cakes/users/showCar.jsp");
		}else if(status.equals("deleteForder")){
			request.getSession().setAttribute("forder", new Forder());
			response.sendRedirect("/cakes/users/showCar.jsp");
		}else if(status.equals("deleteSorder")){
			int gid=Integer.parseInt(request.getParameter("gid"));
			Forder forder = (Forder) request.getSession().getAttribute("forder");
			request.getSession().setAttribute("forder",forderImpl.deleteSorder(forder, gid));
			response.sendRedirect("/cakes/users/showCar.jsp");
		}else if(status.equals("saveForder")){
			Forder forder=(Forder)request.getSession().getAttribute("forder");
			forder.setFname(request.getParameter("fname"));
			forder.setFemail(request.getParameter("femail"));
			forder.setFphone(request.getParameter("fphone"));
			forder.setFpost(request.getParameter("fpost"));
			forder.setFremark(request.getParameter("fremark"));
			forder.setStatus(new Status(1));
			//先获取整个user再取user中有用的东西
			forder.setUsers((Users)request.getSession().getAttribute("users"));
			forder.getUsers().setUaddress(request.getParameter("uaddress"));
			request.getSession().setAttribute("forder",forderImpl.saveForder(forder));
			request.getSession().setAttribute("forder", new Forder());
			response.sendRedirect("/cakes/users/ok.jsp");
		}else if(status.equals("updateSorder")){
			int gid=Integer.parseInt(request.getParameter("gid"));
			int snumber=Integer.parseInt(request.getParameter("snumber"));
			//更新购物车某个商品的数量,然后修改总价,并返回
			Forder forder = (Forder) request.getSession().getAttribute("forder");
			forder=forderImpl.updateSorder(forder, gid, snumber);
			request.getSession().setAttribute("forder", forder);
			
			response.getWriter().write(forder.getFtotal()+"");
		}else if(status.equals("showForder")){
			System.err.println("可以来到这");
			int uid=Integer.parseInt(request.getParameter("uid").trim());
			System.err.println("uid是"+uid);
			List<Forder> forders = new ArrayList<Forder>();
			forders=forderImpl.queryForder(uid);
			request.getSession().setAttribute("forders",forders);
			response.sendRedirect("/cakes/users/showForderInfo.jsp");
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
