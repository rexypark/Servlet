package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;


@WebServlet("/list")
public class listControllor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> doGet() Start =======");
		
		process(request, response);
		
		System.out.println(">> doGet() end =======");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> doPost() Start =======");
		request.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
		
		System.out.println(">> doPost() end =======");
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> process 시작 : 요청에 대한 작업 시작");
		//요청 받은 작업에 대한 처리(hr유저의 employees 테이블 정보 조회)
		System.out.println("DB에서 데이터 가져와서 list.jsp로 전달");
		
		//DB연결하고 전체 데이터 가져와서 응답페이지에 전달
		//1. DB연결하고 데이터 가져오기(DAO)
		List<EmployeeVO> list = DAO.getList();
		
		
		
		//2. 응답페이지 전달(request 객체에 속성값 저장)
		request.setAttribute("empVO", list);
		
		
		
		//응답페이지(list.jsp 지정하고 페이지 전환(포워딩)
		request.getRequestDispatcher("list.jsp").forward(request, response);
		
		
		
		System.out.println(">> process 끝 : 요청에 대한 작업 끝");
	}

}
