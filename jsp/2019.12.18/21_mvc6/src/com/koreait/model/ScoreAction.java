package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ScoreAction {

	public String logic(HttpServletRequest request) {
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		
		double avg = (double)(kor+eng+mat)/3.0;
		String grade;
		
		if(avg >= 90 ) {
			grade = "A학점";
		}else if(avg >= 80) {
			grade = "B학점";
		}else if(avg >= 70) {
			grade = "C학점";
		}else if(avg >= 60) {
			grade = "D학점";
		}else {
			grade = "F학점";
		}
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("kor", kor);
		session.setAttribute("eng", eng);
		session.setAttribute("mat", mat);
		session.setAttribute("avg", avg);
		session.setAttribute("grade", grade);
		return "view/output.jsp";
	}
}
