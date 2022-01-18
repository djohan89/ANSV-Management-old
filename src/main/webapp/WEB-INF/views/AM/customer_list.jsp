<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>Customer | AM</title>
</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-10"></div>
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
						<div>
							
						</div>
						<!-- Map card -->
						<div class="card" style="background: white">
							<div class="card-header border-0 d-flex flex-row">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Danh sách khách hàng của công ty</b><br>
									</h3>
								</div>
							</div>
							
							<c:url value="0" var="week_link"/>
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="table_customer" class="table table-striped" style="width: 100%;">
									<thead>
										<tr>
											<th>Mã</th>
											<th>Tên</th>
											<th>Ngày tạo</th> 
											<th>Người tạo</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${customer}" var="customer" varStatus="customer_index">
											<tr>
												<td>CUS_${customer.id}</td>
												<td>${customer.name}</td>
												<td>${customer.created_at}</td>
												<td>${customer.created_by}</td>
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
			    "scrollY": 300,
			    "scrollX": true,
			    "scrollCollapse": true,
			    "paging":         false,
			    "responsive": true,
			    "displayLength": 25,
	
			});
		});
	</script>
</body>