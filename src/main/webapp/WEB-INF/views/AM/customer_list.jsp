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
												<td class="pl-3">${customer.name}</td>
												<td class="pl-3">${customer.created_at}</td>
												<td class="pl-3">${customer.created_by}</td>
											</tr>
										</c:forEach>	
									</tbody>
								</table>
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
		});
	</script>
</body>