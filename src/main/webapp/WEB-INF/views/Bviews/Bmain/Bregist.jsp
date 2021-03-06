<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="width: 100%; height: 100%;">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" type="text/css" href="/bigstar/resources/css/sidebar.css?ver=1"/>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<script src="/bigstar/resources/js/jquery-ui.js"></script>
<style type="text/css">
.submit
{
  display: inline-block;
  font-size: 16px;
  line-height: 42px;
  width: 100px;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  float : right;
}

.submit:hover
{
  display: inline-block;
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}


ul{
margin-bottom: 0;
margin-top: 0;
}

input[type=checkbox]
{
  -webkit-transform: scale(2);
  padding: 10px;
}
.li
{
 background-color: #000000; 
 color: #ffffff; 
 font: bold;"
 margin: 3px;
 border-bottom: 1px solid white;
 padding: 9px;
 cursor: pointer;
}

.formli
{
	border-radius: 10px;
	
}
li{

margin-bottom: 5px;

}

.layer-li
{
 background-color: #000000; 
 color: #ffffff; 
 font: bold;"
 margin: 3px;
 border-bottom: 1px solid white;
 padding: 9px;
 cursor: pointer;
}

.ib{
 display: inline-block;
}

.ib5{
 display: inline-block;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	//버튼을 누를 때 색깔 바꾸기
	$('.li').on('click', changeColor);
	
	$('#text_go').on('click', goReg);
	$('.ui-dialog').remove();
	
	start();
	
	$('#verticalLayer').on('click', function(){
		$('#verticalLayer').css('background', "white");
		$('#tableLayer').css('background', "black");
		$('.ib').css('width', '100%');
		$('.ib5').css('width', '100%');
		$('#verticalLayer').css('border', '1px solid black');
	});
	
	$('#tableLayer').on('click', function(){
		$('#tableLayer').css('background', "white");
		$('#tableLayer').css('border', '1px solid black');
		$('#verticalLayer').css('background', "black");
		$('.ib').css('width', '200px');
		$('.ib5').css('width', '205px');
		
	});
	
	$('#tableLayer').css('background', "white");
	$('#tableLayer').css('border', '1px solid black');
});

function start() {
		$( function() { 		
			$( "#dialog" ).dialog({
			    autoOpen: true,
			    position:{
			        my:"center",
			        at:"right",
			        of:"#Bcenter" 
			        },
			    show: {
			      effect: "blind",
			      duration: 300
			    },
			    hide: {
			      effect: "explode",
			      duration: 300
			    }
			});
			$('#forHover').mouseleave(function(){
				$('#dialog').dialog( "close" );
			});
		});
}




$( "#dialog" ).position({
	  my: "right center",
	  at: "right center",
	  of: "document"
	});

function goReg(){ 
	var getId = document.getElementById('Bid');
	var getPw = document.getElementById('Bpw');
	var getPw2 = document.getElementById('Bpw2');
	var getAddress = document.getElementById('Baddress');
	var getHp = document.getElementById('Bhp');
	var getName = document.getElementById('Bname');
	var customerid = getId.value;
	
	if(getId.value.length > 0 && getId.value.length < 10)
	{
		if(getPw.value.length > 0 && (getPw.value == getPw2.value))
		{
			$.ajax({
				url: 'checkBcustomerId',
				type: 'post',
				data:{customerid: customerid},
				dataType:'text',
				success: function(getResult){
					if(getResult == '0')
					{
						document.getElementById('Bform').submit();	
						alert('가입신청이 완료되었습니다.');
					}
					else
					{
						alert('이미 존재하는 아이디입니다.');
					}
				}
			});
				
		}
		else
		{
			alert('비밀번호를 확인해주세요');
		}
	}
	else
	{
		alert('아이디는 20자 이내, 1자 이상으로 해주세요');
	}
	
}

function changeColor(){
	var color = $(this).attr('color');
	var id = $(this).attr('id');
	
	if(color == "black")
	{
		$(this).attr('color', "white");
		$(this).css('background', "white");
		$(this).css('border', '1px solid black');
				if(id == "address")
				{						
					$('#addRow').append('<li class="formli" id="Baddress"><div id="text_address" tabindex="0" class="ib5" style="width: 205px; background: #ffffff;">주소</div>'
					+ '<div class="ib"><input id="Baddress" class="forminput" style="width: 200px" name="customeraddress" required="required"></div></li>');
				}
				else if(id == "phone")
				{
					$('#addRow').append('<li class="formli" id="Bphone"><div id="text_hp" tabindex="0" class="ib5" style="width: 205px; background: #ffffff;">전화번호</div>'
							+ '<div class="ib"><input id="Bhp" class="forminput" style="width: 200px" name="customerhp" required="required"></div></li>');
				}
				else if(id == "name")
				{
					$('#addRow').append('<li class="formli" id="Bname"><div id="text_name" tabindex="0" class="ib5 forminput" style="width: 205px; background: #ffffff;">이름</div>'
							+ '<div class="ib"><input id="Bname" class="forminput" style="width: 200px" name="customername" required="required"></div></li>');
				}
	}
	else
	{
		$(this).attr('color', "black");
		$(this).css('background', "black");
		$(this).css('border', '1px solid white');
		
		if(id == "address")
		{
			$("#Baddress").remove();
		}
		else if(id == "name")
		{
			$("#Bname").remove();
		}
		else if(id == "phone")
		{
			$("#Bphone").remove();
		}
	}
}
</script>

</head>
<body style="text-align: center; width: 100%; height: 100%;">

<div style="display: inline-block;">

		<h1 id="text_title" tabindex="0" style="background: #ffffff">회원가입</h1>
		<hr>
		<form id="Bform" class="Bform" method="post" action="Bwellcome">
		<div style="display: inline-block; position: static; margin-top: 20px;">
				
			<ul style="list-style: none;">			
				<li class="formli" ><div id="text_id" class="ib" tabindex="0" style="width: 200px; background: #ffffff;">아이디</div> <div class="ib forminput"><input class="forminput" style="width: 200px; resize: auto; overflow: hidden;" id="Bid" name="customerid" required="required"></div></li>
				<li class="formli" ><div id="text_pw" class="ib" tabindex="0" style="width: 200px; background: #ffffff;">비밀번호</div> <div class="ib forminput"><input class="forminput" style="width: 200px;" type="password" id="Bpw" name="customerpw" required="required"></div></li>
				<li class="formli" ><div id="text_pw2" class="ib" tabindex="0" style="width: 200px; background: #ffffff;">비밀번호 확인</div> <div class="ib forminput"><input class="forminput" style="width: 200px;" type="password" id="Bpw2" required="required"></div></li>
				
			</ul>
			
			<ul style="list-style: none;" id="addRow">
								
							
			</ul>
					
		</div>
				<input type="hidden" id="membercode" name="membercode" value='${param.code }'>
		</form>
		<hr>

			<div id="text_main" tabindex="0" class="submitBt" style="margin: 10px; cursor: pointer;">
				메인으로
			</div>
			<div id="text_go" tabindex="0" class="submitBt" style="margin: 10px; cursor: pointer;">
				가입하기
			</div>

	
	<c:if test="${Amember.id != null }">	
		<%-- 다이어로그 --%>	
		<div id="dialog" title="편집 메뉴" style="width: 100%; height: 100%;">
			<h6>요소 추가하기</h6>
		    <ul style="list-style: none; display:inline;">
		    	<li class="li" id="address" color="black"><span>주소</span></li>
		    	<li class="li" id="phone" color="black"><span>전화번호</span></li>
		    	<li class="li" id="name" color="black"><span>이름</span></li>
		    </ul>
		    
		    <h6>배치 수정하기</h6>
		    <ul style="list-style: none; display:inline;">
		    	<li id="tableLayer" class="layer-li">테이블형 배치</li>
		    	<li id="verticalLayer" class="layer-li">수직형 배치</li>
		    </ul>
		</div>
		
		<div id="forHover" style="background: white; height: 400px; width: 60px; position: absolute; left: 5px; top: 100px;">
		</div>
	</c:if> 
</div>	
</body>
</html>