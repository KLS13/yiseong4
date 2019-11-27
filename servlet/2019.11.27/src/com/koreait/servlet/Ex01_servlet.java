package com.koreait.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 실행
// 호스트이름 : 포트번호/프로젝트이름/서블릿
// 호스트이름 : 포트번호/컨텍스트패스/URLMapping
// URLMapping 의 기본 값은 서블릿 이름이다.
// 서블릿이름 = 본명
// URLMapping = 별명
// 예시  ::  localhost:9090/02_servlet/Ex01_servlet
// web.xel 을 열어서 추가된 태그를 확인하자

/**
 * Servlet implementation class Ex01_servlet
 */
@WebServlet("/Ex01_servlet")
public class Ex01_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	// 1.생성자
	// 생성자 호출 뒤 -> init() 메소드가 자동으로 호출된다.
    public Ex01_servlet() {
        super();  //슈퍼클래스 생성자 호출 
        System.out.println("생성자 호출");
        // TODO Auto-generated constructor stub
    }

    // 2. init() 메소드
    // 서블릿 생성 후 한번만 호출됨.
    // 초기화 용도로 사용한다.
    // init() 메소드 호출 뒤 -> service() 메소드가 자동으로 호출된다.
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
		// TODO Auto-generated method stub
	}
	// 3. serivce() 메소드
	// 매개변수-1 : HttpServletRequest request 
	// 요청 정보(웹 브라우저 -> 웹 서버)
	// 예) 로그인 시 "아이디", "비번" 입력 후 웹 서버에게 로그인 요청 -> request 에는 "아이디", "비번"이 모두 저장
	// 매개변수-2 : HttpServletRequest response
	// 응답 정보(웹 서버 -> 웹 브라우저)
	// 예) 검색 시 검색결과
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자 요청 정보 ( request )를 분석하여,
		// get 방식이면 doGet() 메소드를 호출하고 post 방식이면 doPost() 메소드를 호출하는 방식
		System.out.println("service() 호출");
		
		if ( request.getMethod().equalsIgnoreCase("get") ) {
			doGet(request, response);
		}else {
			doPost(request, response);
		}
	}

	// 4. doGet() 메소드
	// method를 지정하지 않거나, form의 메소드가 get인 경우 호출됨
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 필요한 작업은 여기서 이루어진다.
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// 5. doPost() 
	// 디폴트는 doGet() 으로 처리 흐름을 바꾸게 되어있다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 자신에게 전달된 request, response 정보를 다시 doGet() 메소드에 전달한다.
		doGet(request, response);
	}

	// 6. destroy()
	// 웹서버에서 어떤 프로젝트가 소멸(종료되면) destroy() 메소드가 호출
	public void destroy() {
		System.out.println("destory() 호출");
	}
}
