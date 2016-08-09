<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Social Anaytics</title>
		<link rel="icon" href="http://example.com/favicon.png">
		<link rel="stylesheet" href="<c:url value="/resources/page.css" />" type="text/css" media="screen" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%-- 		<link rel="stylesheet" href="<c:url value="/resources/form.css" />" type="text/css" media="screen" /> --%>
<%-- 		<link rel="stylesheet" href="<c:url value="/resources/messages/messages.css" />" type="text/css" media="screen" /> --%>
	</head>
	<body>
		<table class="tableProp" border="2" align="center" >
			<tr>
				<td colspan="2" class="tableHeader">
					<div class="header">
						<h1><a href="<c:url value="/"/>">Social Analytics</a></h1>
					</div>
				</td>
			</tr>
			<tr>
				<td class="column20" >
					<div id="leftNav">
						<tiles:insertTemplate template="menu.jsp" />
					</div>
				</td>
				<td class="column80">
					<div class="content">
						<tiles:insertAttribute name="content" />
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
