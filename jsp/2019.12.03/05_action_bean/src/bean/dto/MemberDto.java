package bean.dto;

public class MemberDto {

		private String id;
		private String pw;
		private String name;
		private String age;
		private String addr;
		private String gender;
		private String[] hobbies;
		private String like;
		private String[] hate;
		
		public MemberDto() {
			
		}

		public MemberDto(String id, String pw, String name, String age, String addr, String gender, String[] hobbies,
				String like, String[] hate) {
			super();
			this.id = id;
			this.pw = pw;
			this.name = name;
			this.age = age;
			this.addr = addr;
			this.gender = gender;
			this.hobbies = hobbies;
			this.like = like;
			this.hate = hate;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getPw() {
			return pw;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAge() {
			return age;
		}

		public void setAge(String age) {
			this.age = age;
		}

		public String getAddr() {
			return addr;
		}

		public void setAddr(String addr) {
			this.addr = addr;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String[] getHobbies() {
			return hobbies;
		}

		public void setHobbies(String[] hobbies) {
			this.hobbies = hobbies;
		}

		public String getLike() {
			return like;
		}

		public void setLike(String like) {
			this.like = like;
		}

		public String[] getHate() {
			return hate;
		}

		public void setHate(String[] hate) {
			this.hate = hate;
		}
			
		
}
