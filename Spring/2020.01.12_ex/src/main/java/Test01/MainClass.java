package Test01;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:context01.xml");
		GradeInfo info = ctx.getBean("grade1",GradeInfo.class);
		info.printStudent();
	}

}
