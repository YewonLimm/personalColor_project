package com.shoppingmall.personalcolor.dao;

import java.util.List;

import com.shoppingmall.personalcolor.dto.OrderprodDto;
import com.shoppingmall.personalcolor.dto.ProductDto;

public interface CartDao {

	// 상품 정보를 가져오는 메소드
	public ProductDto itemDetail(String m_product_code);
	
	// 해당 유져 ID로 저장되어 있고, 아직 주문하지 않은 M_ORDERPROD 정보가 있는e 지 확인하는 메소드
	// public int checkAlreadyExist(String m_customer_id);
	
	// 가져온 상품 정보를 토대로 M_ORDERPROD 테이블에 insert하기위한 메소드
	public int addItemToCart(String m_product_code, String m_customer_id, int m_orderprod_count, int m_product_price);
	
	public List<OrderprodDto> showCart(String m_customer_id); 
	
}	

