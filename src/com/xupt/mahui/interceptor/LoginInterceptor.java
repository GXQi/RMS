package com.xupt.mahui.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception {
		// TODO Auto-generated method stub
		String requestUri = request.getPathInfo();
		
		
		HttpSession session = request.getSession();
	//	session.setMaxInactiveInterval(10);
		Boolean login = (Boolean) session.getAttribute("login");
	//	session.setAttribute("login", true);
		if (login == null || !login) {
			System.out.println(request.getRequestURI());
			System.out.println(request.getContextPath() + "这是拦截器");
			request.getRequestDispatcher("./login.re").forward(request, response);;
	        //response.sendRedirect("");
	        return false;
	    }
	    return true;
	}
}
