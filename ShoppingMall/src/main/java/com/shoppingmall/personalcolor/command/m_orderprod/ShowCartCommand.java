package com.shoppingmall.personalcolor.command.m_orderprod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.shoppingmall.personalcolor.dao.CartDao;
import com.shoppingmall.personalcolor.dto.OrderprodDto;

public class ShowCartCommand {
	// 이 command는 Map을 반환해야 함으로 따로 만들어주었다. interface를 구현하지 않았다.
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		String m_customer_id = (String)map.get("m_customer_id");
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		List<OrderprodDto> list = cartDao.showCart(m_customer_id); 
		
		Map<String, Object> cartList = new HashMap<String, Object>();
		cartList.put("list", list);
		return cartList;
	}

}
