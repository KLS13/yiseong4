<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
    <h3>개인정보를 입력하세요.</h3><br />
    <form action="cookie_test2.jsp" method="post">
        <table>
            <tr>
                <td>아이디 :</td>
                <td><input type="text" name="id" /></td>
            </tr>
            <tr>
                <td>패스워드 : </td>
                <td><input type="password" name="pw" /></td>
            </tr>
            <tr>
                <td>이름 : </td>
                <td><input type="text" name="name" /></td>
            </tr>
        </table>
        <br /><br />
        <input type="submit" value="확인" />
    </form>
</body>
</html>