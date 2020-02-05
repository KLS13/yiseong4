package com.bcgbcg.br.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.QnaDao;
import com.bcgbcg.br.dto.BCDto;

public class BookChartListCommand implements BookChartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		QnaDao qdao = sqlSession.getMapper(QnaDao.class);
		
		BCDto bcdto = qdao.bookChartList();
		model.addAttribute("bcdto", bcdto);

	}

}
