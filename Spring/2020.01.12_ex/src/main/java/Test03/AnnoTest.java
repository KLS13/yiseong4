package Test03;

import java.util.HashSet;
import java.util.Set;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
@Configuration
public class AnnoTest {

		@Bean
		public Person person1() {
			Set<String> hobbies = new HashSet<String>();
			hobbies.add("운동");
			hobbies.add("게임");
			hobbies.add("코딩");
			
			Person person = new Person();
			person.setName("coco");
			person.setAge(25);
			person.setHobbies(hobbies);
			
			return person;
		
		}
		
		@Bean(name="person2")
		public Person sajdasjd() {
			Set<String> hobbies = new HashSet<String>();
			hobbies.add("오버워치");
			hobbies.add("롤");
			
			Person person = new Person();
			person.setName("lala");
			person.setAge(30);
			person.setHobbies(hobbies);
			
			return person;
		}

		@Bean
		public PersonInfo info() {
			
			Set<String> hobbies = new HashSet<String>();
			hobbies.add("거침없이 하이킥");
			hobbies.add("지붕뚫고 하이킥");
			hobbies.add("순풍산부인과");
			
			PersonInfo info = new PersonInfo();
			info.setPerson( new Person("강이성", 27, hobbies));
			
			return info;
			
		}

}
