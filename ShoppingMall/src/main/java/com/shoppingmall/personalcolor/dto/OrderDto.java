package com.shoppingmall.personalcolor.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {

	private int m_order_no;
	private String m_customer_id;
	private String m_order_name;
	private String m_order_phonenum;
	private String m_order_addr;
	private String m_order_payment;
	private Date m_order_date;
	private int m_order_totalprice; 
	private int m_order_depositprice;
	
}
