package cakes.ser;


import cakes.dao.ICategory;
import cakes.impl.CategoryImpl;
import cakes.pojo.Account;
import cakes.pojo.Category;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CategorySer extends HttpServlet {
	private ICategory categoryImpl=new CategoryImpl();
	//声明一个Category实现类

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public CategorySer() {
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
		if (status.equals("saveCategory")) {
			Category category = new Category();
			category.setCtype(request.getParameter("ctype"));
			if(request.getParameter("chot")==null){category.setChot(0);
			}else{
				category.setChot(Integer.parseInt(request.getParameter("chot").trim()));
			}
			category.setAccount((Account)request.getSession().getAttribute("account"));
			categoryImpl.saveCategory(category);
			//类别插入后及时更新类别
			this.getServletContext().setAttribute("categorys",categoryImpl.queryCategory(""));
			response.sendRedirect("/cakes/admin/main.jsp");
		} else if (status.equals("queryCategory")) {
			String ctype = request.getParameter("ctype");
			List<Category> categorys = categoryImpl.queryCategory(ctype);
			request.setAttribute("categorys", categorys);
			request.getRequestDispatcher("/admin/queryCategory.jsp").forward(request, response);
		}else if(status.equals("checkCype")){
			String ctype=request.getParameter("ctype");
			//调用查询类别的方法,返回为true 说明类别已经有,为false说明类别可以使用
			if(ctype.equals("test")){
				//说明已经被占用,向客户端的缓冲,输出信息,而不是返回页面
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
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
