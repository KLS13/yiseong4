package com.koreait.captcha;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class CheckCaptcha
 */
@WebServlet("/check.do")
public class CheckCaptcha extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CheckCaptcha() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			/******* 사용자 입력값 검증 요청 *********/
		
			String clientId = "1S0MXEyYjbRIgfkpKQLn";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "OLQ2Wgsoua";//애플리케이션 클라이언트 시크릿값";
	        
	        // 발급 받은 캡차 키는 session 에 저장되어 있다. 
	        HttpSession session = request.getSession();
	        String key = session.getAttribute("key").toString(); // 캡차 키 발급시 받은 키값
	        
	        // 사용자는 캡차 이미지 글자를 name="input"으로 전달한다.
	        request.setCharacterEncoding("utf-8"); // 사실 불필요
	        String value = request.getParameter("input"); // 사용자가 입력한 캡차 이미지 글자값
	        
	        try {
	            String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
	            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;

	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer sb = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	            	sb.append(inputLine);
	            }
	            br.close();
	            System.out.println(sb.toString());
	            
	            // sb.toString()
	            // 검증 실패  {"result":false,"errorMessage":"Invalid key.","errorCode":"CT001"}
	            // 검증 성공  {"result":true,"responseTime":18.0}
	            
	            // String -> JSONObject 객체
	            JSONParser parser = new JSONParser();
	            JSONObject obj = (JSONObject)parser.parse(sb.toString());
	            
	            // 다음 view 에게 result, responseTime 전달하기 위해 request 에 저장
	            request.setAttribute("result", (boolean)obj.get("result"));
	            request.setAttribute("responseTime", (double)obj.get("responseTime"));
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
			
	        // 이동
	        request.getRequestDispatcher("result.jsp").forward(request, response);
			
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
