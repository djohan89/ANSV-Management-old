<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>Customer | AM</title>
</head>
<body>
	<c:if test="${week < 10}">
		<c:url value="0${week}" var="week"/>
	</c:if>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-10">
						<c:url value="/AM/update_customer/" var="updateCustomer"/>
						<c:url value="/AM/insertCustomer/${week}_${year}" var="insertCustomer"/>
						<form:form action="${insertCustomer}" method="POST" modelAttribute="customer_form">
							<div class="btn-group btn-group" role="group" aria-label="Basic">
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#insert-course-modal">
									Thêm khách hàng
								</button>
							</div> <!-- {{!-- Confirm delete courses --}} -->
							<div class="modal fade" id="insert-course-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-user-plus"></i><span class="pl-3">Thêm khách hàng</span></h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form:input path="name" class="form-control" placeholder="Tên khách hàng..." />
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary" style="width: 20%;">Thêm</button>
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
										</div>
									</div>
								</div>
							</div>
						</form:form>
					</div>
					<!-- /.col -->
					<div class="col-sm-2">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="<c:url value='/AM/dashboard/${week}_${year}' />">Home</a></li>
							<li class="breadcrumb-item active">Customer</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Main row -->
				<div class="row">
					<div class="col-lg-12 col-sm-12">
						<div class="card" style="background: white">
							<div class="card-header border-0 d-flex flex-row">
								<div class="title-card w-100">
									<h3 class="card-title w-100">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Danh sách khách hàng của công ty</b>
									</h3>
								</div>
							</div>
							
							<c:url value="0" var="week_link"/>
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="table_customer" class="table table-striped" style="width: 100%;">
									<thead>
										<tr>
											<th width="6%">Mã</th>
											<th>Tên</th>
											<th width="13%">Ngày tạo</th> 
											<th width="22%">Người tạo</th>
											<th width="15%"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${customer}" var="customer" varStatus="customer_index">
											<tr>
												<td class="pl-3">
													<c:if test="${customer.id < 10}">
														0${customer.id}
													</c:if>
													<c:if test="${customer.id >= 10}">
														${customer.id}
													</c:if>
												</td>
												<td class="pl-3" id="name_${customer.id}">${customer.name}</td>
												<td class="pl-3">${customer.created_at}</td>
												<td class="pl-3">${customer.display_name}</td>
												<td>
													<c:if test="${customer.created_by == user_id}">
														<div class="btn-group btn-group" role="group" aria-label="Basic">
															<button type="button" class="btn btn-warning" data-toggle="modal" 
																data-target="#update-customer-modal" onclick="return set_form_update(${customer.id})">Cập nhật</button>
															<button type="button" class="btn btn-danger" data-toggle="modal" 
																data-target="#delete-customer-modal" onclick="return set_modal_delete(${customer.id})">Xóa</button>
														</div>
													</c:if>
												</td>
											</tr>
										</c:forEach>	
									</tbody>
								</table>
								
								<!-- Form cập nhật khách hàng -->
								<form:form action="${updateCustomer}" method="POST" modelAttribute="customer_form" id="form_update_customer">
									<div class="modal fade" id="update-customer-modal" tabindex="-1" role="dialog" 
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content" id="update_form">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">
														<i class="fas fa-exclamation-circle text-danger"></i>
														<span class="pl-1">Cập nhật</span>
													</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body" id="modal-body">
													<form:input path="id" id="input_id" class="form-control" />
													<form:input path="name" id="input_name" class="form-control" placeholder="Tên khách hàng..." />
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-warning">Cập nhật</button>
													<button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
												</div>
											</div>
										</div>
									</div>
								</form:form>
								
								<!-- Delete customer modal -->
								<div class="modal fade" id="delete-customer-modal" tabindex="-1" role="dialog" 
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													<i class="fas fa-exclamation-circle text-danger"></i>
													<span class="pl-1">Cảnh báo</span>
												</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body" align="center">
												Bạn chắc chắn muốn xóa khách hàng này?<br>
												<span class="pl-1 pr-1" style="font-size: 20px; font-weight: bold;" id="span_delete_name"></span>
											</div>
											<div class="modal-footer">
												<a href="#" class="btn btn-danger" id="delete_submit" 
													role="button">Có, xoá!</a>
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.row (main row) -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<script type="text/javascript">	
		$(document).ready(function(){
			$('#table_customer').DataTable( {
			    "scrollY": 350,
			    "scrollX": true,
			    "scrollCollapse": true,
			    "paging":         false,
			    "responsive": true,
			    "displayLength": 25,
			    "order": [[ 1, "asc" ]]
	
			});
			
			var save_success = 'save_success';
			var delete_success = 'delete_success';
			var update_success = 'update_success';
			var update_error = 'update_error';
			var url = window.location.href;
			if(url.indexOf('?' + save_success + '=') != -1) {
				alertify.success('Thêm khách hàng thành công!');
			}
			if(url.indexOf('?' + delete_success + '=') != -1) {
				alertify.success('Xoá khách hàng thành công!');
			}
			if(url.indexOf('?' + update_success + '=') != -1) {
				alertify.success('Cập nhật khách hàng thành công!');
			}
			if(url.indexOf('?' + update_error + '=') != -1) {
				alertify.error('Cập nhật khách hàng thất bại!');
			}
		});
		
		function set_form_update(id) {
			var name_id = "name_" + id;
			document.getElementById("form_update_customer").action = "../update_customer/" + id;
			document.getElementById("input_id").value = id;
			document.getElementById("input_name").value = document.getElementById(name_id).innerText;
		}
		
		function set_modal_delete(id) {
			var name_id = "name_" + id;
			var url_delete = "../delete_customer/" + id;
			document.getElementById("span_delete_name").innerText = document.getElementById(name_id).innerText;
			document.getElementById('delete_submit').setAttribute('href', url_delete);
			console.log("set_modal_delete");
		}
	</script>
</body>