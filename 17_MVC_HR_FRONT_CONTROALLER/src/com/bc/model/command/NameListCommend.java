package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;

public class NameListCommend implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이름 추출
		String name = request.getParameter("name");
		System.out.println("name : " + name);
		name = "%" + name + "%";
		
		//DB DAO
		List<EmployeeVO> nameList = DAO.getName(name);
		System.out.println("nameList : " + nameList);
		
		request.setAttribute("fullNameList", nameList);
		//request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
		
		return "fullnameList.jsp";
	}

}
