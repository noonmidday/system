<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%!String site = "";%>
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {

		for (int i = 0; i < cookies.length; i++) {

			if (cookies[i].getName().equals("site")) {
				site = cookies[i].getValue();
			}
		}
	}
%>
