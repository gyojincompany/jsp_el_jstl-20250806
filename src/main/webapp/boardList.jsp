<%@page import="com.gyojincompany.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
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
      width: 60%;
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

    tr:hover {
      background-color: #f9f9f9;
    }

    a {
      text-decoration: none;
      color: #0056b3;
    }

    a:hover {
      text-decoration: underline;
    }
	
	
</style>
<title>자유 게시판</title>
</head>
<body>
	<!-- 게시판 글 리스트 -->
	<%
		//게시판 더미(dummy) 데이터 만들기
		
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		//게시글(boardDto)를 여러개 담을 ArrayList 준비(선언)
		
		boardList.add(new BoardDto(1, "안녕하세요. 첫글입니다.안녕하세요. 첫글입니다.안녕하세요. 첫글입니다.안녕하세요. 첫글입니다.안녕하세요. 첫글입니다.", "이순신", "2025-08-01"));
		boardList.add(new BoardDto(2, "오늘 날씨가 비오네요", "김유신", "2025-08-03"));
		boardList.add(new BoardDto(3, "요즘 날씨가 너무 더워요", "강감찬", "2025-08-04"));
		boardList.add(new BoardDto(4, "안녕하세요. 가입합니다.", "홍길동", "2025-08-04"));
		boardList.add(new BoardDto(5, "저는 야구를 좋아해요.", "이순신", "2025-08-05"));
	
		request.setAttribute("boardList", boardList);
	%>
	
	<h2>자유 게시판 목록</h2>
	<hr>
	<table>
		<thead>
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
		</thead>
		
		<c:forEach var="boardDto" items="${boardList }">
			<tr>
				<td>${boardDto.bnum }</td>
				<td>
					<c:choose>
						<c:when test="${fn:length(boardDto.btitle) > 40}">
							<a href="#">${fn:substring(boardDto.btitle, 0, 40)}...</a>
						</c:when>
						<c:otherwise>
							${boardDto.btitle }
						</c:otherwise>
					</c:choose>
				</td>
				<td>${boardDto.bwriter }</td>
				<td>${boardDto.bdate }</td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>