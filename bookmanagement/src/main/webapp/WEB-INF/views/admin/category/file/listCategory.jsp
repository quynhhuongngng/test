<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Bảng hiển thị dữ liệu</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">				
						<a class="btn  btn-primary" href="/admin/category/createCategory"> Create</a>
				</div>
				
						
				
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Loại sản phẩm</th>
								<th>Tên loại sản phẩm</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr class="odd gradeX">
									<td>${e.id}</td>
									<td>${e.name}</td>
									<td>${e.nameVN}</td>
									<td>
										<a class="btn btn-sm btn-info" href="${e.id}">Edit</a>
										<a class="btn btn-sm btn-danger" href="delete/${e.id}">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				

			</div>
		</div>
	</div>
</div>
