<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>API</title>
</head>

<body>
    <h1>책 제목을 검색해주세요.</h1>
    <input id="bookName" type="text">
    <button id="search">검색</button>
    <p></p>

    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
    </script>

    <script>
        $(function () {

            $("#search").click(function () {

                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book?target=title", // 전송 주소
                    data: { query: $("#bookName").val() }, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {     
                    	for(var i = 0; i<10 ; i++) {
                        $("p").append("<img src='" + msg.documents[i].thumbnail + "'><br />");
                        $("p").append("<strong>" + msg.documents[i].title + "</strong><br />");
                        $("p").append("<strong>" + msg.documents[i].authors + "</strong><br />");
                        $("p").append("<strong>" + msg.documents[i].price + "</strong><br />");
                        $("p").append("<strong>" + msg.documents[i].status + "</strong><br />");
                        $("p").append("<strong>" + msg.documents[i].datetime + "</strong><br />");
                        $("p").append("<strong>" + msg.documents[i].isbn + "</strong><br />");
                      
                    	}
                    });
            })
        });

    </script>
</body>

</html>