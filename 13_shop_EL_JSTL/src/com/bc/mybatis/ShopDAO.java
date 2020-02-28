package com.bc.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ShopDAO {
	private List<ShopVO> list;
	
	public ShopDAO() {
		System.out.println(">> ShopDAO객체 생성");
	}
	
	public List<ShopVO> list(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		list = ss.selectList("list", category);
		return list;
	}
	
	public ShopVO selectOne(String p_num) {
		SqlSession ss = DBService.getFactory().openSession();
		ShopVO vo = ss.selectOne("one", p_num);
		ss.close();
		return vo;
	}
}
