<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/headerfooter.css">
<link rel="stylesheet" href="./resources/css/templatepay.css?ver=1">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script>
function template1() {
	document.getElementById("template").innerHTML="template1";
	$('#templateforValue').val($('#template').text());
	
}
function template2() {
	document.getElementById("template").innerHTML="template2";
	$('#templateforValue').val($('#template').text());
}
function template3() {
	document.getElementById("template").innerHTML="template3";
	$('#templateforValue').val($('#template').text());
}

<<<<<<< HEAD
function payment1(date) {
	document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			document.getElementById("payment").innerHTML+=value;
		},
	
	});
	
}
function payment2(date) {
	document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate2',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			document.getElementById("payment").innerHTML+=value;
		},
	
	});
}
function payment3(date) {
	document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate3',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			document.getElementById("payment").innerHTML+=value;
		},
	
	});
}
function payment4(date) {
	document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate4',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			document.getElementById("payment").innerHTML+=value;
		},
	
	});
=======
function payment1() {
	document.getElementById("payment").innerHTML="15,000";
	document.getElementById("days").innerHTML="30";
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	document.getElementById('purchaseInfo').submit();
}
function payment2() {
	document.getElementById("payment").innerHTML="30,000";
	document.getElementById("days").innerHTML="60";
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	document.getElementById('purchaseInfo').submit();
}
function payment3() {
	document.getElementById("payment").innerHTML="45,000";
	document.getElementById("days").innerHTML="90";
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	document.getElementById('purchaseInfo').submit();
}
function payment4() {
	document.getElementById("payment").innerHTML="60,000";
	document.getElementById("days").innerHTML="180";
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	document.getElementById('purchaseInfo').submit();
>>>>>>> master
}

</script>
<title>빅스타 서비스 구매 페이지</title>
</head>
<body>

<header class="w3-top">
	<%@ include file="../header.jsp" %>
</header>
<br><br><br><br>
<div class="services">
<section class="pricecol">
<div class="icon">
<i class="icon-magic"></i>
<img src="./resources/image/shirt2.png">
</div>



<h3><Span>Template1</span></h3>
<p>
<a class="button" onclick="template1()"><span>Pick</span></a>
</p>
</section>

<section class="pricecol">
<div class="icon">
<i class="icon-leaf"></i>
<img src="./resources/image/shoes.png">
</div>
<h3><Span>Template2</span></h3>
<p>
<a class="button" onclick="template2()"><span>Pick</span></a>
</p>
</section>

<section class="pricecol">
<div class="icon">
<i class="icon-link"></i>
<img src="./resources/image/hat.png">
</div>
<h3><Span>Template3</span></h3>
<p>
<a class="button" onclick="template3()"><span>Pick</span></a>
</p>
</section>
</div>

<br><br>

<div class="services">
<section class="pricecol1">
<h3><Span>30days</span></h3>
<ul>
<li>15,000</li>
</ul>
<p>
<a class="button" onclick="payment1('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
</p>
</section>

<section class="pricecol1">
<h3><Span>60days</span></h3>
<ul>
<li>30,000</li>
</ul>
<p>
<a class="button" onclick="payment2('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
</p>
</section>

<section class="pricecol1">
<h3><Span>90days</span></h3>
<ul>
<li>45,000</li>
</ul>
<p>
<a class="button" onclick="payment3('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
</p>
</section>

<section class="pricecol1">
<h3><Span>180days</span></h3>
<ul>
<li>60,000</li>
</ul>
<p>
<a class="button" onclick="payment4('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
</p>
</section>
</div>

<br><br><br><br>

<div>
Type: <p id="template"></p>
<br>
Payment: <p id="payment"></p>
<br>
Days: <p id="days"></p>
<br>
</div>

<br><br><br>

	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>
	<form action="purchaseInfo" method="post" id="purchaseInfo">  <!-- id="tem1" -->
		<input type="hidden" name="templateforValue" id="templateforValue">
		<input type="hidden" name="paymentforValue" id="paymentforValue">
		<input type="hidden" name="daysforValue" id="daysforValue">
	</form>
</body>
</html>