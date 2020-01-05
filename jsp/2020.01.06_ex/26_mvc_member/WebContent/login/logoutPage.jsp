<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if ( confirm("로그아웃 하시겠습니까?") ) {
		location.href = "/26_mvc_member/logout.do";
	} else {
		history.back();
	}
</script>