<%@page import="com.gyojincompany.dto.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	body {
      font-family: "Malgun Gothic", sans-serif;
      background-color: #f9f9f9;
      padding: 40px;
    }

    table {
      width: 50%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    thead {
      background-color: #f1f1f1;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 12px 16px;
      text-align: center;
      font-size: 14px;
    }

    th {
      font-weight: bold;     
    }

    td:nth-child(2) {
      text-align: left;
      color: #0056b3;
    }
    
    tr {
      background-color: #f9f9f9;
    }
    
</style>
<title>내 장바구니</title>
</head>
<body>
	<h2>내 장바구니 상품 목록</h2>
	<hr>
	<%
		ArrayList<ProductDto> cart = (ArrayList<ProductDto>) session.getAttribute("cart");
		//세션에 들어있는 상품 목록 cart 가져오기(ArrayList<ProductDto> 타입)
		
		//request.setAttribute("cart", cart);
	%>
	
	<c:choose>
	<c:when test="${empty sessionScope.cart }">
		<h2>장바구니가 비었습니다.</h2>
	</c:when>
	<c:otherwise>
	<h2>장바구니 목록</h2>
	<hr>
	<table>
		<thead>
		<tr>
			<th>번호</th>			
			<th>상품 종류</th>
			<th>색깔</th>
			<th>수량</th>
		</tr>
		<thead>
		
		<!-- 
		<c:forEach var="productDto" items="${cart}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${productDto.product}</td>
				<td>${productDto.color}</td>
				<td>${productDto.quantity}</td>
			</tr>
		</c:forEach>
		 -->
		<c:set var="count" value="0" />	 
		<c:forEach var="productDto" items="${sessionScope.cart}">
			<tr>
				<td>${count=count+1}</td>
				<td>${productDto.product}</td>
				<td>${productDto.color}</td>
				<td>${productDto.quantity}</td>
			</tr>
		</c:forEach>
		
	</table>
	</c:otherwise>
	</c:choose>
	<hr>
	<a href="removeCart.jsp">장바구니 비우기</a><br><br>
	
	<a href="productList.jsp">상품 선택 페이지로 돌아가기</a>
</body>
</html>