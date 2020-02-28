package com.bc.model.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;

public class SearchListCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		//저장 리스트 request scope에 저장
		request.setAttribute("searchList", list);
		
		//페이지 이동
		//request.getRequestDispatcher("searchList.jsp").forward(request, response);
	
		
		return "searchList.jsp";
	}
		
}
