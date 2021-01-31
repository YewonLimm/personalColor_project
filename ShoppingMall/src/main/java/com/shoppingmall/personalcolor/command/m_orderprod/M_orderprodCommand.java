package com.shoppingmall.personalcolor.command.m_orderprod;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface M_orderprodCommand {

	public void execute(SqlSession sqlSession, Model model);
	
}
