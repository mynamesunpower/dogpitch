<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	
	// 2. 다시 화면으로 보낼 데이터 구성
	String result ="";
	
	result += "{";
	result += "'first' : "+ "'changed_"+cate+"_by_server" +"',";
	result += "'second' : "+ "'from_"+name+"_server'";
	result += "}";
	// 나중에 json 구조 만들 때 : 라이브러리 이용

	System.out.println(result);
	out.write(result);	
%> 