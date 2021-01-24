package com.shoppingmall.personalcolor.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.shoppingmall.personalcolor.command.m_orderprod.AddItemCommand;
import com.shoppingmall.personalcolor.command.m_orderprod.ProductDetailCommand;
import com.shoppingmall.personalcolor.command.m_orderprod.ShowCartCommand;

@Configurable
public class CartAppContext {

	@Bean
	public ProductDetailCommand productDetailCommand() {
		return new ProductDetailCommand();
	}
	
	@Bean
	public AddItemCommand addItemCommand() {
		return new AddItemCommand();
	}
	
	@Bean
	public ShowCartCommand showCartCommand() {
		return new ShowCartCommand();
	}
	
}
