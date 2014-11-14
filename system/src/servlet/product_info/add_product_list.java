package servlet.product_info;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import weiyi.MySQL;

public class add_product_list extends HttpServlet {
	MySQL mySQL = new MySQL();

	/**
	 * Constructor of the object.
	 */
	public add_product_list() {
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

		String pronum = "";
		String weigh = "";
		String cost = "";
		String sgprice = "";
		String oldnew = "";
		String legalcopy = "";
		String officialname = "";
		String usage = "";
		String brandowner = "";
		String pro_category = "";
		String the_keywords = "";
		String pro_color = "";
		String suitforstyle = "";
		String highlights1 = "";
		String highlights2 = "";
		String highlights3 = "";
		String highlights4 = "";
		String highlights5 = "";
		String pro_cname = "";
		String pro_ename = "";
		String pro_amzname = "";
		String content = "";

		pronum = request.getParameter("pronum");
		weigh = request.getParameter("weigh");
		cost = request.getParameter("cost");
		sgprice = request.getParameter("sgprice");
		oldnew = request.getParameter("choose_xj");
		legalcopy = request.getParameter("choose_pf");
		officialname = request.getParameter("officialname");
		usage = request.getParameter("usage");
		brandowner = request.getParameter("brandowner");
		pro_category = request.getParameter("pro_category");
		the_keywords = request.getParameter("the_keywords");
		pro_color = request.getParameter("pro_color");
		suitforstyle = request.getParameter("suitforstyle");
		highlights1 = request.getParameter("highlights1");
		highlights2 = request.getParameter("highlights2");
		highlights3 = request.getParameter("highlights3");
		highlights4 = request.getParameter("highlights4");
		highlights5 = request.getParameter("highlights5");
		pro_cname = request.getParameter("pro_cname");
		pro_ename = request.getParameter("pro_ename");
		pro_amzname = request.getParameter("pro_amzname");
		content = request.getParameter("content");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 验证 该商品 在数据库中是否存在
		String sql = "";

		sql = "select `pronum` from `productlist` where `pronum` like '"+pronum+"'";

		Map<Integer, Map<String, String>> count = mySQL.MySQL_chaxun(sql);
		if (count != null) {
			if (count.size() == 0) {
				HttpSession session = request.getSession();

				// 数据库没有记录
				sql = "INSERT INTO `system`.`productlist` (`id`, `pronum`, `pro_cname`, `pro_ename`, `pro_amzname`, `content`, `weigh`, `cost`, `sgprice`, `oldnew`, `legalcopy`, `officialname`, `sku_usage`, `brandowner`, `pro_category`, `the_keywords`, `pro_color`, `suitforstyle`, `highlights5`, `highlights4`, `highlights3`, `highlights2`, `highlights1`, `creator`, `creattime`, `editor`, `lastedittime`) VALUES (NULL, '"
						+ pronum
						+ "', '"
						+ pro_cname
						+ "', '"
						+ pro_ename
						+ "', '"
						+ pro_amzname
						+ "', '"
						+ content
						+ "', '"
						+ weigh
						+ "', '"
						+ cost
						+ "', '"
						+ sgprice
						+ "', '"
						+ oldnew
						+ "', '"
						+ legalcopy
						+ "', '"
						+ officialname
						+ "', '"
						+ usage
						+ "', '"
						+ brandowner
						+ "', '"
						+ pro_category
						+ "', '"
						+ the_keywords
						+ "', '"
						+ pro_color
						+ "', '"
						+ suitforstyle
						+ "', '"
						+ highlights5
						+ "', '"
						+ highlights4
						+ "', '"
						+ highlights3
						+ "', '"
						+ highlights2
						+ "', '"
						+ highlights1
						+ "', '"
						+ session.getAttribute("username")
						+ "', NOW(), '"
						+ session.getAttribute("username") + "', NOW());";
				boolean status = mySQL.MySQL_no_chaxun(sql);
				if (status) {
					// 添加成功
					out.print(0);
				} else {
					// 添加失败
					out.print(1);
				}
			} else if (count.size() >= 1) {
				// 数据库 有记录
				out.print(2);
			}
		} else {
			// 超时
			out.print(1);
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
