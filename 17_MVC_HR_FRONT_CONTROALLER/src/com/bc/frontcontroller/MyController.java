package com.bc.frontcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.command.Command;
import com.bc.model.command.DeptCommand;
import com.bc.model.command.DeptListCommend;
import com.bc.model.command.FullNameCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.command.NameListCommend;
import com.bc.model.command.SearchBarCommand;
import com.bc.model.command.SearchListCommand;
import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;
import com.sun.corba.se.impl.protocol.giopmsgheaders.RequestMessage;


@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청에 대한 처리
		String type = request.getParameter("type");
		String path = "";
		Command comm = null; //부모 객체는 자식 객체를 모두 담을 수 있다.
		//전체목록 조회
		if("all".equals(type)) {
			comm = new ListCommand();

		}
		
		//부서번호 검색 창으로 이동
		if("dept".equals(type)) {
			comm = new DeptCommand();

		}
		
		//부서 번호로 검색
		if("deptList".equals(type)) {
			comm = new DeptListCommend();
			
		}
		
		//이름 검색창으로 이동
		if("fullName".equals(type)) {
			comm = new FullNameCommand();
			
		}
		
		//이름으로 검색
		if("nameList".equals(type)) {
			comm = new NameListCommend();

		}
		
		//searchBar로 이동
		if("searchBar".equals(type)) {
			comm = new SearchBarCommand();

		}

		//동적 검색
		if("search".equals(type)) {		
			comm = new SearchListCommand();

		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
