package com.shoppingmall.personalcolor.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.personalcolor.command.m_orderprod.AddItemCommand;
import com.shoppingmall.personalcolor.command.m_orderprod.ProductDetailCommand;
import com.shoppingmall.personalcolor.command.m_orderprod.ShowCartCommand;
import com.shoppingmall.personalcolor.config.CartAppContext;
import com.shoppingmall.personalcolor.dto.OrderprodDto;
import com.shoppingmall.personalcolor.dto.ProductDto;

@Controller
public class OrderprodController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(CartAppContext.class);
	
	
	// header에서 productpage로 이동
	@RequestMapping(value="goProductPage.do", method=RequestMethod.GET)
	public String goProductPage() {
		return "m_orderprod/productPage";
	}
	
	//productpage에서 선택한 특정 상품 상세 페이지로 이동
	@RequestMapping(value="goProductDetailPage.do", method=RequestMethod.GET)
	public String goProductDetailPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		ProductDetailCommand productDetailCommand = ctx.getBean("productDetailCommand", ProductDetailCommand.class);
		productDetailCommand.execute(sqlSession, model);
		return "m_orderprod/productDetailPage";
	}
	
	//productDetailPage에서 넘어온 json타입의 상품 데이터를 장바구니에 담기 위한 메소드
	@RequestMapping(value="addItemToCart.do", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> addItemToCart(@RequestBody OrderprodDto orderprodDto, Model model) {
		model.addAttribute("orderprodDto", orderprodDto);
		AddItemCommand addItemCommand = ctx.getBean("addItemCommand", AddItemCommand.class);
		return addItemCommand.execute(sqlSession, model);
	}
	
	// 장바구니 버튼 클릭 시 로그인 된 회원 아이디에 맞는 장바구니 목록 가져오는 메소드
	@RequestMapping(value="showCart/{m_customer_id}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> showCart(@PathVariable("m_customer_id") String m_customer_id,
										Model model) {
		model.addAttribute("m_customer_id", m_customer_id);
		ShowCartCommand showCartCommand = ctx.getBean("showCartCommand", ShowCartCommand.class);
		return showCartCommand.execute(sqlSession, model);
	}
	
	
	
}
