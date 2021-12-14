<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><dec:title default="Master-Layout" /></title>

<!-- Favicons -->
<link
	href="<c:url value="/assets/user/img/logo/logo_ansv_big_new-removebg-preview.png" />"
	rel="icon">
<link href="<c:url value="/assets/user/img/logo/logo_ansv.png" />"
	rel="apple-touch-icon">

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/plugins/fontawesome-free/css/all.min.css' />">

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' />">

<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">

<!-- JQVMap -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/plugins/jqvmap/jqvmap.min.css' />">

<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/dist/css/adminlte.min.css' />">

<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/plugins/overlayScrollbars/css/OverlayScrollbars.min.css' />">

<!-- Daterange picker -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/plugins/daterangepicker/daterangepicker.css' />">

<!-- summernote -->
<link rel="stylesheet"
	href="<c:url value='/assets/user/plugins/summernote/summernote-bs4.min.css' />">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="<c:url value='/assets/user/dist/img/AdminLTELogo.png' />"
				alt="AdminLTELogo" height="60" width="60">
		</div>



		<!-- Navbar (Header) -->
		<%@include file="/WEB-INF/views/layouts/PM/header.jsp"%>
		<!-- /.navbar (Header) -->



		<!-- Main Sidebar Container (Menu) -->
		<%@include file="/WEB-INF/views/layouts/PM/menu.jsp"%>
		<!-- /.Main Sidebar Container (Menu) -->



		<!-- Content Wrapper. Contains page content -->
		<dec:body />
		<!-- /.content-wrapper -->



		<!-- Footer -->
		<%@include file="/WEB-INF/views/layouts/PM/footer.jsp"%>
		<!-- /.Footer -->



		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<%-- <script
		src="<c:url value='/assets/user/plugins/jquery/jquery.min.js' />"></script> --%>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="<c:url value='/assets/user/plugins/jquery-ui/jquery-ui.min.js' />"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value='/assets/user/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<!-- ChartJS -->
	<script
		src="<c:url value='/assets/user/plugins/chart.js/Chart.min.js' />"></script>
	<!-- Sparkline -->
	<script
		src="<c:url value='/assets/user/plugins/sparklines/sparkline.js' />"></script>
	<!-- JQVMap -->
	<script
		src="<c:url value='/assets/user/plugins/jqvmap/jquery.vmap.min.js' />"></script>
	<script
		src="<c:url value='/assets/user/plugins/jqvmap/maps/jquery.vmap.usa.js' />"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="<c:url value='/assets/user/plugins/jquery-knob/jquery.knob.min.js' />"></script>
	<!-- daterangepicker -->
	<script
		src="<c:url value='/assets/user/plugins/moment/moment.min.js' />"></script>
	<script
		src="<c:url value='/assets/user/plugins/daterangepicker/daterangepicker.js' />"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<c:url value='/assets/user/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js' />"></script>
	<!-- Summernote -->
	<script
		src="<c:url value='/assets/user/plugins/summernote/summernote-bs4.min.js' />"></script>
	<!-- overlayScrollbars -->
	<script
		src="<c:url value='/assets/user/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js' />"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/assets/user/dist/js/adminlte.js' />"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/assets/user/dist/js/demo.js' />"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="<c:url value='/assets/user/dist/js/pages/dashboard.js' />"></script>
	
	<script type="text/javascript">
		$( document ).ready(function() {
			var pathArray = window.location.pathname.split('/'); // Get item from url
			var get_role = pathArray[2]; // Get the third item
			var display_name = document.getElementById('display_name'),
				textContent = display_name.textContent;
			$("#display_name").text("${ role } | " + textContent);
			console.log(pathArray, get_role, textContent);
		});
	</script>
	
</body>
</html>
