<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | List VT</title>
</head>
<body>
	<div class="content-wrapper">
		<section class="content">
			<div class="container-fluid">
				<h2 class="text-center mt-3">Danh sách tài khoản</h2>
				<div class="row">
					<div class="table-responsive">
						<table class="table table-hover mt-3 ">
							<thead>
								<tr>
									<th>STT</th>
									<th>Username</th>
									<th>Name</th>
									<th>Role</th>
									<th>Created_by</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${users}" varStatus="index">
									<tr>
										<td>${index.count}</td>
										<td>${user.username }</td>
										<td>${user.display_name }</td>
										<td>${user.role }</td>
										<td>${user.created_by } <br>
											${user.created_at }
										</td>
										<td>
											<div class="btn-group btn-group" role="group"
												aria-label="Basic">
												<button class="btn btn-warning">
													<a href="./update_vt/${user.id }" style="color:#fff;">Update</a>
												</button>
												<button type="button" class="btn btn-danger"
													data-toggle="modal"
													data-target="#delete-course-modal-${index.count}">Xóa</button>
											</div> <!-- {{!-- Confirm delete courses --}} -->
											<div class="modal fade"
												id="delete-course-modal-${index.count}" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Modal
																title</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">Bạn có muốn xóa tài khoản
															người dùng ${user.display_name}</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Close</button>
															<button type="button" class="btn btn-danger">Xóa
																tài khoản</button>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</section>

	</div>
</body>
</html>