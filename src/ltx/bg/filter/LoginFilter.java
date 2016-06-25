package ltx.bg.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();
		
		// 从session里取用户的用户名信息
		String userName = (String) session.getAttribute("userName");
	    String[] urlSet={"index","login","list","four","indexSearch","downLoad","downloadList"};

	    //和登录以及前台有关的页面不需要过滤
	    	for (int i = 0; i < urlSet.length; i++) {
	    		if (path.indexOf(urlSet[i])>-1) {
	    			chain.doFilter(servletRequest, servletResponse);
	    			return; 
	    		}
			}
		
		// 判断如果没有取到登录信息,就跳转到登陆页面
		if (userName == null || "".equals(userName)) {
			// 跳转到登陆页面
			servletResponse.sendRedirect(servletRequest.getContextPath()+"/bglogin.do");
		} else {
			// 已经登陆,继续此次请求
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
