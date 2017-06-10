package cakes.ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cakes.dao.IUsers;
import cakes.impl.UsersImpl;
import cakes.pojo.Forder;
import cakes.pojo.Users;

public class UsersSer extends HttpServlet {

	private IUsers usresImpl = new UsersImpl();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UsersSer() {
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
			Users users = new Users();
			users.setUlogin(request.getParameter("ulogin"));
			users.setUpass(request.getParameter("upass"));
			users = usresImpl.queryUsers(users);
			if (users == null) { // 登录失败
				request.setAttribute("error", "用户名和密码错误");
				request.getRequestDispatcher("/ulogin.jsp").forward(request,
						response);
			} else {
				Forder forder=new Forder();	//创建了一个购物车,方便以后购物
				//Forder从session里拿出forder
				request.getSession().setAttribute("forder", forder);
				request.getSession().setAttribute("users", users);
				if (request.getSession().getAttribute("goUrl") != null) {
					// 说明用户登录成功后要跳转到想去页面
					//UsersFilter将goUrl存入了Session
					response.sendRedirect(request.getSession().getAttribute(
							"goUrl").toString());
				} else {
					response.sendRedirect("/cakes/index.jsp");
				}
			}
		}else if (status.equals("register")){
			String ulogin=request.getParameter("ulogin");
			String upass=request.getParameter("upass");
			String upass1=request.getParameter("upass1");
			if(!upass.equals(upass1)){
				request.setAttribute("error", "两次输入的密码不一致");
				request.getRequestDispatcher("/register.jsp").forward(request,
						response);
			}else {
				if(usresImpl.queryUlogin(ulogin)){
					request.setAttribute("error", "该用户已存在");
					request.getRequestDispatcher("/register.jsp").forward(request,
							response);
				}else{
					Users users = new Users();
					users.setUlogin(request.getParameter("ulogin"));
					users.setUpass(request.getParameter("upass"));
					usresImpl.saveUlogin(users);
					request.getRequestDispatcher("/ulogin.jsp").forward(request,
							response);
				}
				
				
			}
			
			
		}else if(status.equals("addUInfo")){
			
			//乱码问题，多次试无果，但是呢，有时候想过多更错更多
			String uname=request.getParameter("uname");
		//	byte b[]=uname.getBytes("ISO-8859-1");
		//	uname=new String(b);
		//	request.setAttribute("uname",uname);
			//String uname=new String(request.getParameter("uname").getBytes("iso-8859-1"),"utf-8");
			String usex=request.getParameter("usex");
			String uphone=request.getParameter("uphone");
			String uemail=request.getParameter("uemail");
			String uaddress=request.getParameter("uaddress");
			Users users = new Users();
			
//			System.out.println("有木有呢");
//		    System.out.println(uname);
//		    System.out.println(usex);
//		    System.out.println(uphone);
//		    System.out.println(uemail);
//		    System.out.println(uaddress);
//		    System.out.println("有木有呢");
		    
			users.setUid(((Users)request.getSession().getAttribute("users")).getUid());
			users.setUlogin(((Users)request.getSession().getAttribute("users")).getUlogin());
			users.setUpass(((Users)request.getSession().getAttribute("users")).getUpass());
			users.setUname(uname);
			users.setUphone(uphone);
			users.setUsex(usex);
			users.setUemail(uemail);
			users.setUaddress(uaddress);
			
//			System.out.println("有木有呢");
//			System.out.println("uid"+users.getUid());
//		    System.out.println(users.getUaddress());
//		    System.out.println(users.getUemail());
//		    System.out.println(users.getUlogin());
//		    System.out.println(users.getUphone());
//		    System.out.println(users.getUsex());
//		    System.out.println("有木有呢");			
//			
			
			
			String err=usresImpl.addUInfo(users);
			request.setAttribute("error",err);
			request.getRequestDispatcher("/users/userInfo.jsp").forward(request,response);
			//response.sendRedirect("/cakes/users/userInfo.jsp");
		}else if(status.equals("alterPass")){
			String upass=request.getParameter("upass");
			String pass=request.getParameter("pass");
			String pass1=request.getParameter("pass1");
			int uid=((Users)request.getSession().getAttribute("users")).getUid();
			String err=usresImpl.alterPass(upass, pass, pass1, uid);
			request.setAttribute("error",err);
			request.getRequestDispatcher("/users/alterPass.jsp").forward(request,response);
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
