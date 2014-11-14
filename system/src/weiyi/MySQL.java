package weiyi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

public class MySQL {
	ResourceBundle rb = ResourceBundle.getBundle("weiyi.db");
	String mysql_url = rb.getString(("mysql_url"));
	String mysql_database = rb.getString("mysql_database");
	String mysql_username = rb.getString("mysql_username");
	String mysql_password = rb.getString("mysql_password");

	public boolean MySQL_no_chaxun(String sql) {
		Connection con = null;
		PreparedStatement pst = null;
		boolean status = false;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			// 221.237.8.43
			// "+zonghe.mysql_url+"
			// jdbc:mysql://192.168.1.108:3306/article?useUnicode=true&characterEncoding=utf8
			con = DriverManager.getConnection("jdbc:mysql://" + mysql_url + "/"
					+ mysql_database
					+ "?useUnicode=true&characterEncoding=utf8",
					mysql_username, mysql_password);
			pst = con.prepareStatement(sql);

			int rs = pst.executeUpdate();
			if (rs >= 1) {
				status = true;
				System.out.println(sql + " cheng gong !");
			} else {
				status = false;
				System.out.println(sql + " shi bai !");
			}
		} catch (Exception e) {
			e.printStackTrace();
			status = false;
			if (con != null) {
				try {
					con.rollback();
					con.setAutoCommit(true);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					status = false;
				}
			}
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				status =false;
			}
		}
		return status;
	}

	public Map<Integer, Map<String, String>> MySQL_chaxun(String sql) {
		Map<Integer, Map<String, String>> list = new HashMap<Integer, Map<String, String>>();
		Map<String, String> info = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResultSetMetaData data = null;
		try {
			// System.out.println("login 验证中 ...");
			Class.forName("com.mysql.jdbc.Driver");
			// 221.237.8.43
			// mysqldsbbs.simplesunlock.com
			// jdbc:mysql://192.168.1.108:3306/article?useUnicode=true&characterEncoding=utf8
			con = DriverManager
					.getConnection(
							"jdbc:mysql://"
									+ mysql_url
									+ "/"
									+ mysql_database
									+ "?useUnicode=true&characterEncoding=utf8&relaxAutoCommit=true&zeroDateTimeBehavior=convertToNull",
							mysql_username, mysql_password);
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			data = rs.getMetaData();
			int columncount = 1;
			int count = 0;
			columncount = data.getColumnCount();
			// System.out.println("columncount:" + columncount);
			while (rs.next()) {
				info = new HashMap<String, String>();
				for (int i = 1; i <= columncount; i++) {
					// if (i == 35) {
					// continue;
					// }
					// System.out.println("字段名:" + data.getColumnName(i));
					// try {

					if (data.getColumnType(i) == 93) {
						info.put(data.getColumnName(i) + "", rs.getTimestamp(i)
								+ "");
					} else {
						info.put(data.getColumnName(i) + "", rs.getString(i)
								+ "");
					}

				}
				list.put(count, info);
				count++;
			}

		} catch (Exception e) {
			e.printStackTrace();
			list = null;
			if (con != null) {
				try {
					con.rollback();
					con.setAutoCommit(true);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					list = null;
				}

			}
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				list = null;
			}
		}

		return list;
	}

	public Map<String, String> MySQL_chaxun_test(String sql) {
		Map<String, String> list = new HashMap<String, String>();
		sql = "SELECT SKU,cost_all,profit FROM `amazondata`";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResultSetMetaData data = null;

		String sku = "";
		float cost_all = 0.0f;
		float profit = 0.0f;
		float lirunlv = 0.0f;
		try {
			// System.out.println("login 验证中 ...");
			Class.forName("com.mysql.jdbc.Driver");
			// 221.237.8.43
			// mysqldsbbs.simplesunlock.com
			// jdbc:mysql://192.168.1.108:3306/article?useUnicode=true&characterEncoding=utf8
			con = DriverManager.getConnection("jdbc:mysql://" + mysql_url + "/"
					+ mysql_database
					+ "?useUnicode=true&characterEncoding=utf8",
					mysql_username, mysql_password);
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				cost_all = rs.getFloat("cost_all");
				profit = rs.getFloat("profit");
				sku = rs.getString("SKU");
				lirunlv = profit / (cost_all + profit);
				if (lirunlv >= 0.4) {
					list.put(sku, lirunlv + "");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();

			if (con != null) {
				try {
					con.rollback();
					con.setAutoCommit(true);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();

				}

			}
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		return list;

	}
}
