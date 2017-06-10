package cakes.ser;

import cakes.dao.IAccount;
import cakes.impl.AccountImpl;
import cakes.pojo.Account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountSer extends HttpServlet {
	private IAccount accountImpl = new AccountImpl();//实例化一个获取account对象的实力

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AccountSer() {
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
		if (status.equals("login")) {
			Account account = new Account();
			account.setAlogin(request.getParameter("alogin"));
			account.setApass(request.getParameter("apass"));
			account = accountImpl.queryAccount(account);
			//传入的account只有用登录名和密码，如果找得到，返回的account是个丰满是account对象
			//如果找不到，返回是account是null
			if (account == null) { // 登录失败
				request.setAttribute("error", "对不起登录失败!");
				request.getRequestDispatcher("/alogin.jsp").forward(request,
						response);
			} else {
				request.getSession().setAttribute("account", account);
				response.sendRedirect("/cakes/admin/index.jsp");
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
