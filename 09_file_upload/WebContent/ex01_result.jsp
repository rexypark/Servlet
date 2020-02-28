<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일을 업로드하고 결과 표시 --%>
<%
	//한글처리  
	request.setCharacterEncoding("UTF-8");

	//form 태그에 enctype="multipart/form-data"사용 시
	//request 객체를 통한 파라미터 값 조회안됨
	//MultipartRequest 타입의 객체를 통해서만 파라미터 추출 가능
	String name = request.getParameter("name");
	System.out.println("name = " + name);	
	
	ServletContext sc = this.getServletContext();
	String path = sc.getRealPath("/upload");
	
	//MultipartRequest("사용해서 처리")
	//MultipartRequest 기본 생성자 없음
	MultipartRequest mr = new MultipartRequest(
			request,
			path, //실제 파일을 저장 하기 위한 경로
			10*1024*1024, //maxPostsize
			"UTF-8",
			new DefaultFileRenamePolicy() //파일 이름 중복 시 이름 사용
			);

	/* MultipartRequest 주요 메소드
		getParameter(문자열) : 파라미터값 추출
		getOriginalFileName(문자열) : 업로드시 사용한 원본파일명 추출
		getFilesystemName(문자열) : 업로드시 저장된 파일명(실제 물리적으로) 추출
		getContentType(문자열) : 업로드된 파일의 타입(형식) 추출
		
		
		
		
		사용자에게 보여주는 것은 원본 파일(getOriginalFileName)명이고
		물리적으로 저장되는 파일명은 저장 파일(getFilesystemName)명이다.
	*/
%>

	<h1>파일업로드 결과 보기</h1>
	<h2>올린사람(name) : <%=mr.getParameter("name") %></h2>
	<h2>파일제목(title) : <%=mr.getParameter("title") %></h2>
	<h2>파일(f_name) : <%=mr.getParameter("f_name") %></h2>
	<h2>원본파일명 : <%=mr.getOriginalFileName("f_name") %></h2>
	<h2>저장파일명 : <%=mr.getFilesystemName("f_name") %></h2>
	<h2>파일타입 : <%=mr.getContentType("f_name") %></h2>

<%
	File file = mr.getFile("f_name");
	out.println("<h2>파일이름 : " + file.getName() + "</h2>");
	out.println("<h2>파일길이 : " + file.length() + "</h2>");
%>

<!-- 다운로드 링크연결 -->
<a href="download.jsp?path=upload&name=<%=mr.getFilesystemName("f_name") %>">
	다운로드 할 파일(<%=mr.getOriginalFileName("f_name") %>)
</a>







