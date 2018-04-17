<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<script src="/bigstar/resources/js/jquery-ui.js"></script>
<style type="text/css">
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
 padding: 17px;
 cursor: pointer;
 
 
}
</style>

<script>

var counter = 0;
var dialog = $( "#dialog" ).dialog({
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
	
	
	
$(document).ready(function(){
	
	$('#addComponent').on('click', showAdder);
	$('.li').on('click', changeColor);
	$('#Bregister').on('click', goReg);
	$('.ui-dialog').remove();
	start();
	$('#forHover').mouseleave(function(){
		$(dialog).dialog( "close" );
//		$('#dialog').dialog();
	});
	
});

function start() {
	
	//if ($('#Bregister')) {
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
				$(dialog).dialog( "close" );
//				$('#dialog').dialog();
			});
		});
	//} 
	
	/* else {
		//$('#dialog').css("visibility", "hidden");
		$( "#dialog" ).dialog( "close" );
		return;
	} */
}


 
 /*    $( "#opener" ).on( "click", function() {
    		  $( "#dialog" ).dialog( "open" );
    }); */



$( "#dialog" ).position({
	  my: "right center",
	  at: "right center",
	  of: "document"
	});

function goReg(){
	document.getElementById('Bform').submit();
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
					$('#addRow').append('<tr id="Baddress"><th width="100px;">주소</th><td width="200px;"><input></td></tr>');
			
			function addRow(){
				$('#addRow').append('<tr class="rows" id="newrow'+ counter +'"><td width="100px;" id="regist_custom' + counter + '" tabindex="0">텍스트</td><td width="200px;"><input></td><td><input id="delete'+counter+'" class="rowsButton forDeleteBtn" type="button" value="삭제"></td></tr>');
				counter = counter + 1;
				$('.rowsButton').on("click", function() {
					 $(this).parent().parent().remove();
				});
			}
			$(document).mousedown(function(ev) {
				if (ev.which == 3) {
					if ($(this.activeElement).attr("id").startsWith("button") || $(this.activeElement).attr("id").startsWith("text") || $(this.activeElement).attr("id").startsWith("image") || $(this.activeElement).attr("id").startsWith("select") || $(this.activeElement).attr("id").startsWith("spinner")) {
						return false;
					} else {
						var inputString = prompt('변경할 텍스트를 입력해 주세요', 'none');
						if (inputString == 'none' || inputString == '' || inputString == null) {
							return false;
						} else {
							console.log($(this.activeElement).attr("id"));
							$(this.activeElement).text(inputString);
							return false;
						}
						return false;
					}
				}
				else if(id == "phone")
				{
					$('#addRow').append('<tr id="Bphone"><th width="100px;">전화번호</th><td width="200px;"><input></td></tr>');
				}
				else if(id == "name")
				{
					$('#addRow').append('<tr id="Bname"><th width="100px;">이름</th><td width="200px;"><input></td></tr>');
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

function showAdder(){
	
	
	$('#addRow').append('<tr class="rows" id="newrow'+ counter +'"><td width="100px;">텍스트</td><td width="200px;"><input></td><td><input id="delete'+counter+'" class="rowsButton" type="button" value="삭제"></td></tr>');
	counter = counter + 1;
	
	$('.rowsButton').on("click", function() {
		 $(this).parent().parent().remove();
	});
	
}





</script>

</head>
<body>



		<form id="Bform">
		<div style="display: inline-block; position: static; margin-top: 150px;">
				
					<table>
						<tr>
							<th width="100px;">아이디</th>
							<td width="200px;"><input id="Bid" name="Bid"></td>	
						</tr>
						
						<tr>
							<th width="100px;">비밀번호</th>
							<td width="200px;"><input type="password" id="Bpw" name="Bpw"></td>
						</tr>
						
						<tr>
							<th width="100px;">비밀번호 확인</th>
							<td width="200px;"><input type="password" id="Bpw2"></td>
						</tr>
					</table>
					
					<table id="addRow">
							
						
					</table>
					
				</div>
		</form>
				<br><br><br><br>
				
			<div style="margin: 30px;">
				<a id="Bregister">가입하기</a>
			</div>
		
	<div id="dialog" title="다음 중에서 요소를 추가하세요">
	    <ul style="list-style: none; display:inline;">
	    	<li class="li" id="address" color="black"><span>주소</span></li>
	    	<li class="li" id="phone" color="black"><span>전화번호</span></li>
	    	<li class="li" id="name" color="black"><span>이름</span></li>
	    </ul>
	</div>
	
	<div id="forHover" style="background: black; height: 400px; width: 30px; position: absolute; left: 5px; top: 100px;">

<!-- <button style="margin: 30px;" id="opener">요소추가</button> -->
	
</body>
</html>