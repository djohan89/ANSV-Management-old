<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>
	<c:if test="${ not empty message }">Login Error</c:if>
	<c:if test="${ empty message }">Login</c:if>
</title>

<!-- plugins:css -->
<link rel="stylesheet"
	href="<c:url value='/assets/login/css/materialdesignicons.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/assets/login/css/ionicons.css' />">
<link rel="stylesheet"
	href="<c:url value='/assets/login/css/flag-icon.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/assets/login/css/vendor.bundle.base.css' />">
<link rel="stylesheet"
	href="<c:url value='/assets/login/css/vendor.bundle.addons.css' />">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="<c:url value='/assets/login/css/style.css' />">
<!-- endinject -->
<link rel="shortcut icon"
	href="<c:url value='/assets/login/img/favicon.ico' />" />
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<div class="auto-form-wrapper">
							<div class="form-group">
								<p align="center">
									<font size="+3" color="#FF6600"><b>ANSV Management</b></font>
								</p>
							</div>
							<form name='loginForm'
								action="<c:url value='/admin/j_spring_security_login' />"
								method='POST'>
								<div class="form-group">
									<label class="label">Tên đăng nhập<dec:body /></label>
									<div class="input-group">
										<input type="text" name='username' class="form-control"
											placeholder="Tên đăng nhập">
										<div class="input-group-append">
											<span class="input-group-text"> <i
												class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="label">Mật khẩu</label>
									<div class="input-group">
										<input type="password" name='password' class="form-control"
											placeholder="*********">
										<div class="input-group-append">
											<span class="input-group-text"> <i
												class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<button type="submit"
										class="btn btn-primary submit-btn btn-block">Đăng
										nhập</button>
									<c:if test="${ not empty message }">
										<p align="center">
											<font color="red" size="2"><i>${message}</i></font>
										</p>
									</c:if>
								</div>
								<div class="form-group d-flex justify-content-between">
									<div class="form-check form-check-flat mt-0">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input" checked> Ghi
											nhớ
										</label>
									</div>
									<a href="#" class="text-small forgot-password text-black">Quên
										mật khẩu</a>
								</div>

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

							</form>
						</div> 
						<ul class="auth-footer">
							<li><a href="#">Điều kiện</a></li>
							<li><a href="#">Trợ giúp</a></li>
							<li><a href="#">Điều khoản</a></li>
						</ul>
						<p class="footer-text text-center">copyright © 2020 ANSV. All
							rights reserved.</p>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="<c:url value='/assets/login/js/vendor.bundle.base.js' />"></script>
	<script
		src="<c:url value='/assets/login/js/vendor.bundle.addons.js' />"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="<c:url value='/assets/login/js/off-canvas.js' />"></script>
	<script src="<c:url value='/assets/login/js/misc.js' />"></script>
	<!-- endinject -->
	<script src="<c:url value='/assets/login/js/jquery.cookie.js' />"
		type="text/javascript"></script>

</body>
</html>