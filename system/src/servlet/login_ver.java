package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import weiyi.MySQL;

public class login_ver extends HttpServlet {
	MySQL mySQL = new MySQL();

	/**
	 * Constructor of the object.
	 */
	public login_ver() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sql = "SELECT *  FROM `admin_user` WHERE `adminname` LIKE '"
				+ username + "' AND `password` LIKE '" + password + "'";
		Map<Integer, Map<String, String>> list = mySQL.MySQL_chaxun(sql);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (list != null) {
			if (list.size() > 0) {
				HttpSession session=  request.getSession(true);
				session.setAttribute("username",username);
				session.setAttribute("password", password);
				session.setAttribute("role", list.get(0).get("role"));
				session.setMaxInactiveInterval(60*60);//单位秒
				out.print(1);
			} else {
				out.print(0);
			}
		} else {
			out.print(0);
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		
	}

}
