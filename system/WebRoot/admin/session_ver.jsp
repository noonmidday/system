<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String shouye = "";
	Cookie[] cookies1 = request.getCookies();
	if (cookies1 != null) {
		for (int i = 0; i < cookies1.length; i++) {

			if (cookies1[i].getName().equals("site")) {
				shouye = cookies1[i].getValue();
			}
		}
	}
	if (session.getAttribute("username") == null) {
		response.sendRedirect(shouye);
		return;
	}
%>