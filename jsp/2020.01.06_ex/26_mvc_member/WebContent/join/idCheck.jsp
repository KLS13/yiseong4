<%@page import="com.koreait.dto.MemberDto"%>
<%@page import="com.koreait.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = mDao.getMemberBymId(mId);
		
		//EL 사용을 위해서
		request.setAttribute("mDto", mDto);
		request.setAttribute("mId", mId);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript">
	// 아이디 사용 가능한 경우
	function useId() {
		// joinPage.jsp 에서 idCheck.jsp 를 open한 경우
		// idCheck.jsp 는 joinPage.jsp 를 opener 라 한다.
		opener.joinForm.mId.value = "${mId}";
		close();
		opener.joinForm.mPw.focus();
	}
	// 아이디 사용이 불가능한 경우 ( 중복확인 다시 )
	function idCheck( f ) {
		// 팝업창 방식의 중복 체크
		if( f.mId.value == "") {
			alert("아이디를 먼저 입력해주세요.");
			f.mId.focus();
			return;
		}
		f.action = "/26_mvc_member/join/idCheck.jsp";
		f.submit();
	}
</script>
</head>
<body>
	
	<div style="text-align : center;">
		<form method="post">
			<c:choose>
				<c:when test="${mDto eq null}">
					${mId}은 사용 가능한 아이디입니다.
					<br /><br />
					<input type="button" value="아이디 사용하기" onclick="useId()" />
				</c:when>
				<c:otherwise>
					${mId}은 이미 사용 중인 아이디입니다.
					<br /><br />
					아이디 : <input type="text" name="mId" />
					<input type="button" value="중복 확인" onclick="idCheck(this.form)" />
				</c:otherwise>
			</c:choose>
		</form>
	</div>
</body>
</html>