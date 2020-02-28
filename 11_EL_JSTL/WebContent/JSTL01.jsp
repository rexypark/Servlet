<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- JSTL(JSP Standard Tag Library)
	0. 라이브러리 다운
		다운로드 https://tomcat.apche.org/download-taglibs.cgi
		다운로드 : mvnrepository > jstl 검색
	1. 라이브러리 등록
		WebContent > WEB-INF > lib > jar 파일등록
	2. JSTL 디렉티브(지시어) taglib 추가
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 --%>
 	<h2>JSTL 사용</h2>
 	<%-- 속성 선언 태그(set) : setAttribute 역할 
 		<c:set var="속성명" value="속성값" scope="범위"/>
 	
 	--%>
 	<h3>속성설정 set</h3>
 	<c:set var="test" value="Hello JSTL!!!-page"/>
 	<c:set var="test" value="Hello JSTL!!!-request" scope="request"/>
 	<c:set var="test" value="Hello JSTL!!!-session" scope="session"/>
<%
 		System.out.println("test : "+ pageContext.getAttribute("test"));
%>
	<h3>속성출력 out</h3>
	<p>page test : <c:out value="${pageScope.test }"/></p>
	<p>page test : ${pageScope.test }</p>
	
	<p>application test : <c:out value="${applicationScope.test }" default="데이터없음"/></p>
	<p>application test : ${applicationScope.test }</p>
	<hr>
	
	<p>EL : ${test }</p>
	<p>EL(page): ${pageScope.test }</p>
	<p>EL(request) : ${requestScope.test }</p>
	
	<h3>속성삭제 remove</h3>
	<c:remove var="test" scope="page"/>
	
	<p>EL : ${test }</p>
	<p>EL(page): ${pageScope.test }</p>
	<p>EL(session) : ${session.test }</p>
	
	<hr><hr>
	<%--============================ --%>
	<h2>if태그의 test값</h2>
	<%-- Java 코드의 if문에 해당하는 태그(if)
		- test 속성 값이 true면 if태그 내의 문장 실행
		- var 속성에는 test 결과 값이 저장 됨
		JSTL에서는 else는 없다.
	 --%>
	<c:if test="true">
		<p>if의 test 결과 값이 true인 경우 실행문장</p>
	</c:if>
	<c:if test="false">
		<p>if의 test 결과 값이 false인 경우 실행문장</p>
	</c:if>
	<c:if test="${20 > 10 }" var="result">
		<p>20 &gt; 10 결과 true인 경우 문장 실행</p>
	</c:if>
	<p>비교 결과값 : ${result }</p>
	<%--if문의 else 역할 --%>
	<c:if test="${20 <= 10 }" var="result">
		<p>20 &le; 10 결과 true인 경우 문장 실행</p>
	</c:if>
	
	<%--if 태그2 --%>
	<c:set var ="n1" value="30"/>
	<c:set var ="n2" value="20"/>
	
	<c:if test="${n1 > n2 }" var="k">
		<p>if문 결과 n1(${n1})이 n1(${n2})보다 큽니다.(var k = ${k}) </p>
	</c:if>
	
	<c:if test="${n1 <= n2 }" var="k">
		<p>if문 결과 n1(${n1})이 n1(${n2})보다 작거나 같다.(var k = ${k}) </p>
	</c:if>
	
	<hr>
	
	<h2>choose문 : 자바의 switch ~ case 문과 비슷</h2>
	<c:set var="jumsu" value="88"/>
	<c:if test="${jumsu >= 60}">
		<p>판정결과(${jumsu }) : <c:out value="합격"/></p>
	</c:if>		
	<c:if test="${jumsu < 60}">
		<p>판정결과(${jumsu }) : <c:out value="불합격"/></p>
	</c:if>		
	
	<hr>
	
	<c:choose>
		<c:when test="${jumsu >= 90 }">
			<p>판정결과(${jumsu }) : A</p>
		</c:when>
		
		<c:when test="${jumsu >= 80}">
			<p>판정결과(${jumsu }) : B</p>
		</c:when>
		
		<c:when test="${jumsu >= 70 }">
			<p>판정결과(${jumsu }) : C</p>
		</c:when>
		
		<c:otherwise>
			<p>판정결과(${jumsu }) : 노력하세요</p>
		</c:otherwise>
	</c:choose>
	
	<%--==== JSTL 반복문 forEach ==== --%>
	<h2>반복문 forEach</h2>
	<h3>forEach : 자바의 for(int i=1; i&gt;=1; i++)</h3>
	<p>1~10까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10" step="1">
	${i } &nbsp;
	</c:forEach>	
	<p>forEach문 종료 후 (\${i }) 값 출력 : ${i }</p>
	<hr>
	<p>(실습)1~10까지의 숫자 중 짝수 출력(step="1" 사용)</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i%2 == 0}">
			${i }
		</c:if>
	</c:forEach>
	
	<p>(실습)1~10까지의 숫자 중 짝수 출력(step="2" 사용)</p>
	<c:forEach var="i" begin="1" end="10" step="2">
			${i + 1}
	</c:forEach>
	<hr><hr>
	
	<%--=====================--%>
	<h2>forEach : 집합객체처리</h2>
	<h3>스크립트릿으로 배열값 출력</h3>
<%
	String[] arr = {"홍길동", "일지매", "임꺽정", "둘리"};
	for (String str : arr) {
%>
		<p><%=str %></p>
<%				
	}

%>
	<hr>
	<h3>선언부, 스크립트릿 변수는 속성에 등록 후 사용</h3>
	<c:set var="attr_name" value="<%=arr %>"/>
	${attr_name }
	<c:forEach var="name" items="${attr_name}">
		${name }
	</c:forEach>
	<hr><hr>
	
<%
	String strs = "홍길동/김유신/일지매,임꺽정/둘리,고길동";
	pageContext.setAttribute("attr_strs", strs);
%>
	<%---===============================================--%>
	<h2>forTokens : 문자열 자르기(String.split()과 유사)</h2>=
	<h3>대상문자열 : ${attr_strs }</h3>
	<c:forTokens var="strs" items="${attr_strs}" delims="/">
		<p>${strs }</p>
	</c:forTokens>
	
	<h2>forTokens : 구분자/와, 지정</h2>
	<h3>대상문자열 : ${attr_strs }</h3>
	<c:forTokens var="strs" items="${attr_strs}" delims="/,">
		<p>${strs }</p>
	</c:forTokens>
</body>
</html>