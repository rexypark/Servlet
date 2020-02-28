package com.bc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.GuestbookVO;
import com.bc.mybatis.DBService;

public class GuestbookDAO {

	public static List<GuestbookVO> getAllList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<GuestbookVO> list = ss.selectList("all");
		ss.close();
		System.out.println("list : " + list);
		return list;
	}
	public static int updateWirte(GuestbookVO guestVO) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		int isUpdate = ss.insert("writeInsert", guestVO);
		return isUpdate;
	}
	
}
