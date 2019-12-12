package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test03") //test03 요청에 대한 url 매핑처리
public class Ex03 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 응답시 한글처리를 위한 문자 set 지정
		response.setContentType("text/html;charset=UTF-8");
		
		//파라미터 값 : 요청시 서버쪽으로 전달 한 값
		//파라미터 형식 : ?키=값&키=값
		//작성예) /test03?name=홍길동&age=12
		
		//----------------------------
		//응답처리
		//이름 : 홍길동
		//나이 : 30
		//----------------------------		
		
		//request 객체로 부터 파라미터값 추출
		//1. getParameter(파라미터명) : 하나의 파라미터값 추출
		//2. getParameterValues(파라미터명) : 배열형태 값 추출(체크박스) 
		//3. getParameterMap(파라미터명) : 맵 형식으로 파라미터 값 추출
		//기타 getParameterNames() : 파라미터명 확인시 사용
		
		//전달받은 파라미터 값 추출(name, age)
		String name =  request.getParameter("name");
		String age =  request.getParameter("age");
		
		System.out.println("name: " + name + "\nage : " + age);


		
		//응답처리
		//응답개채를 이용해 출력할 프린터 라이터객체를 만들어 출력
		PrintWriter out = response.getWriter();
		out.write("<h1>전달받은 데이터(이름, 나이)</h1>");
		out.write("<h1>이름(name)" + " : " + name + "</h1>");
		out.write("<h1>나이(age)" + " : " + age + "</h1>");
		
	}
	
}
