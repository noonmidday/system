package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Session_ver implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String url = httpRequest.getRequestURI();
		//System.out.println("url:" + url);
		if (!url.equals("/system/index.jsp") && !url.equals("/system/")
				&& !url.equals("/system/servlet/login_ver")
				&& url.indexOf("resources") < 0) {

			HttpSession session = httpRequest.getSession();
			// 验证是否有session
			if (session.getAttribute("username") != null) {
				// 有session,那么就放行
				chain.doFilter(httpRequest, httpResponse);
			} else {
				// 没有session,那么就返回首页
				httpResponse.sendRedirect("/system/index.jsp");
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
