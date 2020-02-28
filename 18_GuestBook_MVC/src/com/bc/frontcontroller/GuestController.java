package com.bc.frontcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.command.AllListCommand;
import com.bc.model.command.Command;
import com.bc.model.command.EditGoCommand;
import com.bc.model.command.WriteCommand;
import com.bc.model.command.deleteGoCommand;


@WebServlet("/GuestController")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String path = "";
		Command comm = null;

		switch(type) {
		
			case"allList": comm = new AllListCommand(); break;
			case"writeNew": comm = new WriteCommand(); break;
			case"updateGo": comm = new EditGoCommand(); break;
			case"deleteGo": comm = new deleteGoCommand(); break;
			
		
		
		
		}
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
