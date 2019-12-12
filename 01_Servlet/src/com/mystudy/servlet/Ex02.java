package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/today")
public class Ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex02() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(">> Ex02.doGet() 메소드 실행");
		
		//한글 깨짐 방지를 위한 문서타입 처리(UTF-8)
//		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//오늘 날짜(년월일)
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		PrintWriter out  = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
//		out.println("<meta charset='utf-8'>");
		out.println("<meta charset='utf-8'>");
		out.println("<title>두번째 서블릿 예제</title>");
		
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>오늘의 날짜는?</h1>");
		out.println("<h3>오늘의 날짜는?" + year + "년" + month + "월" + day + "입니다."+ "</h3>");
		out.println("</body>");
		out.println("</html>");
	}

}
