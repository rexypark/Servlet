
package com.bc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.MemberVO;
import com.bc.mybatis.DBService;

public class MemberDAO {

	public static List<MemberVO> getList() {
		SqlSession ss = DBService.getFactory().openSession(true);
		
		List<MemberVO> list = ss.selectList("all");
		ss.close();
		
		return list;
	}
	
}
