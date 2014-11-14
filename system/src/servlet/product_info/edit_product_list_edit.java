package servlet.product_info;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import weiyi.MySQL;

public class edit_product_list_edit extends HttpServlet {
	MySQL mySQL = new MySQL();

	/**
	 * Constructor of the object.
	 */
	public edit_product_list_edit() {
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
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pronum = request.getParameter("pronum");
		String weigh = request.getParameter("weigh");
		String cost = request.getParameter("cost");
		String sgprice = request.getParameter("sgprice");
		String oldnew = request.getParameter("oldnew");
		String legalcopy = request.getParameter("legalcopy");
		String officialname = request.getParameter("officialname");
		String sku_usage = request.getParameter("sku_usage");
		String brandowner = request.getParameter("brandowner");
		String pro_category = request.getParameter("pro_category");
		String the_keywords = request.getParameter("the_keywords");
		String pro_color = request.getParameter("pro_color");
		String suitforstyle = request.getParameter("suitforstyle");
		String highlights1 = request.getParameter("highlights1");
		String highlights2 = request.getParameter("highlights2");
		String highlights3 = request.getParameter("highlights3");
		String highlights4 = request.getParameter("highlights4");
		String highlights5 = request.getParameter("highlights5");
		String pro_cname = request.getParameter("pro_cname");
		String pro_ename = request.getParameter("pro_ename");
		String pro_amzname = request.getParameter("pro_amzname");
		String content = request.getParameter("content");
		String editor = (String) session.getAttribute("username");
		// System.out.println("content:" + content);

		String sql = "UPDATE `productlist` SET `pronum` = '" + pronum
				+ "', `weigh` = '" + weigh + "', `cost` = '" + cost
				+ "',`sgprice`='" + sgprice + "',`oldnew`='" + oldnew
				+ "',`legalcopy`='" + legalcopy + "',`officialname`='"
				+ officialname + "',`sku_usage`='" + sku_usage
				+ "',`brandowner`='" + brandowner + "',`pro_category`='"
				+ pro_category + "',`the_keywords`='" + the_keywords
				+ "',`pro_color`='" + pro_color + "',`suitforstyle`='"
				+ suitforstyle + "',`highlights1`='" + highlights1
				+ "',`highlights2`='" + highlights2 + "',`highlights3`='"
				+ highlights3 + "',`highlights4`='" + highlights4
				+ "',`highlights5`='" + highlights5 + "',`pro_cname`='"
				+ pro_cname + "',`pro_ename`='" + pro_ename
				+ "',`pro_amzname`='" + pro_amzname + "',`content`='" + content
				+ "',`editor`='" + editor + "',`lastedittime`=NOW() WHERE `productlist`.`id` = "
				+ id + " LIMIT 1;";

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (mySQL.MySQL_no_chaxun(sql)) {
			out.print(1);
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
