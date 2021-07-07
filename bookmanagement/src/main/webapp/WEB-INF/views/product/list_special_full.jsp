<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<style>
	.card:hover{ 
		-webkit-box-shadow: 1px 1px 40px 1px red;
		-moz-box-shadow: 1px 1px 40px 1px red;
		box-shadow: 1px 1px 40px 1px red;
	}
	
	.caption-picture{
		display: flex;
		flex-direction: column;
		flex-wrap: nowrap;
		justify-content: flex-start;
		align-items: center;
		align-content: stretch;
	}
	
	.discount{
		padding-left: 230px
	}
	
	.card-img-top{
		width: 55%;
		height: 100%;
	}
	
	.card-body{
		display: flex;
		flex-direction: column;
		flex-wrap: nowrap;
		justify-content: space-between;
		align-items: center;
		align-content: stretch;
	}
	.caption-price{
		width: 200px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		
	}
	.book-name{
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    width: 100%;
	    color: #44e2ff;
	    text-transform: uppercase;
	}
</style>
	<div class="gia-soc1" style="margin-top: 30px;">
		<h3 class="title">
			<b>DANH SÁCH SẢN PHẨM NỔI BẬT</b>
		</h3>
		<div class="row" style="padding: 20px; margin-top: -10px; height: auto; justify-content: center;">
			<c:forEach var="p" items="${list}">
				<div class="card-group" style="padding-top: 25px;  padding-left: 15px; justify-content: center;">
					<div class="card" style="width: 27rem;">
						<a href="/product/detail/${p.id}" class="caption-picture" >
							<div class="discount">
								<c:choose>
									<c:when test="${p.discount > 0 }">
										<p style="background-color: red; width: 35px; height: 35px; text-align: center; align-items: flex-end;position: relative;border-radius: 30px">
											<span style="margin-left: -29px;margin-top: 10px;font-size: 14px;position: absolute;color: #fff;">-<f:formatNumber
													value="${p.discount}" type="percent" />
											</span>
										</p> 
									</c:when>
									<c:otherwise>
										<p style="background-color: white; width: 35px; height: 35px; text-align: center; float: right;position: relative;border-radius: 30px">
											<span style="margin-left: -29px;margin-top: 10px;font-size: 14px;position: absolute;color: #fff;">-<f:formatNumber
													value="${p.discount}" type="percent" />
											</span>
										</p>
									</c:otherwise>
								</c:choose>	
							</div>
							<img class="card-img-top" src="/static/images/products/${p.image}" title="${p.name}">		
						</a>
						<div class="card-body">
							<div class="caption-price">
								<p style="padding: 3px; text-align: center; color: black;" class="book-name">
									<b>${p.name}</b>
								</p>
								<p style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
									<c:choose>
										<c:when test="${p.discount <= 0 }">
											<span style="text-align: left; font-weight: bold;color:red"><f:formatNumber
													value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
										</c:when>
										<c:otherwise>
											<span
												style="text-decoration: line-through; color: Gray; font-weight: bold;">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" /> VNĐ
											</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${p.discount > 0 }">
											<span style="margin-left: 5px; font-weight: bold;color:red"> <f:formatNumber
													value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" />
												VNĐ
											</span>
										</c:when>
										<c:otherwise>
				
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div data-id="${p.id}" class="caption-button" style="margin-top: -5px">
								<button class="btn btn-sm btn-danger btn-add-to-cart">
									<i class="glyphicon glyphicon-shopping-cart"></i>
								</button>
								<button class="btn btn-sm btn-warning btn-star">
									<i class="glyphicon glyphicon-star"></i>
								</button>
								<button class="btn btn-sm btn-success btn-open-dialog"
									data-toggle="modal" data-target="#myModal">
									<i class="glyphicon glyphicon-envelope"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<jsp:include page="dialog.jsp" />
