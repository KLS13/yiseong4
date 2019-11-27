package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex06_request")
public class Ex06_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Ex06_request() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("request 정보");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		//request 에 포함된 정보 확인하기
		// 1. request 에 포함된 정보는 "parameter(파라미터)"라고 부른다.
		// 2. "parameter"의 타입은 String 또는 String[] 중 하나이다.
		// 3. "parameter" 전달방식
		//호스트 이름 : 포트번호/컨텍스트패스/URLMapping?parameterName1=value1&parameterName2=value2
		// 4. "parameter" 정보를 확인하는 메소드
		//	1) getParameter()		: 파라미터 값을 1개 받을 때 < input type="text" name="uId" /> :  parmeter 이름이 "uId"  parameter 값은 "text"에 입력된 값
		//	2) getParameterValues() : 파라미터 값을 여러 개 받을때 < input type="checkbox" name="hobbies" value="movie" /> 영화 : parameter 이름 "hobbies"  값은 {"movie"}
		//	3) getParameterMap() 	: 파라미터 값이 map 형식(key-value)일 때
		//	4) getParameterNames()  : 파라미터 이름을 여러 개 받을 때 
		// 직접 url 에 파라미터 전달하는 방법으로 확인한다
		// http://localhost:9090/02_servlet/Ex06_request?name=앨리스&age=20
		String name = request.getParameter("name"); // 파라미터 name 에 저장된 값을 String name 에 저장한다.
		String age = request.getParameter("age");
		
		out.print("<h1>");
		out.print("전달된 이름은 " + name + "이고, ");
		out.print("나이는 " + age + "살 입니다.");
		out.print("</h1>");
		
		// 2. Ex06_request.html 에서 전달된 파라미터 확인
		String query = request.getParameter("query");
		out.print("<h1>");
		out.print("전달된 검색값은 " + query + "입니다. ");
	
		out.print("</h1>");
		
		out.print("</body>");
		out.print("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
