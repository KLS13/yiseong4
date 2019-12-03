package bean.dto;

public class Person {
	
	private String id;
	private String pw1;
	private String pw2;
	private String name;
	private String gender;
	private String phone;
	private int phone2;
	private int phone3;
	private String nickname;
	private String email;
	private String domain;
	private String[] hobbies;

	public Person() {
		
	}

	public Person(String id, String pw1, String pw2, String name, String gender, String phone, int phone2, int phone3,
			String nickname, String email, String domain, String[] hobbies) {
		super();
		this.id = id;
		this.pw1 = pw1;
		this.pw2 = pw2;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.nickname = nickname;
		this.email = email;
		this.domain = domain;
		this.hobbies = hobbies;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw1() {
		return pw1;
	}

	public void setPw1(String pw1) {
		this.pw1 = pw1;
	}

	public String getPw2() {
		return pw2;
	}

	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPhone2() {
		return phone2;
	}

	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}

	public int getPhone3() {
		return phone3;
	}

	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String[] getHobbies() {
		return hobbies;
	}

	public void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
	}
	
}
