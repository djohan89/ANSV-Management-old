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

 	<!-- dataTable -->
  	<link rel="stylesheet"
    	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"/>
	<!--Script databasetable  -->
	<script src="<c:url value='/assets/user/plugins/jquery/jquery.min.js' />"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<%-- <script src="<c:url value='/assets/user/vendor/bootstrap4-handmade/bootstrap.min.js' />"></script> --%>

  	<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	
	<style type="text/css">
		table,table label, table thead{
      		font-size: 14px;
   		}
	    table.dataTable thead .sorting:after,
	    table.dataTable thead .sorting:before,
	    table.dataTable thead .sorting_asc:after,
	    table.dataTable thead .sorting_asc:before,
	    table.dataTable thead .sorting_asc_disabled:after,
	    table.dataTable thead .sorting_asc_disabled:before,
	    table.dataTable thead .sorting_desc:after,
	    table.dataTable thead .sorting_desc:before,
	    table.dataTable thead .sorting_desc_disabled:after,
	    table.dataTable thead .sorting_desc_disabled:before {
	      bottom: .5em;
	      font-size: 14px;
	    }
	    .table{
	      min-width: 100% ;
	    }
	    a.nav-link {
	        padding-left: 6px;
	    }
	    .change_font_size {
	      font-size: 11px;
	    }
	    .dataTables_scrollHeadInner {
	      min-width: 100%;
	    }
	    @media screen and (max-width: 1023px){
	      body .modal-content {
	      width: 100%;
	      position: absolute;
	      }
	    }
	
	    @media screen and (min-width: 1024px){
	      body .modal-content {
	      width: 220%;
	      position: absolute;
	      left: -50%;
	      }
	    }
	
	    .card-header{
	      background-color: rgb(0 0 0 / 25%);
	    }
	    
	    .dataTables_scrollHeadInner {
			min-width: 96%;
		}
	
		.table {
			min-width: 100%;
		}
		
		.tooltip_css {
		  	color: black;
		}
		
		.tooltip_css .tooltiptext {
			font-size: 11px;
		  	visibility: hidden;
		  	width: 77%;
		  	color: #fff;
		  	text-align: left;
		  	border-radius: 6px;
		  	padding: 5px 6px;
			left:20%;
		  	/* Position the tooltip */
		  	position: absolute;
		  	z-index: 1;
		  	
		  	/* Xuống dòng */
		  	/* white-space: pre-wrap; */
		  	
		  	/* Khung viền */
		  	border: 2px solid;
		  	border-color: black;
		}
		
		.tooltip_css:hover .tooltiptext {
		  	visibility: visible;
		}
		
		.dropdown-item:hover {     
  				background-color: #007bff;  
  				color: #FFFFFF;  
  				font-weight: bold;
		}
		.thong-ke-click {
			color: #007bff !important;
			font-size: 22px;
			padding-top: 3px;
			margin-right: -10px;
		}
		
		.badge-statistics {
			min-width: 23px;
		}
	</style>
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
		<%@include file="/WEB-INF/views/layouts/chief/header.jsp"%>
		<!-- /.navbar (Header) -->



		<!-- Main Sidebar Container (Menu) -->
		<%@include file="/WEB-INF/views/layouts/chief/menu.jsp"%>
		<!-- /.Main Sidebar Container (Menu) -->



		<!-- Content Wrapper. Contains page content -->
		<dec:body />
		<!-- /.content-wrapper -->



		<!-- Footer -->
		<%@include file="/WEB-INF/views/layouts/chief/footer.jsp"%>
		<!-- /.Footer -->



		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	
	
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
			/* var pathArray = window.location.pathname.split('/'); // Get item from url
			var get_role = pathArray[2]; // Get the third item
			var display_name = document.getElementById('display_name'),
				textContent = display_name.textContent;
			$("#display_name").text("${ role } | " + textContent); */
			/* console.log(pathArray, get_role, textContent); */
			
			
			
			// Jquery: Menu dropdown cho phần hiển thị tên đăng nhập (menu)
			$("#display_name").click(function () {
				var element = document.getElementById("arrow_icon");
				var check_class = element.classList.contains('fa-angle-left');
				if (check_class == true) {
					element.classList.remove("fa-angle-left");
					element.classList.add("fa-angle-down");
				} else {
					element.classList.remove("fa-angle-down");
					element.classList.add("fa-angle-left");
				}
		    });
			$(".tree-toggle").click(function () {
		        $(this).parent().children("ul.tree").toggle(200);
		    });
		    $(function () {
		        $(".tree-toggle").parent().children("ul.tree").toggle(200);
		    });
		    
		    
			
			$('.menu-click').click(function(){
				if ($(this).children('.nav-link').hasClass( "active" )){
					$(this).children('.nav-link').removeClass("active");
				} else {
					$(this).children('.nav-link').addClass("active");
				}
			});
			
			// Jquery: Thay đổi icon arrow cho menu dọc (phần thống kê)
			$('.thong-ke').click(function(){
				/* if (!$(this).parent().children('div').hasClass("show")) {
					$(this).parent().children('div').addClass("show");
				} */
				
				if ($(this).children('i').hasClass("fa-angle-left")){
					$(this).children('i').removeClass("fa-angle-left");
					$(this).children('i').addClass("fa-angle-down");
				}
				
				if ($(this).children('i').hasClass("fa-angle-down") && $(this).parent().children('div').hasClass("show")){
					$(this).children('i').removeClass("fa-angle-down");
					$(this).children('i').addClass("fa-angle-left");
				}
				
				if ($(this).hasClass("thong-ke-click") && $(this).parent().children('div').hasClass("show")){
					$(this).removeClass("thong-ke-click");
				} else {
					$(this).addClass("thong-ke-click");
				}
				
				
			});
			
			// Jquery: Ngăn chặn việc đóng menu khi click vào item (phần thống kê)
			$(document).on('click', '.not-close', function (e) {
			  	e.stopPropagation();
			});
			
			$('.nav-link').click(function(){
				if (!$(this).hasClass("thong-ke")){
					$('.nav-item, .dropdown').find('.thong-ke-click').removeClass("thong-ke-click");
					$('.nav-item, .dropdown').find('.fa-angle-down').addClass("fa-angle-left");
					$('.nav-item, .dropdown').find('.fa-angle-down').removeClass("fa-angle-down");
				}
			});
			
		});
	</script>
	
</body>
</html>
