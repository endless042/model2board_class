<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"></head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<p class="w3-left"  style="padding-left:30px;"></p>
<div class="w3-container">

<center><h2 class="w3-wide w3-center">글수정</h2>
<br>
<form method="post" name="writeform" action="updatePro" >
<input type="hidden" name="boardid" value="${article.boardid }">
<input type="hidden" name="num" value="${article.num }">
<input type="hidden" name="ref" value="${article.ref}">
<input type="hidden" name="re_step" value="${article.re_step}">
<input type="hidden" name="re_level" value="${article.re_level}">
<input type="hidden" name="pageNum" value="${pageNum}">


<table class="w3-table w3-bordered  w3-striped "  style="width:70%;" >
   <tr>
    <td align="right" colspan="2" >
	    <a href="list"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td  width="70"   align="center">이 름</td>
    <td  width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="${article.writer}"></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >제 목
    </td>
    <td width="330">
 
 
       <input type="text" size="40" maxlength="50" name="subject" value="${article.subject}">
	
   
   </td>
  </tr>
  <tr>
    <td  width="70"   align="center">Email</td>
    <td  width="330">
       <input type="text" size="40" maxlength="30" name="email" value="${article.email}"></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >내 용</td>
    <td  width="330" >
     <textarea name="content" rows="13" cols="40">${article.content}</textarea> </td>
  </tr>
  <tr>
    <td  width="70"   align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" name="passwd" > 
	 </td>
  </tr>
<tr>      
 <td colspan=2  align="center"> 
  <input type="submit" class="w3-button w3-hover-black" value="글수정" >  
  <input type="reset" class="w3-button w3-hover-black" value="다시작성">
  <input type="button" class="w3-button w3-hover-black" value="목록보기" OnClick="window.location='list'">
</td></tr></table>    
     
</form>  </center></div>  


</body>
</html>