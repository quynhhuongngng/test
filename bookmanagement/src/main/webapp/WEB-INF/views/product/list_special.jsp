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


	@import
		url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css)
		;
	
	.col-item {
		border: 1px solid #E1E1E1;
		border-radius: 5px;
		background: #FFF;
	}
	
	.col-item .photo img {
		margin: 0 auto;
		width: 100%;
	}
	
	.col-item .info {
		padding: 10px;
		border-radius: 0 0 5px 5px;
		margin-top: 1px;
	}
	
	.col-item:hover .info {
		background-color: #F5F5DC;
	}
	
	.col-item .price {
		/*width: 50%;*/
		float: left;
		margin-top: 5px;
	}
	
	.col-item .price h5 {
		line-height: 20px;
		margin: 0;
	}
	
	.price-text-color {
		color: #219FD1;
	}
	
	.col-item .info .rating {
		color: #777;
	}
	
	.col-item .rating {
		/*width: 50%;*/
		float: left;
		font-size: 17px;
		text-align: right;
		line-height: 52px;
		margin-bottom: 10px;
		height: 52px;
	}
	
	.col-item .separator {
		border-top: 1px solid #E1E1E1;
	}
	
	.clear-left {
		clear: left;
	}
	
	.col-item .separator p {
		line-height: 20px;
		margin-bottom: 0;
		margin-top: 10px;
		text-align: center;
	}
	
	.col-item .separator p i {
		margin-right: 5px;
	}
	
	.col-item .btn-add {
		width: 50%;
		float: left;
	}
	
	.col-item .btn-add {
		border-right: 1px solid #E1E1E1;
	}
	
	.col-item .btn-details {
		width: 50%;
		float: left;
		padding-left: 10px;
	}
	
	.controls {
		margin-top: 20px;
	}
	
	[data-slide="prev"] {
		margin-right: 10px;
	}
	
	.row{
	justify-content: center;
	}
</style>

<div class="row" style="justify-content: center;">
	<div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel;" >
		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active"  >
				<div class="row">
					<div style="width: 50px; margin-left:20px;">
						<a style="font-size: 40px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-left" href="#carousel-example"
							data-slide="prev">
						</a>
					</div>
					<c:forEach var="p" items="${list}" begin="0" end="3">
						<div class="card-group" style="padding:25px 10px 25px 10px;">
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
					<div style="width: 50px; margin-right:20px;">
						<a style="font-size: 40px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-right"
							href="#carousel-example" data-slide="next"></a>
					</div>
				</div>
			</div>

			<div class="item"  >
				<div class="row">
					<div style="width: 50px; margin-left:20px;">
						<a style="font-size: 40px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-left" href="#carousel-example"
							data-slide="prev"></a>
					</div>
					<c:forEach var="p" items="${list}" begin="4" end="7">
						<div class="card-group"style="padding:25px 10px 25px 10px;">
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
					<div style="width: 50px; margin-right:20px;">
						<a style="font-size: 40px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-right"
							href="#carousel-example" data-slide="next">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<jsp:include page="dialog.jsp" />
