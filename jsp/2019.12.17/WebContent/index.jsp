<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.koreait.mybatis.BDto"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시판</title>
<style type="text/css">
	div {
		width: 700px;
		margin: auto;
		text-align: center;
	}
	table {
		width: 700px;
		border-collapse: collapse;
	}
	th {
		background: dodgerblue;
	}
	td, th {
		border: 1px solid black;
		padding: 5px;
	}
	th:nth-of-type(1) {
		width: 50px;
	}
	th:nth-of-type(2) {
		width: 300px;
	}
	th:nth-of-type(3) {
		width: 100px;
	}
	th:nth-of-type(4) {
		width: 180px;
	}
	th:nth-of-type(5) {
		width: 70px;
	}
	a.view {
		text-decoration: none;
		color: black;
	}
	a.view:hover {
		font-weight: bold;
	}
	ul.paging {
		list-style-type: none;
		overflow: hidden;
	}
	ul.paging li {
		float: left;
		margin: 10px;

	}
	
	ul.paging li a {
		padding: 3px 7px;
		display: block;
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	ul.paging li a:hover {
		background-color: limegreen;
		font-size : x-large;
		font-weight: bold;
	}
	ul.paging li.disable {
		color: silver;
	}
	ul.paging li.now {
		border: 2px solid red;
		background-color: pink;
		color: white;
		font-size : x-large;
		font-weight: bold;
	}
</style>
</head>
<body>

	<%
		// 변수 선언
		int totalRecord = 0;	// 전체 게시물의 개수
		int recordPerPage = 3;	// 한 페이지에 표시할 게시물의 개수
		int totalPage = 0;		// 전체 페이지의 개수
		int nowPage = 0;		// 현재 페이지 번호
		int begin = 0;			// 현재 페이지에 표시할 시작 게시물의 번호
		int end = 0;			// 현재 페이지에 표시할 종료 게시물의 번호
		
		
		// 1. bbs_t 테이블의 전체 게시물 개수 구하기
		BDao bdao = BDao.getInstance();	// BDao 의 factory 생성   new가 아니라  ~ 
		totalRecord = bdao.getTotalRecord();
		
		// 2. 전체 게시물 개수를 알면 전체 페이지 수를 알 수 있다.
		totalPage = totalRecord / recordPerPage;
		if ( totalRecord % recordPerPage != 0 ) {
			totalPage++;
		}
		
		// 3. 현재 페이지 번호(nowPage) 구하기
		//	1) 항상 현재 페이지 번호를 파라미터(currentPage)로 받는다. (request)
		//	2) 처음으로 목록을 연 경우는 파라미터를 받지 않고,
		//		1 페이지로 처리한다.
		String currentPage = request.getParameter("currentPage");
		if ( currentPage == null ) {
			nowPage = 1;
			currentPage = "1";
		} else {
			nowPage = Integer.parseInt(currentPage);
		}
		
		// 4. 현재 페이지 번호를 알면 begin 과 end 를 알 수 있다.
		// nowPage		begin		end
		// 1			1			3
		// 2			4			6
		// 3			7			9
		begin = (nowPage - 1) * recordPerPage + 1;
		end = begin + recordPerPage - 1;
		
		// 5. bbs_t 테이블에서 begin 부터 end 까지 게시물 가져오기
		// getList() 메소드에 begin + end 로 구성된 파라미터 전달이 필요하다.
		// begin 과 end 를 하나의 파라미터로 만들기 위해서 Map 을 사용한다.
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		// BDao 의 getList() 호출
		List<BDto> list = bdao.getList(map);	// map(begin, end)에 저장된 게시물을 가져온다.
		pageContext.setAttribute("list", list);	// EL 사용을 위해서
	%>

	<%
		// 게시물이 열린 경우 session 에 open 속성이 "YES" 값이 저장되는데
		// session 에 open 속성이 있는 경우에는
		// session 에서 open 속성 값을 삭제해야 한다.
		String open = (String)session.getAttribute("open");
		if ( open != null ) {
			session.removeAttribute("open");
		}
	%>

	<div>
		<h1>BBS 게시판</h1>
		<form action="insert_page.jsp">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="bdto" items="${list }">
								<tr>
									<td>${bdto.b_idx }</td>
									<td><a href="view.jsp?b_idx=${bdto.b_idx }&currentPage=<%=currentPage %>" class="view">${bdto.title }</a></td>
									<td>${bdto.writer }</td>
									<td>${bdto.reg_date }</td>
									<td>${bdto.hit }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<!-- 페이징 처리 -->
							<ul class="paging">
								<%
									// 변수 선언
									int pagePerBlock = 5;	// 한 블록에 포함되는 페이지 수 ( 1블록 : 1  2  3 , 2블록 : 4  5  6 )
									int totalBlock = 0;		// 전체 블록 수
									int beginBlock = 0;		// 블록의 시작 페이지
									int endBlock = 0;		// 블록의 종료 페이지
									
									// block		beginBlock		endBlock
									// 1			1				3
									// 2			4				6
									// 3			7				9
									
									// 1. 현재 페이지 번호(nowPage)를 알면 블록의 번호를 알 수 있다.
									beginBlock = ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
									endBlock = beginBlock + pagePerBlock - 1;
									
									// 주의사항
									// 상황 : 전체 페이지 1, 블록 시작은 1, 블록 종료는 3 => 2, 3 페이지가 불필요하므로 표시할 필요가 없다.
									// 블록 종료 > 전체 페이지 이면, 블록 종료는 전체 페이지로 지정한다.
									if ( endBlock > totalPage ) {
										endBlock = totalPage;
									}
									
									// 2. 이전 버튼
									// 이전 버튼이 비활성화되는 경우는? 1~3 페이지를 표시하는 경우
									if ( beginBlock < pagePerBlock ) { %>
										<li class="disable">이전</li> <%
									} else { %>
										<li><a href="index.jsp?currentPage=<%=beginBlock - 1 %>">이전</a></li> <%
									} %>
									<%
									// 3. 페이지 번호
									// 현재 페이지 번호인 경우 링크 X
									// 다른 페이지 번호인 경우 링크 O
									for ( int i = beginBlock; i <= endBlock; i++ ) {
										if ( nowPage == i ) { %>
											<li class="now"><%=i %></li> <%
										} else { %>
											<li><a href="index.jsp?currentPage=<%=i %>"><%=i %></a></li> <%
										}
									} %>
								<%
									// 4. 다음 버튼
									// 다음 버튼이 비활성화되는 경우는? 전체 페이지 수가 endBlock 이하인 경우
									if ( totalPage <= endBlock ) { %>
										<li class="disable">다음</li> <%
									} else { %>
										<li><a href="index.jsp?currentPage=<%=beginBlock + pagePerBlock %>">다음</a></li> <%
									} %>
							</ul>
						</td>
					</tr>
				</tfoot>
			</table>
			<p>
				<input type="submit" value="게시글 작성하기" />
				
				<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
				<input type="hidden" name="currentPage" value="<%=currentPage %>" />
			</p>
		</form>
	</div>

</body>
</html>