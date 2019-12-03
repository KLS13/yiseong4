<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	.wrap {
		width: 600px;
		margin: auto;
	}
	.wrap > h1 {
		color: limegreen;
	}
	.centered {
		text-align: center;
	}
	table {
		width: 100%;
	}
	table, th {
		border-collapse: collapse;
		border-color: gray;
		border-style: solid;
		border-width: 2px 0;
	}
	th {
		background-color: lightgray;
	}
	td, th {
		padding: 10px;
	}
</style>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<%
		// "save_id" 쿠키 확인
		Cookie[] cookieBox = request.getCookies();
		String id = null;
		
		if ( cookieBox != null && cookieBox.length > 0 ) {
			for ( int i = 0; i < cookieBox.length; i++ ) {
				if ( cookieBox[i].getName().equals("save_id") ) {
					id = cookieBox[i].getValue();
					break;
				}
			}
		}
	%>
	
	<div class="wrap">
		<h1 class="centered">회원가입 폼</h1>
		<form action="join_check.jsp" method="post">
			<table>
				<tr>
					<th colspan="2">필수정보</th>
				</tr>
				<tr>
					<td><label for="userId">아이디</label></td>
					<td><% if ( id == null ) { %>
					<input type="text" name="id" id="userId" size="40" maxlength="30" autofocus />
					<% }else { %>
					<input type="text" name="id" id="userId" size="40" maxlength="30" value="<%= id %>" autofocus />
					<% } %>
					<input type="checkbox" name="save_id" /> 아이디 저장
					</td>
				</tr>
				<tr>
					<td><label for="userPw">비밀번호</label></td>
					<td><input type="password" name="pw1" id="userPw" size="40" maxlength="30" /></td>
				</tr>
				<tr>
					<td><label for="userPw2">비밀번호확인</label></td>
					<td><input type="password" name="pw2" id="userPw2" size="40" maxlength="30" /></td>
				</tr>
				<tr>
					<td><label for="userName">이름</label></td>
					<td><input type="text" name="name" id="userName" size="40" maxlength="30" /></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" id="man" name="gender" value="남" checked /><label for="man">남자</label>&nbsp;
						<input type="radio" id="woman" name="gender" value="여" /><label for="woman">여자</label>
					</td>
				</tr>
				<tr>
					<td><label for="userContact">연락처</label></td>
					<td>
						<select id="userContact" name="phone">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						-<input type="number" name="phone2" maxlength="4" />
						-<input type="number" name="Phone3" maxlength="4" />
					</td>
				</tr>
				<tr>
					<th colspan="2">선택정보</th>
				</tr>
				<tr>
					<td><label for="nickName">닉네임</label></td>
					<td><input type="text" name="nickname" id="nickName" size="40" maxlength="30" /></td>
				</tr>
				<tr>
					<td><label for="email1">이메일</label></td>
					<td>
						<input type="text" name="email" id="email1" size="20" maxlength="20" />
						@
						<select name="domain" id="domain">
							<option value="naver.com"> naver.com</option>
							<option value="gmail.com"> gmail.com</option>
							<option value="daum.net"> daum.net</option>
							<option value="nate.com"> nate.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미 활동</td>
					<td>
						<input type="checkbox" name="hobbies" id="reading" checked /><label for="reading">독서</label>
						<input type="checkbox" name="hobbies" id="fishing" /><label for="fishing">낚시</label>
						<input type="checkbox" name="hobbies" id="swim" /><label for="swim">수영</label>
						<input type="checkbox" name="hobbies" id="game" /><label for="game">게임</label>
					</td>
				</tr>
			</table>
			<br />
			<div class="centered">
				<input type="submit" value="회원가입" />
				<input type="reset" value="다시작성" />
			</div>
		</form>
	</div>
</body>
</html>