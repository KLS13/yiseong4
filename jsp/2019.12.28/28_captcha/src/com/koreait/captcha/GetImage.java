package com.koreait.captcha;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class GetImage
 */
@WebServlet("/getImage.do")
public class GetImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetImage() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			/******* 캡차 키 발급 요청 *********/
			//각자 오픈 API 사용 신청으로 받은 id, secret
		   String clientId = "1S0MXEyYjbRIgfkpKQLn";//애플리케이션 클라이언트 아이디값";
	       String clientSecret = "OLQ2Wgsoua";//애플리케이션 클라이언트 시크릿값";
	        
	        try {
	            String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
	            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
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
	            System.out.println(sb.toString()); // sb.toString() --> {"key":"zoTSMmJeHa25uyAh"} JSON 형식의 자바String임.
		        //sb.toString() : JSON 형식의 자바 String
		        //JSONParser 를 통해서 parse() 메소드를 호출하고 JSONObject 객체를 생성한다
		        JSONParser parser = new JSONParser();
		        JSONObject obj = (JSONObject)parser.parse(sb.toString());
		        //생성된 JSONObject 객체의 get("key") 메소드를 호출하면 key 값("zoTSMmJeHa25uyAh")을 구한다.
		        // session 에 key 값 저장
		        HttpSession session = request.getSession();
		        session.setAttribute("key", obj.get("key")); // session.setAttribute("key", "zoTSMmJeHa25uyAh") 
	            
		        
		        /***** 캡챠 이미지 요청 *****/
		        
		        String key = (String)obj.get("key"); // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
	            apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
	            url = new URL(apiURL);
	            con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            responseCode = con.getResponseCode();
	            if(responseCode==200) { // 정상 호출
	                InputStream is = con.getInputStream();
	                int read = 0;
	                byte[] bytes = new byte[1024];
	                // 랜덤한 이름으로  파일 생성
	                String tempname = Long.valueOf(new Date().getTime()).toString();
	                
	                // upload 폴더로 파일 저장 경로 지정
	                // realPath 를 알아내자
	                String realPath = request.getServletContext().getRealPath("/upload");
	                
	                
	                // realPath 를 반영하도록 File 경로 변경
	                File f = new File(realPath + "/" + tempname + ".jpg");
	                f.createNewFile();
	                OutputStream os = new FileOutputStream(f);
	                while ((read =is.read(bytes)) != -1) {
	                    os.write(bytes, 0, read);
	                }
	                is.close();
	                os.close();
	                
	                // 다른 view에서 발급받은 이미지를 보여주려면
	                // tempname을 전달해줘야한다.
	                request.setAttribute("tempname", tempname + ".jpg");
	                
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	               
	                sb = new StringBuffer();
	                while ((inputLine = br.readLine()) != null) {
	                    sb.append(inputLine);
	                }
	                br.close();
	                System.out.println(sb.toString());
	            	}

	        	} catch (Exception e) {
	        		System.out.println(e);
	        	}
	        // 이동
	        request.getRequestDispatcher("loginPage.jsp").forward(request, response);
	        

		}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
