function checkPassword(){
	var pw1 = joinForm.user_password.value;
	var pw2 = joinForm.user_repassword.value;
	if(pw1 != pw2){
		alert('두 비밀번호가 일치하지 않습니다.');
		joinForm.user_password.value = "";
		joinForm.user_repassword.value = "";
	}
	else {
		joinForm.submit();
	}
}