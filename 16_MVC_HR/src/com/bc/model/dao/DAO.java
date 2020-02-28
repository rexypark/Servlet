package com.bc.model.dao;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;

public class DAO {
	
	//직원 전체 목록 조회 resultType : VO
	public static List<EmployeeVO> getList() {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<EmployeeVO> list = ss.selectList("list");
		ss.close();
		return list;
	}
	//부서번호로 해당 부서번호 목록조회
	public static List<EmployeeVO> getDeptList(String deptno) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<EmployeeVO> list = ss.selectList("deptList", deptno);
		
		return list;
	}
	
	//이름으로 해당 부서번호 목록조회
	public static List<EmployeeVO> getName(String name) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<EmployeeVO> list = ss.selectList("nameList", name);
		
		return list;
	}
	
	//idx에 따른 keyword 검색 결과 목록 조회
	public static List<EmployeeVO> getSearch(String idx, String keyword) {
			SqlSession ss = DBService.getFactory().openSession(true);
			Map<String, String> map = new HashMap<String, String>();
			map.put("idx", idx);
			map.put("keyword", keyword);
			List<EmployeeVO> list = ss.selectList("search", map);
			
			ss.close();
			return list;

	}
}
