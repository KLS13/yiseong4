package com.koreait.mvc15.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.koreait.mvc15.command.BoardDeleteCommand;
import com.koreait.mvc15.command.BoardListCommand;
import com.koreait.mvc15.command.BoardModifyCommand;
import com.koreait.mvc15.command.BoardViewCommand;
import com.koreait.mvc15.command.BoardWriteCommand;
import com.koreait.mvc15.dao.BoardDao;

//나는 spring bean configuration file(appContext.xml) 과 같은 역할이야.

@Configuration
public class AnnoConfig {

	@Bean
	public BoardListCommand bList() { // ctx.getBean("bList", BoardListCommand.class)
		return new BoardListCommand();
	}
	
	@Bean
	public BoardViewCommand view() { // ctx.getBean("view", BoardViewCommand.class)
		return new BoardViewCommand();
	}
	
	@Bean
	public BoardWriteCommand write() { // ctx.getBean("write", BoardWriteCommand.class)
		return new BoardWriteCommand();
	}
	
	public @Bean BoardModifyCommand modify() { // ctx.getBean("modify", BoardModifyCommand.class)
		return new BoardModifyCommand();
	}
	
	public @Bean BoardDeleteCommand delete() { // ctx.getBean("delete", BoardDeleteCommand.class)
		return new BoardDeleteCommand();
	}
	
	public @Bean BoardDao bDao() { // ctx.getBean("bDao", BoardDao.class);
		return new BoardDao();
	}
	
}
