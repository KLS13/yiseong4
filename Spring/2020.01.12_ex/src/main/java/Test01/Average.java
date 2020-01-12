package Test01;

public class Average {
	
	private int score1;
	private int score2;
	private int score3;
	
	public Average() { }
	
	public void Calc(int kor, int eng, int mat) { 

		double avg = (kor+eng+mat)/3.0;
		char grade;
				
		if( avg > score1) {
			grade = 'A';
		}
		if( avg > score2) {
			grade = 'B';
		}
		if( avg > score3) {
			grade = 'C';
		}else{
			grade = 'D';
		}
		System.out.println("평균 : " + avg);
		System.out.println("등급 : " + grade);
 	}

	public int getScore1() {
		return score1;
	}

	public void setScore1(int score1) {
		this.score1 = score1;
	}

	public int getScore2() {
		return score2;
	}

	public void setScore2(int score2) {
		this.score2 = score2;
	}

	public int getScore3() {
		return score3;
	}

	public void setScore3(int score3) {
		this.score3 = score3;
	}
	
	
}
