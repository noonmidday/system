package servlet.product_info;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import weiyi.MySQL;

public class show_virtualsku_list extends HttpServlet {
	MySQL mySQL = new MySQL();

	/**
	 * Constructor of the object.
	 */
	public show_virtualsku_list() {
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
		String sql = "";
		String type = request.getParameter("type");
	
		if (type == null || type.equalsIgnoreCase("")) {
			sql = "SELECT * FROM `virtualsku`";
			
		}else{
			String virsku = request.getParameter("prasku");
			sql = "SELECT * FROM `virtualsku` where virsku like '%"+virsku+"%'";
			
		}
		JSONArray jsonArray = new JSONArray();

		Map<Integer, Map<String, String>> list = mySQL.MySQL_chaxun(sql);
		Iterator<?> it = list.entrySet().iterator();
		Entry<?, ?> entry = null;
		while (it.hasNext()) {
			entry = (Entry<?, ?>) it.next();
			jsonArray.add(entry.getValue());
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArray);
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
