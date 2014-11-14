package weiyi;

import java.util.HashMap;
import java.util.Map;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MySQL mySQL = new MySQL();

		String sql = "";

		sql = "select pronum from productlist where pronum like 'ZBQ001'";

		System.out.println(mySQL.MySQL_chaxun(sql).size());
	}

}
