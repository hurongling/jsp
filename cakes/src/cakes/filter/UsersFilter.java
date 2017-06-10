package cakes.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class UsersFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filter) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest)request;
		if(req.getSession().getAttribute("users")==null){
			//非法请求,自动跳转到用户登录页面
			req.setAttribute("error", "购物商品请先登录");
			
			//将goUrl存入了Session，地址？参数
			//这样登陆成功后就可以跳转到刚刚浏览的页面，而不是转到首页
			req.getSession().setAttribute("goUrl",req.getRequestURI() + "?" + req.getQueryString());
			req.getRequestDispatcher("/ulogin.jsp").forward(request, response);
		}else{
//			HttpServletResponse res=(HttpServletResponse)response;
//			res.sendRedirect("cakes/index.jsp");
			filter.doFilter(request, response);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
