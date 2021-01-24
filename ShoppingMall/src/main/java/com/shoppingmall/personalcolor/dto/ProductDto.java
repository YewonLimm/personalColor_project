package com.shoppingmall.personalcolor.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductDto {

	private String m_product_code;
	private String m_seasontone_category;
	private int m_product_category;
	private String m_product_name;
	private String m_product_color;
	private int m_product_price;
	private int m_product_discount;
	private int m_product_inventory;
	private Date m_product_regdate;
	private String m_product_image;
	
}
