package com.mystudy.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/hello")
public class Ex01_Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
      /*
       	서블릿은 스레드로 작동된다
       	한번 작동 시킬 때
       	생성자를 먼저 실행하고 init 메소드가 실행된다.
       	마지막으로 service메소드 실행됨
       	다음부터 계속 호출 시에는 service만 실행된다
       	만약 톰캣 서버를 종료하면 destroy 실행된다.
       */
  
    public Ex01_Hello() {
    	/* 생성자
    	WAS(Web Application Server : Servlet 컨테이너, JSP 컨테이너)
    	생성자는 서블릿이 WAS에 최초로 등록될 때 한번만 실행됨
    	한 번 로딩된 후에는 재실행되지 않음
    	두 번째 URL 요청부터는 service() 메소드 실행됨
    	  */
    	//1번으로 실행
    	super();
        System.out.println(">>> 생성자 실행");
    }
    //2번으로 실행
	public void init(ServletConfig config) throws ServletException {
		/* 서블릿 객체가 처음 생성된 후 최초로 한 번 실행 
		      초기화 작업들을 처리하는 용도로 사용
		 * */

		System.out.println(">> init() 실행");
	}

	//톰캣 서버가 종료되면 실행
	public void destroy() {
		//서버에서 서블릿이 내려갈 때 destroy() 호출 되고, 서버에서 소멸
		System.out.println(">> destroy() 실행");
	}
	
	
	//요청에 대한 객체 HttpServletRequest // 응답에 대한 객체 HttpServletResponse
    //3번으로 실행
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 요청(request)이 있을 때마다 요청된다 
		System.out.println(">> service() 실행===================");
		
		//요청정보를 확인해서 get, post 여부에 따라 분기처리
		System.out.println("request.getMethod() : " + request.getMethod());
		if (request.getMethod().equalsIgnoreCase("get")) {
			doGet(request, response);
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get 방식 요청이 있을 때 호출되는 메소드
		//request : 요청정보(클라이언트정보)
		//respond : 응답정보(요청에 따른 결과를 전달할 정보)
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(">> doGet() 실행");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		System.out.println(">> doPost() 실행");
	}

}
