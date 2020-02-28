<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 파일 다운로드 처리 -->
<%
	//한글처리를 위한 UTF-8처리
	request.setCharacterEncoding("UTF-8");

	String path = request.getParameter("path");
	String name = request.getParameter("name");
	System.out.println("path : " + path);
	System.out.println("name : " + name);
	
	//실제 파일이 저장된 경로 확인
	String r_path = this.getServletContext().getRealPath(path);
	System.out.println("r_path(파일저장위치) : " + r_path);
	
	//다운로드 받을 수 있도록 클라이언트 응답 문서 타입 변경
	response.setContentType("application/x-msdownload");
	
	//클라이언트의 헤더정보를 첨부파일이 있는것으로 변경
	response.setHeader("Content-Disposition", "attachment;filename=" + name);
	
	/******************* 실제 입출력 스트림 하기 *******************/
	//물리적으로 실제파일을 복사하는 작업 구현(바이트 계열)
	//원본파일에서 읽고 대상파일에 쓰기
	File file = new File(r_path + "/" + name);
	
	//input, output 스트림(바이트계열)
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	
	BufferedOutputStream bos = null;
	if(file.isFile()) {
		try {
			//파일을 읽기 위한 객체 생성
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			
			//파일에 쓰기 위한 객체 생성                 //이미 HTTP response에 있는 스트림호출 
			bos = new BufferedOutputStream(response.getOutputStream());
			
			//파일로부터 읽고 쓰기
			int b = bis.read();
			while (b != -1) {
				bos.write(b);
				b = bis.read();
			}
			bos.flush();
			
			//JSP 출력 스트림과 서블릿 출력 스트림이 겹쳐서
			//발생하는 오류 해결을 위한 처리
			out.clear();
			out = pageContext.pushBody();
		} catch(Exception e) {
			e.printStackTrace();
		} finally { 
			fis.close();
			bos.close();
			bis.close();
		}
		
	}
%>
