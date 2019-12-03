package bean;

/*
 * VO (Value Object) == DTO (Data Transfer Object)
 * 1. DB와 통신하기 위해서 하나의 레코드를 하나의 객체로 생성하는 것
 * 2. 필드는 DB테이블의 필드와 같은 이름을 사용
 */

public class PersonVo {
	
	// 필드
	private String name;
	private int age;
	private double height;
	private String addr;
	
	//생성자
	public PersonVo() {
		
	}

	public PersonVo(String name, int age, double height, String addr) {
		super();
		this.name = name;
		this.age = age;
		this.height = height;
		this.addr = addr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
}
