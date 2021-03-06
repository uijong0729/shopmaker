<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="./resources/css/Bpage/Bheader.css?=ver1">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src='<c:url value="resources/js/jquery-3.2.1.js" />'></script>
<script type="text/javascript">

	function goproductkind(kind){
		location.href="productkind1?kind="+kind;	
	}
	
</script>
<title>Insert title here</title>
</head>
<body>

	<div class="header_wrapper">

		<div id="header_header">
			<center>
				<div id="header_logo">
					<a href="#"><img id="image_header" tabindex="0"
						src="./resources/img/ShopMaker2.png" /></a>
				</div>
			</center>
		</div>

		<div id="header_small_navbar">
			<ul>
				<c:if test="${Blogin == null}">
					<li><a id="temp1" tabindex="0" href="#" class="header_member">회원가입</a></li>
					<li style="width: 60px;"><a id="temp2" tabindex="0"
						class="header_member">로그인</a></li>
				</c:if>
				<c:if test="${Blogin != null}">
					<li><a id="temp4" tabindex="0" href="#" class="header_member">로그아웃</a></li>
					<li><a id="temp5" tabindex="0" href="#" class="header_member">관리페이지</a></li>
					<li><a id="temp6" tabindex="0" href="Bmypage" class="header_member">마이페이지</a></li>
				</c:if>
				<li><a id="temp3" href="#" class="header_member" tabindex="0">공지사항</a></li>
			</ul>
		</div>

		<div id="header_navbar">
			<center>
				<a href="#">
					<div id="header_outer" class="header_menu">
						<div tabindex="0" id="text_temp0"
							style="background: #f9f9f9; border: none;">
							<b>Livingroom</b>
						</div>
						---<br>
						<div tabindex="0" id="text_temp1"
							style="background: #f9f9f9; border: none;">Sofa&amp;Rug</div>
					</div>
				</a>
				<div id="header_top" class="header_menu">
					<div tabindex="0" id="text_temp2"
						style="background: #f9f9f9; border: none;">
						<b>Kitchen</b>
					</div>
					---<br>
					<div tabindex="0" id="text_temp3"
						style="background: #f9f9f9; border: none;">Table&amp;Chair</div>
				</div>
				</a> <a href="#">
					<div id="header_bottom" class="header_menu">
						<div tabindex="0" id="text_temp4"
							style="background: #f9f9f9; border: none;">
							<b>Bedroom</b>
						</div>
						---<br>
						<div tabindex="0" id="text_temp5"
							style="background: #f9f9f9; border: none;">Bed&amp;Desk</div>
					</div>
				</a> <a href="#">
					<div id="header_shoes" class="header_menu">
						<div tabindex="0" id="text_temp6"
							style="background: #f9f9f9; border: none;">
							<b>Baby</b>
						</div>
						---<br>
						<div tabindex="0" id="text_temp7"
							style="background: #f9f9f9; border: none;">Bed&amp;Desk</div>
					</div>
				</a>
			</center>
		</div>

	</div>
	<!--header_wrapper-->


<c:set var="kind" value="sub_Outer" />
	<c:set var="count" value="0" />
	<div id="header_submenu" class="submenu">
		<c:forEach items="${productkindlist}" var="n" varStatus="vars">
			<c:if test="${count%4==0}">
				<ul style="margin: 0; padding: 0">
			</c:if>
			<li class="${kind}"><a id="forLink${count}" onclick="goproductkind('${n}')"> ${n} 
			</a></li>

			<c:if test="${count%4==0}">
				</ul>
			</c:if>
			<c:set var="count" value="${count+1}" />
			<c:if test="${count==4}">
				<c:set var="kind" value="sub_Top" />
			</c:if>
			<c:if test="${count==8}">
				<c:set var="kind" value="sub_Bottom" />
			</c:if>
			<c:if test="${count==12}">
				<c:set var="kind" value="sub_Shoes" />
			</c:if>
		</c:forEach>
	</div>
<!-- 
	<div id="header_submenu" class="submenu">
		<ul style="margin: 0; padding: 0">
			<li class="sub_Outer"><a id="forLink0">Coat</a></li>
			<li class="sub_Outer"><a id="forLink1">Jacket</a></li>
			<li class="sub_Outer"><a id="forLink2">Cardigan</a></li>
			<li class="sub_Outer"><a id="forLink3">AndSoOn</a></li>
			<li class="sub_Top"><a id="forLink4">TShirt</a></li>
			<li class="sub_Top"><a id="forLink5">Shirt</a></li>
			<li class="sub_Top"><a id="forLink6">Hoody</a></li>
			<li class="sub_Top"><a id="forLink7">AndSoOn</a></li>
			<li class="sub_Bottom"><a id="forLink8">Jeans</a></li>
			<li class="sub_Bottom"><a id="forLink9">Slacks</a></li>
			<li class="sub_Bottom"><a id="forLink10">Skirt</a></li>
			<li class="sub_Bottom"><a id="forLink11">AndSoOn</a></li>
			<li class="sub_Shoes"><a id="forLink12">Sneakers</a></li>
			<li class="sub_Shoes"><a id="forLink13">Loafer</a></li>
			<li class="sub_Shoes"><a id="forLink14">Heals</a></li>
			<li class="sub_Shoes"><a id="forLink15">AndSoOn</a></li>
		</ul>
	</div> -->
	<script src="./resources/js/subMenu.js?ver=3"></script>
</body>
</html>