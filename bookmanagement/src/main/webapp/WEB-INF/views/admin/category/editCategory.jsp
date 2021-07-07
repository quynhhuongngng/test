<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<form:form action="${base}/index" modelAttribute="entity" role="form">
							<div class="form-group">
								<label>Loại sản phẩm (Sách hay phụ kiện tặng kèm):</label>
								<form:input path="name" class="form-control" required="required" pattern=".{4,}" title="Tên loại phải từ 4 ký tự trở lên"/>
							</div>
							<div class="form-group">
								<label>Tên loại sản phẩm:</label>
								<form:input path="nameVN" class="form-control" pattern=".{4,}" title="Tên hãng phải từ 4 ký tự trở lên"/>
							</div>
							<div class="form-group">
								<form:hidden path="id" />
								<button class="btn btn-warning" formaction="update">Update</button>
								<a class="btn btn-default" href="index">Back to list</a>
							</div>

						</form:form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>