// 페이지 로드 이벤트
$(function(){
    // 1. 아이디 기억하기
    var saveId = getCookie("saveId"); // 저장된 쿠키값(saveId)을 가져와서 mId 입력상자를 채워 넣음
    $("#mId").val(saveId);

    if ($("#mId").val() != "") { // mId 입력상자가 이미 입력된 상태라면 예전에 '아이디 기억하기'를 체크한 상황
        $("#saveIdCheck").attr("checked", true); // 계속 '아이디 기억하기'를 체크 상태로 두기
    }
    $("#saveIdCheck").change(function() { // '아이디 기억하기' 상태값에 변화가 생기면
        if ($("#saveIdCheck").is(":checked")) { // 1) 체크한 경우
            setCookie("saveId", $("#mId").val(), 7); // 7일간 쿠키에 보관하는 setCookie() 함수 호출
        } else { // 2) 체크 해제한 경우
            deleteCookie("saveId"); // 쿠키를 삭제하는 deleteCookie() 함수 호출 
        }
    });
    $("#mId").keyup(function() { // mId 값을 입력할 때
        if ($("#saveIdCheck").is(":checked")) { // '아이디 기억하기'를 체크했다면
            setCookie("saveId", $("#mId").val(), 7); // 7일간 쿠키에 보관하는 setCookie 호출
        }
    });
});
// 1. 쿠키 만들기
function setCookie( cookieName, value, exdays ) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
// 2. 쿠키 삭제
function deleteCookie( cookieName ) {
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
// 3. 쿠키 가져오기
function getCookie( cookieName ) {
    cookieName = cookieName + "=";
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = "";
    if ( start != -1 ){
        start += cookieName.length;
        var end = cookieData.indexOf(";", start);
        if(end == -1) {
            end = cookieData.length;
        }
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}