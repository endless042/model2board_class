<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>게시판</title>
</head>
<body>


	<p class="w3-left" style="padding-left: 30px;"></p>

	<div class="w3-container ">
		<span class="w3-center w3-large">
			<h3>${boardid }(전체글:${count})</h3>
			
		</span>
		<p class="w3-right w3-padding-right-large">
			<a href="writeForm">글쓰기</a>
		</p>
		
		
		<c:if test="${count==0}">
    	
		
    	if(count==0){
    		
    	
    	
		<table class="w3-table w3-bordered w3-hoverable" width="700">
			<tr class="w3-grey">
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
		</c:if>

		<c:if test="${count!=0}">
		<table class="w3-table w3-bordered w3-hoverable" width="700">
			<tr class="w3-light-grey">
				<td class="w3-center" width="50"><b>번호</b></td>
				<td class="w3-center" width="250"><b>제목</b></td>
				<td class="w3-center" width="100"><b>작성자</b></td>
				<td class="w3-center" width="150"><b>작성일</b></td>
				<td class="w3-center" width="50"><b>조회</b></td>
				<td class="w3-center" width="100"><b>IP</b></td>



<c:forEach var="article" items="${articleList}">

	
	<tr height="30">
		<td class="w3-center" width="50">${number}</td>
		<c:set var="number" value="${number-1}"/>
		<td width="250">
			
		<c:if test="${article.re_level>0}">  			
  			<img src="../images/level/gif" width="${15*article.re_level}" height="16">
		<img src="../images/re.gif"> </c:if>
			
			
		<c:if test="${article.re_level==0}"> 	
	 <img src="../images/level.gif" width="0" height="16">
	</c:if>
	
		<a
		href="content?num=${article.num}&pageNum=${currentPage}">
			${article.subject}</a>
		
		
		<c:if test="${article.readcount>=20 }">
 				<img src="../images/hot.gif" border="0" height="16">
		</c:if>
		
					
	</td>
	<td class="w3-center" width="100">${article.writer}</td>
	<td class="w3-center" width="150">${article.reg_date}</td>
	<td class="w3-center" width="50">${article.readcount}</td>
	<td class="w3-center" width="100">${article.ip}</td>


			</tr>
			

		</c:forEach>





		</table>
		</c:if>

		<!-- 하단 페이징  -->
		<div class="w3-center">
		<c:if test="${count>0}">
			<c:if test="${startPage>bottomLine}">			
			<a href="list?pageNum=${startPage-bottomLine}">[이전]</a>
				</c:if>
				
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			
    		
    		
			<a href="list?pageNum=${i}">
				
				<c:if test="${i!=currentPage}">
				 [${i}]
				</c:if>
				<c:if test="${i==currentPage}">
    			<font color='red'>[${i}]</font>
    		</c:if>
			</a>  
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">    		
			<a href="list?pageNum=${startPage+bottomLine}">[다음]</a>
			
			 </c:if>
		
		</c:if>
		</div>
	</div>

</body>
</html>