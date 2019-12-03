<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	Cookie cookie = null;
	String save_id = request.getParameter("save_id");
	String id = request.getParameter("id");
	
	// 아이디 기억하기를 체크했다면
	if ( save_id != null ) {
		cookie = new Cookie("save_id", id);
		cookie.setMaxAge(24 * 60 * 60);
		response.addCookie(cookie);
	}
	// 아이디 기억하기를 체크하지 않았다면
	else {
		// 기존에 만들어진 "save_id" 쿠키 확인 후 삭제
		Cookie[] cookieBox = request.getCookies();
		if ( cookieBox != null && cookieBox.length > 0 ) {
			for ( Cookie ck : cookieBox ) {
				if ( ck.getName().equals("save_id") ) {
					Cookie bisket = new Cookie("save_id", "");
					bisket.setMaxAge(0);
					response.addCookie(bisket);
					break;
				}
			}
		}
	}
	request.getRequestDispatcher("join_useBean.jsp").forward(request, response);
	
%>