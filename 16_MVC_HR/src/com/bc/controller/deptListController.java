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


@WebServlet("/deptList")
public class deptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 전달받은 파라미터값 (부서코드 : deptno)추출
		String deptno = request.getParameter("deptno");
		System.out.println("deptno : " + deptno);
		
		
		//2. DB에서 해당부서(deptno)에 있는 직원조회(DAO 사용)
		List<EmployeeVO> deptList = DAO.getDeptList(deptno);
		//3. 조회된 데이터를 응답페이지(deptList.jsp)에서 사용토록
		//   속성에 저장(속성명 : d_list)
		System.out.println("deptList : "+ deptList);
		request.setAttribute("deptList", deptList);
		//4. 응답페이지 (deptList.jsp)로 응답 위임처리
		request.getRequestDispatcher("deptList.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
