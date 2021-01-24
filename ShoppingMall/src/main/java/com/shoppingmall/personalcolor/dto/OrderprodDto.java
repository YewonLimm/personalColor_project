package com.shoppingmall.personalcolor.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderprodDto {

	private int m_orderprod_no;
	private int m_order_no;
	private String m_product_code;
	private String m_customer_id;
	private int m_orderprod_count;
	private int m_orderprod_price;
	private String m_orderprod_check;
	private String m_orderprod_reviewcheck;
	
	
}
