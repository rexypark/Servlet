package com.bc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;


@WebServlet("/search")
public class searchController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//DAO 리스트 저장
		List<EmployeeVO> list = process(request, response);
		
		//저장 리스트 request scope에 저장
		request.setAttribute("searchList", list);
		
		//페이지 이동
		request.getRequestDispatcher("searchList.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	private static List<EmployeeVO> process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("idx : " + idx );
		System.out.println("keyword : " + keyword );
		String title = "";
		
		switch(idx) {
		case"0": title="사번"; break;
		case"1": title="이름"; break;
		case"2": title="직종"; break;
		case"3": title="부서"; break;
		
		}

		request.setAttribute("title", title);
		List<EmployeeVO> list = new ArrayList<EmployeeVO>();
		if(keyword == null || keyword.equalsIgnoreCase("")) {
			request.getRequestDispatcher("search.jsp").forward(request, response);
		} else {//DB데이터 조회
			list = DAO.getSearch(idx, keyword);
			System.out.println("list : " + list );
		}
		return list;
	}

}
