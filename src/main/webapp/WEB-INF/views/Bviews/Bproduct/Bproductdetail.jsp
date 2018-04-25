<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(document).ready(function() {

		$('.wating_Img').mouseenter(function() {
			$('.showingImg').attr("src", $(this).attr("src"));
		});
		/* $('.wating_Img').mouseleave(function(){
			$('.showingImg').attr("src", "${productDetailList[1].productimage}");
		}); */
		/* $('.showingImg').css("z-index", 99999);
		$('.showingImg').mouseenter(function() {
			var width = $(this).css("width");
			var height = $(this).css("height");
			for (var int = 0; int < width.length; int++) {
				if (width.charAt(int) == 'p') {
					width = width.substring(0, int);
				}
			}
			for (var int = 0; int < height.length; int++) {
				if (height.charAt(int) == 'p') {
					height = height.substring(0, int);
				}
			}
			$(this).css("width", (width * 1.2) + "px");
			$(this).css("height", (height * 1.2) + "px");
		});
		$('.showingImg').mouseleave(function() {
			var width = $(this).css("width");
			var height = $(this).css("height");
			for (var int = 0; int < width.length; int++) {
				if (width.charAt(int) == 'p') {
					width = width.substring(0, int);
				}
			}
			for (var int = 0; int < height.length; int++) {
				if (height.charAt(int) == 'p') {
					height = height.substring(0, int);
				}
			}
			$(this).css("width", (width * 5 / 6) + "px");
			$(this).css("height", (height * 5 / 6) + "px");
		}); */
		
		//장바구니 추가
		$('#goCart').on('click', function(){
			var productcode = document.getElementById('productcode').value;
			var customercode = document.getElementById('customercode').value;
			//alert(productcode + '//' + customercode)
			
			$.ajax({
				url: 'insertCart',
				type: 'get',
				data: {productcode: productcode, customercode: customercode},
				success: function(){
					alert('장바구니에 추가되었습니다');
				},
				error: function(){
					alert('장바구니 추가에 실패했습니다');
				}
			});
		});
		
		
	});
</script>
<link rel="stylesheet" href="./resources/css/Bpage/Bproductdetail.css"/>
<script type="text/javascript">


function gopurchaseform() {
	location.href="Bpurchaseform";
}

</script>

<style type="text/css">

.productQty
{
	width: 50px;
	height: 27px;
	text-align: center;
}
</style>


<title>Insert title here</title>
</head>
<body>
	<input id="productcode" type="hidden" value="${productcode }">
	<input id="customercode" type="hidden" value="${Blogin.customercode}">
	<div class="wrapper">
        <div class="a">
            <diV class="half_detail_Info_Img">
                <div class="show_Img">
                    <img class="showingImg" src="${productDetailList[0].productimage}" style="width: 380px; margin: inherit;">
                </div>
                <div class="wating_Img_place">
                    <!-- <img class="wating_Img img1" onclick="switchImg(this.src)" src="./resources/img/c1.jpg"> -->
                    <img class="wating_Img img1" onclick="switchImg(this.src)" src="${productDetailList[0].productimage}">
                	<img class="wating_Img img2" onclick="switchImg(this.src)" src="${productDetailList[1].productimage}">
                </div>
            </diV><!-- 이미지 프리뷰 -->
            
            <div class="half_detail_Info_Text">
                <form action="detailaddOrder.do">
                    <div class="info_box1">
                        <p class="product_name">
                            <h3><%-- ${productDetailList[0].productname} --%></h3>
                        </p>
                    </div>
                    <br>
                    <table class="Info_table">
                        <tr>
                            <td>상품명</td>
                            <td><h3 style="text-align:justify;margin-top: 15px;">${productDetailList[0].productname}</h3></td>
                        </tr>
                        <tr>
                            <td>가격</td>
                            <td><fmt:formatNumber value="${productDetailList[0].productprice}" type="currency"/></td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>30,000원 이상 무료, 미만 2,500원</td>
                        </tr>
                        <tr>
                            <td>선택사항</td>
                            <td style="size: 5px;">색상 및 사이즈를 선택해 주세요 <br> 
                            	<select class="option_selecter" id="color_selecter" onchange="color_select(this.value)">
                                      <c:forEach var="product" items="${productDetailList }" varStatus="loopStat">
									 	<option value="${product.productcode}">${product.productcolor}, ${product.productsize}</option>
									 </c:forEach>      
                                </select>
                            </td>
                        </tr>
                        <tr style="margin-bottom: 30px;">
                        <td>수량</td>
                        <td><input type="number" class="productQty" min="0" max="50" step="1" value="0" size="6" name="productQty"></td>
                        
                        </tr>
                        
                        <%-- <tr>
                            <td>사이즈</td>
                            <td>사이즈를 선택해 주세요 <br> <select class="option_selecter"
                                id="size_selecter" onchange="size_select(this.value)">
									 <c:forEach var="size" items="${productDetailList }" varStatus="loopStat">
									 	<option value="${size.productsize}">${size.productsize}</option>
									 </c:forEach>
                                </select>
                            </td>
                        </tr> --%>
                        <!-- <tr>
                            <td colspan="2">옵션은 5개 까지 추가 가능합니다 &nbsp;&nbsp;&nbsp;
                                <button type="button" onclick="valueShow()" class="evtBtn">옵션추가</button>
                            </td>
                        </tr> -->
                        <!-- <tr id="amount_set_TR">
                            <td colspan="2" class="amount_set_TD"></td>
                        </tr> -->
                    </table>
                    <br>
	                    <input type="hidden" name="index">
	                    <input type="hidden" id="base_price">
	                    <input type="hidden" id="p_common_name">
	                    <input type="hidden" name="r_no">
                    <button type="submit" class="pageMoveBtn" onclick="gopurchaseform()">바로 주문</button>
                </form>
                <form action="addBasket.do" class="cartData">
                    <input type="hidden" name="index">
                    <button id="goCart" type="button" class="pageMoveBtn">장바구니</button>
                </form>

                <div class="detail_toolBox">
                    <a onclick="changeAction_place(this.id)" id="product_info">
                    	<div class="tool">
                        	<p>상세 설명</p>
                    	</div>
                    </a> 
                    <%-- <a href="getReviewList.do?r_no=${ProductOne.r_no }" target="action_place" onclick="changeAction_place(this.id)" id="product_iframe"> --%>
                    <a href="productReview" target="action_place" onclick="changeAction_place(this.id)" id="product_iframe">
                    	<div class="tool">
                        	<p>상품 후기</p>
                    	</div>
                    </a> 
                    <a href="getInqueryList.do?r_no=${ProductOne.r_no }" target="action_place" onclick="changeAction_place(this.id)" id="product_iframe">
                    	<div class="tool">
                        	<p>상품 문의</p>
                    	</div>
                    </a> 
                    <a onclick="changeAction_place(this.id)" id="delivery_info">
                    	<div class="tool">
                        	<p>배송 정보</p>
                    	</div>
                    </a>
                </div>
                <br>
			</div>
           </div><!-- 주문 디테일 -->
        </div>
        <div style="margin: auto;">
			<%@include file="ProductReview.jsp" %>
		</div>
        <div class="product_img_place">
            <!-- 상세 이미지 -->
        </div>
      
        
        <script type="text/javascript">
        function switchImg(src) {
            $('.showingImg').attr('src', src);
        }
        </script>
        
</body>
</html>