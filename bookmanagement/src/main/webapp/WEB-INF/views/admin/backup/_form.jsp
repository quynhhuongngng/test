<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h4 class="label label-success">${message}</h4>
<br>
<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="index" name="form" modelAttribute="entity"  method="get">
			<div class="form-group">
				<label>Tên file: </label> <input type="text" name="name" required="required" />
				<button class="btn btn-warning" formaction="${base}/backup">Backup</button>
			</div>
		</form:form>
	</div>
</div>

