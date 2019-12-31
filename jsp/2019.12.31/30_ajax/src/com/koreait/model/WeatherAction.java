package com.koreait.model;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WeatherAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String addr = "http://www.kma.go.kr/XML/weather/sfc_web_map.xml";
		URL url = null;
		HttpURLConnection conn = null;
		StringBuffer sb = new StringBuffer();
		InputStream is = null;
		BufferedReader br = null;
		String line = null;
		
		try {
			url = new URL(addr);
			conn = (HttpURLConnection)url.openConnection();
			is = conn.getInputStream();
			br = new BufferedReader(new InputStreamReader(is) );
			
			while(true) {
				line = br.readLine(); // 한줄씩 읽어서 line 에 저장
				if(line == null) { // 다 읽었음
					break;
				}
				sb.append(line);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(br != null) { br.close(); }
				if(is != null) { is.close(); }
				if(conn != null) { conn.disconnect(); }
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

}
