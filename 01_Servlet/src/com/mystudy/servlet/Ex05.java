package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/score")
public class Ex05 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//(실습)전달받은 이름,국어,영어,수학 점수를 받아서 성적처리
		//1. p태그를 사용해서 결과 출력
		//2. 테이블 사용해서 결과 출력
		/* 응답형식
		성적처리 결과
		이름: 홍길동
		국어: 100
		영어: 90
		수학: 80
		---------
		총점: 270
		평균: 90
		*/
		
		//한글처리 - utf8
		response.setContentType("text/html;charset=UTF-8");
		//응답 객체 선언
		PrintWriter out = response.getWriter();
		
		//요청한 Map 데이터  
		Map<String, String[]> paraArr = request.getParameterMap();
		
		//데이터 names 
		Enumeration<String> paramNames = request.getParameterNames();
		int sum = 0;
		
		out.write("<table>");
		
		// Enumeration객체를 가진 paramNames에 값이 있을 때 까지 출력 
		while(paramNames.hasMoreElements()) {
			String attr = paramNames.nextElement();
			try {
				//문자열 값이 정수인 수이면 int로 변환하여 출력
				int val = Integer.parseInt(paraArr.get(attr)[0]);
				out.write("<tr>");
				out.write("<td>");
				out.write(attr);
				out.write("</td>");
				out.write("<td>");
				out.write(val);
				out.write("</td>");
				sum += val;
				out.write("</tr>");
			} catch (NumberFormatException e) {
				//문자열 값이 문자일때 출력
				out.write("<tr>");
				out.write("<th>");
				out.write(attr);
				out.write("</th>");
				out.write("<th>");
				out.write(paraArr.get(attr)[0]);
				out.write("</th>");
				out.write("</tr>");
			}
			
		}
		
		double avg = sum * 3 * 100 * 100.0;
		String avgStr = Double.toString(avg);
		out.write("<tr>");
		out.write("<td>");
		out.write("총점");
		out.write("</td>");
		out.write("<td>");
		out.write(sum);
		out.write("</td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td>");
		out.write("평균");
		out.write("</td>");
		out.write("<td>");
		out.write(avgStr);
		out.write("</td>");
		out.write("</tr>");
		
		out.write("</table>");
		


		
		
		
		
// 		Enumeration객체를 가진 paramNames에 값이 있을 때 까지 출력 
//		while(paramNames.hasMoreElements()) {
//			String attr = paramNames.nextElement();
//			try {
//				//문자열 값이 정수인 수이면 int로 변환하여 출력
//				int val = Integer.parseInt(paraArr.get(attr)[0]);
//				out.write("<h1>");
//				out.write(attr + ": " + val);
//				sum += val;
//				out.write("</h1>");
//			} catch (NumberFormatException e) {
//				//문자열 값이 문자일때 출력
//				out.write("<h1>");
//				out.write(attr + ": " +paraArr.get(attr)[0]);
//				out.write("</h1>");
//			}
//		}
//		
//		double avg = sum * 3 * 100 * 100.0;
//		out.write("<h1>");
//		out.write("--------");
//		out.write("</h1>");
//		out.write("<h1>");
//		out.write("총점: " + sum);
//		out.write("</h1>");
//		out.write("<h1>");
//		out.write("평균: " + avg);
//		out.write("</h1>");
//		
		
		
//		String name = request.getParameter("name");
//		String kor = request.getParameter("kor");
//		String eng = request.getParameter("eng");
//		String math = request.getParameter("math");
//		
//		System.out.println("name : " + name);
//		System.out.println("kor : " + kor);
//		System.out.println("eng : " + eng);
//		System.out.println("math : " + math);
		
	}
	
	
}
