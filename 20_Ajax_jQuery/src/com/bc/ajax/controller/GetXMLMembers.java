package com.bc.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.MemberDAO;
import com.bc.model.vo.MemberVO;


@WebServlet("/getXMLMembers")
public class GetXMLMembers extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		//DB 데이터 조회(전체 데이터)
		List<MemberVO> list = MemberDAO.getList();
		
		
		
		
		//XML 문서 형태의 문자열 작성
		/*
		<members>
		<member>
			<idx>1</idx>
			<name>홍길동4</name>
			<age>28</age>
			<addr>경남</addr>
			<regdate>2020-01-02</regdate>
		</member>		
		</members>
		*/
		StringBuilder result = new StringBuilder();
		
		result.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		result.append("<members>");
		for(MemberVO vo : list) {
			result.append("<member>");
			result.append("<idx>" + vo.getIdx() + "</idx>");
			result.append("<name>" + vo.getName() + "</name>");
			result.append("<age>" + vo.getAge() + "</age>");
			result.append("<addr>" + vo.getAddr() + "</addr>");
			result.append("<regdate>" + vo.getRegdate() + "</regdate>");			
			result.append("</member>");
		}
		result.append("</members>");
		System.out.println("result : " +  result);
		out.print(result);
	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
