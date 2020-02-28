package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Ex04<K> extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {
		
		response.setContentType("text/html;charset=UTF-8");

		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String email = request.getParameter("email");
		String[] hobby = request.getParameterValues("hobby");
		System.out.println("hobby : " + hobby);
		
		System.out.println("name : " + name);
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("pwd2 : " + pwd2);
		System.out.println("email : " + email);

		
		
	
//		Map<String, String[]> signMap = request.getParameterMap();
//		
//		String[] names = signMap.get("name");
//		String[] ids = signMap.get("name");
//		String[] pwds = signMap.get("name");
//		String[] emails = signMap.get("name");
//		String[] hobbys = signMap.get("name");
//		System.out.println("names : " + names[0]);
//		System.out.println("ids : " + ids[0]);
//		System.out.println("pwds : " + pwds[0]);
//		System.out.println("emails : " + emails[0]);
//		System.out.println("hobbys : " + hobbys[0]);
//		
		
		
		
		
//		Iterator<String> iter = form.keySet().iterator();
//		ArrayList<String> formKeys = new ArrayList<String>();
//		while(iter.hasNext()) {
//			formKeys.add(iter.next());
//			System.out.println(iter.next());
//		}
//		
//		System.out.println("formKeys" + formKeys);
//		System.out.println("id MAP: " + form.get("id"));
		
		
		//request 객체로 부터 파라미터값 추출
		//1. getParameter(파라미터명) : 하나의 파라미터값 추출
		//2. getParameterValues(파라미터명) : 배열형태 값 추출(체크박스) 
		//3. getParameterMap(파라미터명) : 맵 형식으로 파라미터 값 추출
		//기타 getParameterNames() : 파라미터명 확인시 사용
		
//		//-------------------------
		//응답정보 작성
		PrintWriter out = response.getWriter();
		out.write("<h2>회원가입정보</h2>");
		out.write("<ul>");
		out.write("<li>이름 : " + name + "</li>");
		out.write("<li>아이디 : " + id + "</li>");
		out.write("<li>암호 : " + pwd + "</li>");
		out.write("<li>이메일 : " + email + "</li>");
		out.write("<li>취미 : ");
		if (hobby == null) {
			out.write("선택사항 없음");
		} else {
			for(String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		
		out.write("</li>");
		out.write("</ul>");
		out.write("======================");
		
		//================================
		//3. getParameterMap(파라미터명) : 맵 형식으로 파라미터 값 추출
		Map<String, String[]> paramMap = request.getParameterMap();
		String[] names = paramMap.get("name");
		String[] hobby2 = paramMap.get("hobby");
		
		out.println("<h3>파라미터를 Map 형식으로 받아서 처리</h3>");
		out.println("<ol>");
		out.println("<li>이름 : " + names[0] + "</li>");
		out.println("<li>취미 :");
		if (hobby2 == null) {
			out.println("선택사항 없음");
		} else {
			for (String str : hobby2) {
				out.println(str + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ol>");
		out.println("<hr>");
				
				
				
		//-----------------------------------------------
		//기타 getParameterNames(): 파라미터명 확인시 사용
		out.println("<h3>넘겨받은 파라미터명</h3>");
		Enumeration<String> paramNames = request.getParameterNames();
		out.println("<p>");
		while (paramNames.hasMoreElements()) {
			out.println(paramNames.nextElement() + " ");
		}
		out.println("</p>");
		out.println("<hr>");

	}
}
