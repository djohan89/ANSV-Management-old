<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>AM | Create project</title>
</head>
<body>
	<div class="content-wrapper bg-white">
		<section class="content">
			<div class="container-fluid">
				<h2 class="text-center mt-3"><b>Tạo dự án</b></h2><br />
				<form>
					<div class="row">
						<div class="col-md-5">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="loai_du_an">Loại dự án</label>
								</div>
								<select class="custom-select" id="loai_du_an"
									onchange="typeObject(this);">
									<option selected>Choose...</option>
									<option value="2">Viễn thông</option>
									<option value="3">Chuyển đổi số</option>
								</select>
							</div>
						
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Tên dự án</span>
								</div>
								<input type="text" class="form-control" name="cr_name_project" id="cr_name_project"
									placeholder="Tên dự án...">
							</div>

							
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="khach_hang">Khách
										hàng</label>
								</div>
								<select class="custom-select" id="khach_hang">
									<option selected>Choose...</option>
									<c:forEach var="customer" items="${customers}">
										<option value="${customer.id }">${customer.name }</option> 
									</c:forEach>
									
								</select>
							</div>

							<div id="type_1">

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">Mô tả dự án</span>
									</div>
									<textarea id="cr_mo_ta_du_an" class="form-control"></textarea>
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">Tổng mức đầu tư</span>
									</div>
									<input type="text" class="form-control" id="tong_muc_dau_tu">
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">Hình thức đầu tư</span>
									</div>
									<input type="text" class="form-control" id="hinh_thuc_dau_tu">
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">Mức độ khả thi</span>
									</div>
									<input type="number" class="form-control" id="muc_do_kha_thi">
								</div>
								
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="priority">Priority</label>
									</div>
									<select class="custom-select" id="priority">
										<option selected>Choose...</option>
										<c:forEach var="priority" items="${priorities}">
											<option value="${priority.id }">${priority.name }</option> 
										</c:forEach>
									</select>
								</div>
								
								<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="status">Status</label>
										</div>
										<select class="custom-select" id="status">
											<option selected>Choose...</option>
											<c:forEach var="status" items="${status}">
												<option value="${status.id }">${status.name }</option> 
											</c:forEach>
										</select>
									</div>


							</div>

						</div>

						<div class="col-md-7">

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Phân tích SWOT</span>
								</div>
								<textarea id="cr_swot" class="form-control"></textarea>
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Tình trạng kế hoạch</span>
								</div>
								<textarea id="cr_tinh_trang" class="form-control"></textarea>
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Kết quả thực hiện</span>
								</div>
								<textarea id="cr_ket_qua" class="form-control"
									style="width: 100%;"></textarea>
							</div>

							

							

						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>

		</section>
	</div>
</body>