<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 관리 화면</title>
<script type="text/javascript">
	function saveSession() {
		location.href = "/03_jsp/07_02_session_save.jsp";
	}
	function removeSession() {
		location.href = "/03_jsp/07_02_session_remove.jsp";
	}
	function initSession() {
		location.href = "/03_jsp/07_02_session_init.jsp";
	}
</script>
</head>
<body>
	<h1>세션 관리하기</h1>
	<form>
		세션에 정보 저장하기 <input type="button" value="확인" onclick="saveSession()" /> <br />
		세션의 정보 삭제하기 <input type="button" value="확인" onclick="removeSession()" /> <br />
		세션의 정보 초기화하기 <input type="button" value="확인" onclick="initSession()" /> <br />
	</form>
	
	<%
		// 세션에 저장된 데이터 (이름, 나이) 확인하기
		String name = null;
		String age = null;
		
		if ( session.getAttribute("name") == null ) {
			name = "이름 없음";
		} else {
			name = (String)session.getAttribute("name");	// getAttribute()의 리턴타입은 Object이므로 반드시 캐스팅을 해야 한다.
		}
		
		if ( session.getAttribute("age") == null ) {
			age = "나이 없음";
		} else {
			age = (String)session.getAttribute("age");
		}
		
	%>

	<br /><hr />

	<h1>세션 확인하기</h1>
	<h3>세션에 저장된 이름 = <%=name %> </h3>
	<h3>세션에 저장된 나이 = <%=age %> </h3>
</body>
</html>