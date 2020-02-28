package com.bc.mybatis;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//장바구니 역할 클래스
public class Cart {
	private List<ShopVO> list;
	private int total; //카트에 담긴 전체 제품 가격 합계 금액
	
	public Cart() {
		list = new ArrayList<ShopVO>();
	}

	public List<ShopVO> getList() { return list; }
	public int getTotal() { return total; }
	/** 
	 * 장바구니 담기 요청 처리(카트에 제품 추가)
	 * list에 없으면 제품 추가
	 * list에 동일한 제품이 있으면 수량만 하나 증가 처리
	 * @param p_num
	 * @param dao
	 * **/
	public void addProduct(String p_num, ShopDAO dao) {
		//카트에 제품이 있는지 확인
		ShopVO vo = findProduct(p_num);
		if(vo != null) { //카트에 있음 -> 수량 증가 처리 
			vo.setQuant(vo.getQuant() + 1);
			//2. 카트의 total 값 합산(제품 하나 가격 추가)
			total += vo.getP_saleprice();
			
			
		} else { //카트에 없음 -> 제품을 카트에 등록
			//1. p_num 조회해서 VO객체 만들기
			vo = dao.selectOne(p_num);
			//2. 수량 증가
			vo.setQuant(1);
			//3. 카트목록에 추가
			list.add(vo);
			//4. total값 계산(제품 하나 가격 추가)
			total += vo.getP_saleprice();
		}
	}
	
	//카트에 제품이 있는지 확인
	public ShopVO findProduct(String p_num) {
		ShopVO vo = null;
		//Iterator<ShopVO> ite = list.iterator();
		
		for(ShopVO listVO : list) {
		//while (ite.hasNext()) {
			//ShopVO listVO = ite.next();
			if(listVO.getP_num().equals(p_num)) { 
				vo = listVO;
				System.out.println("listVO ----------------: " + listVO);
				System.out.println("vo  ----------------: " + vo);
				break;
			}
		}
		System.out.println("vo  여기: " + vo);
		return vo;
	}
	
	/*
	public ShopVO findProduct(String p_num) {
		ShopVO vo = null;
		Iterator<ShopVO> ite = list.iterator();
		while (ite.hasNext()) {
			ShopVO listVO = ite.next();
			if (listVO.getP_num().equals(p_num)) {
				vo = listVO;
				break;
			}
		}
		//개선된 for문으로 작성(실습)
		
		return vo;
	}
	*/
	//해당 제품의 개수 바꾸기
	public void changeQuant(String p_num, int quant) {

		ShopVO vo = findProduct(p_num);
		if (vo == null) return;
		
		//1. 카트 합계금액 - 수량변경 전 제품 합계금액
		total = total - vo.getTotalprice();
		
		//2. 제품의 수량 변경
		vo.setQuant(quant);
		
		//3. 카트 합계 금액 _ 수량변경 후 제품 합계 금액
		total += vo.getTotalprice();
		
	}
	
	
	//목록(list)에 있는 제품 삭제 처리
	 public void delProduct(String p_num) {
		 ShopVO vo = findProduct(p_num);
		 System.out.println("DelProduct vo :" + vo);
		
		 if(vo != null) {
			 list.remove(vo);
			 
			 //카트의 전체제품가격에서 삭제된 제품금액 빼기
			 total = total - vo.getTotalprice();
		 } 
	 }
	
}
