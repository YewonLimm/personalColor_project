package com.shoppingmall.personalcolor.command.m_orderprod;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.shoppingmall.personalcolor.dao.CartDao;
import com.shoppingmall.personalcolor.dto.OrderprodDto;
import com.shoppingmall.personalcolor.dto.ProductDto;

public class AddItemCommand {
	// 이 command는 Map을 반환해야 함으로 따로 만들어주었다. interface를 구현하지 않았다.
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		OrderprodDto orderprodDto = (OrderprodDto)map.get("orderprodDto");
		
		String m_product_code = orderprodDto.getM_product_code();
		String m_customer_id = orderprodDto.getM_customer_id();
		int m_orderprod_count = orderprodDto.getM_orderprod_count();
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		// 상품 정보를 일단 가져온다.
		ProductDto productDto = cartDao.itemDetail(m_product_code);
		// 상품의 가격을  productDto에서 빼온다.
		int m_product_price = productDto.getM_product_price();
		
		int addCartResult = cartDao.addItemToCart(m_product_code, m_customer_id, m_orderprod_count, m_product_price);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("addCartResult", addCartResult);
		return result;
	}

}
