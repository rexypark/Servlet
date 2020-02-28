package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;


@WebServlet("/nameList")
public class nameListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이름 추출
		String name = request.getParameter("name");
		System.out.println("name : " + name);
		name = "%" + name + "%";
		
		//DB DAO
		List<EmployeeVO> nameList = DAO.getName(name);
		System.out.println("nameList : " + nameList);
		
		request.setAttribute("fullNameList", nameList);
		request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
