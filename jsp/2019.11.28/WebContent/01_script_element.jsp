<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>0 ~ 9 사이의 모든 정수 출력하기</h2>
	<% for ( int i = 0; i<10; i++) { %>
		 i <!-- HTML 영역에서는 자바 변수 i를 처리하지 못한다. -->	
	<% } %>

	<hr />
	<h2>0 ~ 9 사이의 모든 정수 출력하기</h2>
	<% for ( int i = 0; i<10; i++) { %>
		<%= i %>  <!-- 출력되어지는 곳은 표현식으로 변수값을 출력 -->	
	<%} %>
	
	<h2> 1~100 사이의 모든 정수의 합계를 구해서 출력하기 </h2>
	<%! int sum; %>
	<% for( int i =1; i<=100; i++) {
			sum += i; 
		}
	%>
	1~100사이의 합은 <%= sum %>  <br />
	
	<h2> 1~100 사이의 모든 짝수의 합계를 리턴하는 even() 메소드</h2>
	<%!
		public int even() {
			int total = 0; // 전역변수가 아니라서 따로 묶을 필요가 없음.
			for ( int i=1; i<=100; i++){
				if(i%2==0) {
					total += i;
				}
			}
			return total; 
		}
	%>
	1~100 사이 짝수의 합 = <%= even() %>
	
	
		<h2> 1~100 사이의 모든 홀수의 합계를 리턴없이 odd() 메소드</h2>
	<%!
		int odd_sum = 0; // 전역변수로 선언해야 HTML 영역에서 접근 가능
		public void odd() {
			
			for (int i=1; i<=100; i++) {
				if(i%2>0) {
					odd_sum += i;
				}
			}
			
		}
	%>
					<% odd(); %> <!-- 메소드 호출은 자바 코드로 처리한다. ! --> 
	1~100 사이 홀수의 합은 <%= odd_sum %> 
	
		 
	

		
</body>
</html>