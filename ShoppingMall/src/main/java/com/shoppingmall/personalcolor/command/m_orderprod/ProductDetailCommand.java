package com.shoppingmall.personalcolor.command.m_orderprod;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.shoppingmall.personalcolor.dao.CartDao;

public class ProductDetailCommand implements M_orderprodCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String m_product_code = request.getParameter("m_product_code");
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		model.addAttribute("productDto", cartDao.itemDetail(m_product_code));
		
	}

}
