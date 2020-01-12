package Test01;

public class GradeInfo {
	
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private Average average;
	
	public GradeInfo() {
		super();
	}
	
	public void printCalc() {
		average.Calc(kor, eng, mat);
	}
	
	public void printStudent() {
		System.out.println("이름 : " + name);
		System.out.println("국어 : " + kor);
		System.out.println("영어 : " + eng);
		System.out.println("수학 : " + mat);
		printCalc();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public Average getAverage() {
		return average;
	}

	public void setAverage(Average average) {
		this.average = average;
	}
	
}
