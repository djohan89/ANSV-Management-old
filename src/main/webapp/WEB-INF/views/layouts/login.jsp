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
<title><dec:title default="Master-Layout" /></title>

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


						<dec:body />


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