package com.bc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.GuestbookVO;
import com.bc.mybatis.DBService;

public class BoardDAO {
	
	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("totalCount");
		ss.close();
		
		return totalCount;
	}
	
	//표시 할 게시글 
	public static List<GuestbookVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<GuestbookVO> list = ss.selectList("list", map);
		ss.close();
		
		return list;
	}
	
	//게시글 입력처리
	public static int insert(GuestbookVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("insertBvo", bvo);
		
		return result;
	}
	
	//해당 인덱스의 조회수를 + 1
	public static void updateHIT(int b_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("hit", b_idx);
		ss.close();
	}
/*	
	//댓글 리스트 가져오기
	public static List<COMMVO> getCommList(int b_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<COMMVO> list = ss.selectList("comm", b_idx);
		ss.close();
		
		return list;
		
	}
	//해당 인덱스가 가진 bvo 출력
	public static BBSVO selectOne(int b_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		BBSVO vo = ss.selectOne("one", b_idx);
		ss.close();
		return vo;
	}
	
	//해당 인덱스를 가진 게시글에 댓글 추가
	public static int insertComm(COMMVO commVO) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("insertComm", commVO);
		ss.close();
		return result;
	}
	
	//해당 인덱스들을 가진 댓글 삭제
	public static void deleteComm(String c_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("delComm", c_idx);
		ss.close();
	}
	*/
}
