package com.bc.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class DAO {

	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("totalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 표시할 게시글 조회
	public static List<VO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<VO> list = ss.selectList("list", map);
		ss.close();
		return list;
	}
	
	//글 하나 조회
	public static VO getOneList(String seq) {
		SqlSession ss = DBService.getFactory().openSession(true);
		VO vo = ss.selectOne("one", seq);
		ss.close();
		return vo;
	}
	
	//lev 1증가 처리(해당 댓글(step)에 대한)
	public static int getUpdateLev(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("upadateLev", map);
		ss.close();
		return 0;
	}
	
	public static int getReInsert(VO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("re_insert", vo);
		ss.close();
		return result;
	}
	//글쓰기 INSERT
	public static int getInsert(VO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("post_insert", vo);
		ss.close();
		return result;
	}
	
}




















