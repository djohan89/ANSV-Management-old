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

<!-- Datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<!-- === Select 2 === -->
	<link href="<c:url value="/assets/user/vendor/select2/css/select2.min.css" />" rel="stylesheet" />

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
	    
	    .nav-item a.icon{
	    	display: none;
	    	color: #f2f2f2;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
	    }
	    .dp-il{
	    display: inline-block;}
	    a.nav-link {
	        padding-left: 6px;
	        display: inline-block;
	    }
	    .change_font_size {
	    	font-size: 11px;
	    }
	    .dataTables_scrollHeadInner {
	    	min-width: 100%;
	    }
	    /*Màn hình mobile  */
	    @media screen and (max-width: 1023px){
	      body .modal-content {
	      	width: 100%;
	      	position: absolute;
	      }
	      #thong-ke,#fullScreen{
	      	display: none;	
	      }
	      .topnav #li_1{
	      	display:none; 
	      }
	      #detail_slide_1{
	      	display: block;
	      }
	      #detail_slide{
	      	display: none;
	      }
	     
	      .topnav .nav-item a.icon{
	      	display: inline-block;
	      	position: absolute;
	      	right: 0;
	      	top:0;
	      	
	      }
	      .topnav.responsive {
	      	position: relative;
	      	width:100%;
	      	padding-left: 0;
	      
	      }
	      
	      .topnav.responsive #li_1 {
		    float: none;
		    display: block;
		    text-align: left;
		    margin-left: 10%;
		    margin-top: 3%;
		  }
	      
	    }
		/* End màn hình mobile */
		/* Màn hình desktop */
	    @media screen and (min-width: 1024px){
	      body .modal-content {
	      width: 230%;
	      position: absolute;
	      left: -55%;
	      }
	      #thong-ke,#fullScreen{
	      	display: block;	
	      }
	      .topnav #li_1 {
		    display: none;
		   
		  }
		  #detail_slide_1{
		  	display: none;
		  }
		  #detail_slide{
		  	display: block;
		  }
	    }
	    /* End màn hình desktop */
	
	    .card-header{
	      background-color: rgb(0 0 0 / 25%);
	    }
	    .overflow{
	    	height: 383px;
	    	overflow: auto;
	    	border-bottom: 1px solid lightgray;
	    }
	    .overflow_mb{
	    	height: 200px;
	    	overflow: auto;
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
		
		.dropdown1{
			left: 100% !important; 
			transform: translate3d(-120px, 38px, 0px) !important;
		}
		figcaption {
		    font-size: 14px;
		    text-align: center;
		    font-style: italic;
		    
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
		ul li{
		list-style-type: none;}
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
		.badge-statistic {
			min-width: 21px;
		}
		 
		.select2-container--default .select2-selection--single{
	        margin-left: 10px;
	        padding: 2px 0;
	        height: 30px;
	        width: 65px; 
	        font-size: 1.2em;  
	        position: relative;
	    }
	    .select2-container {
			margin-right: 10px;
		}
	    
	    span[data-select2-id="1"].select2-container--default .select2-selection--single,span[data-select2-id="1"]{
	    	width: 55px !important;
	    }
	    span[data-select2-id="2"].select2-container--default .select2-selection--single,span[data-select2-id="2"]{
	    	width: 70px !important;
	    }
	    
	    .select2-container--default .select2-dropdown.select2-dropdown--below {
	        margin-left: 10px;
	    }
	    
	    .select2-container--default .select2-selection--single {
	    	width: 60px !important;
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
	
<!-- === Select 2 === -->
	<script src="<c:url value="/assets/user/vendor/select2/js/select2.min.js" />"></script>
	
	<!-- jQuery UI 1.11.4 -->
	<script
		src="<c:url value='/assets/user/plugins/jquery-ui/jquery-ui.min.js' />"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="<c:url value='/assets/user/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		
	<!--CkEditor  -->
	<script src="<c:url value='/assets/user/plugins/ckeditor/ckeditor.js' />"></script>
	<script src="<c:url value='/assets/user/plugins/ckeditor/adapters/jquery.js' />"></script>
		
	<!-- ChartJS -->
	<script src="<c:url value='/assets/user/plugins/chart.js/Chart.min.js' />"></script>
	<!-- Sparkline -->
	<script src="<c:url value='/assets/user/plugins/sparklines/sparkline.js' />"></script>
	<!-- jQuery Knob Chart -->
	<script src="<c:url value='/assets/user/plugins/jquery-knob/jquery.knob.min.js' />"></script>
	<!-- daterangepicker -->
	<script src="<c:url value='/assets/user/plugins/moment/moment.min.js' />"></script>
	<script src="<c:url value='/assets/user/plugins/daterangepicker/daterangepicker.js' />"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script src="<c:url value='/assets/user/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js' />"></script>
	<!-- Summernote -->
	<script src="<c:url value='/assets/user/plugins/summernote/summernote-bs4.min.js' />"></script>
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
		/* function abc() {
			console.log(document.getElementById("file_idid").value);
			var form = new FormData();
			form.append("file", document.getElementById("file_idid").files[0]);

			var settings = {
			  	"url": "http://10.2.8.31:3000/upload",
			  	"method": "POST",
			  	"timeout": 0,
			  	"processData": false,
			  	"mimeType": "multipart/form-data",
			  	"contentType": false,
			  	"data": form
			};
	
			$.ajax(settings).done(function (response) {
			  	console.log(response);
			});
		} */
		
		/* function abcabc() {
			window.open('http://10.2.8.31:3000/download?file=' + document.getElementById("text_text").value);
		} */
	
		$( document ).ready(function() {
			
			/* var abc = {"error_code":0,"fileType":"Triển khai","fileTypeCode":0,"err_desc":null,"data":[{"stt":1,"duan":"Cung cấp dịch vụ CNTT Hosting các hệ thống của Cổng thông tin điện tử Chính phủ","sohopdong":"211213-02/KHDN QLDA- ANSV/HĐDV","masoketoan":"","khachhang":"Vinaphone","giatri":11700000000,"sotiendac":"","dachopdong":"","muctieudac":"","dacthucte":"","songayconlaidac":"","sotienpac":"","pachopdong":"","muctieupac":"","pacthucte":"","songayconlaipac":"","sotienfac":"","fachopdong":"","muctieufac":"","facthucte":"","songayconlaifac":"","tiendochung":"Hợp đồng ký tính từ ngày 13/12/2021.\r\nThời hạn cho thuê 36 tháng kể từ ngày nghiệm thu hệ thống.","khokhan":"1. Chưa có tiến độ cuối cùng (Liên quan hàng hóa bị chậm) và VPCP chưa chốt phương án triển khai để dự kiến thời gian gia hạn thực hiện HĐ.\r\n2. Hàng Router dự kiến đầu tháng 7 mới về tới ANSV","giaiphap":"1. BDC đang đàm phán với VNP để gia hạn thời gian hợp đồng.\r\n2. BDC trao đổi với NCC để đẩy nhanh tiến độ giao hàng.","priority":"Third","status":"Low","pic":"Hoàng Trọng Phúc","phoban":"Trần Văn Hùng","ketquathuchientuantruoc":"Triển khai thiết bị đang lắp đặt tại LAB sẽ bắt đầu theo các khung thời gian sau:\r\n- 04/05/2022 - 13/05/2022: Triển khai cài đặt hạ tầng.\r\n- 16/05/2022-20/05/2022: thực hiện tối ưu","ketquathuchientuannay":"","kehoachtuannay":" _Đã phối hợp hoàn thiện các yêu cầu về thông tin quy hoạch, năng lực dự phòng mở rộng của hệ thống sang VNP để chuyển sang VPCP.\r\n- DBC đang trong quá trình đàm phán với VNP trong việc gia hạn thực hiện hợp đồng.","kehoachtuansau":""},{"stt":2,"duan":"Cung cấp và lắp đặt thiết bị Firewall mới thay thế thiết bị F5 4000 lỗi tại IDC An Đồn","sohopdong":"006 -2022/BQLDA-ANSV VNPT IT","masoketoan":"","khachhang":"VNPT IT","giatri":2200000000,"sotiendac":"","dachopdong":"","muctieudac":"","dacthucte":"","songayconlaidac":"","sotienpac":"","pachopdong":"","muctieupac":"","pacthucte":"","songayconlaipac":"","sotienfac":2024470800,"fachopdong":"27 / 04 / 2022","muctieufac":"25 / 04 / 2022","facthucte":"","songayconlaifac":0,"tiendochung":"1. Hoàn thành ký FAC.\r\n2.Chuyển hồ sơ thanh toán FAC tới ban QLDA ","khokhan":"","giaiphap":"","priority":"Medium","status":"Second","pic":"Nguyễn Anh Tuấn","phoban":"Nguyễn Hoài Nam","ketquathuchientuantruoc":"Chuyển hồ sơ thanh toán FAC tới ban QLDA - ngày 19/4/2022","ketquathuchientuannay":"","kehoachtuannay":"Push ký hồ sơ thanh toán, push thanh toán","kehoachtuansau":""}]};
			
			$.ajax({
				type: "POST",
				url: "http://10.2.8.31:3000/export",
				data: JSON.stringify(abc),
				headers: {
					"content-type": "application/json"
				},
				success: function(data) {
					console.log(data.data.file);
					window.open('http://10.2.8.31:3000/download?file=' + data.data.file);
					document.getElementById("text_text").value = data.data.file;
				},
				error: function(e) {
					console.log("ERROR: ", e);
				}
			}); */
			
			var pathArray = window.location.pathname.split('/'); // Get item from url
			var get_data_id_url = pathArray[4]; // Get the fifth item
			var week_from_url = get_data_id_url.slice(0,2);
			var year_from_url = get_data_id_url.slice(3,7);
			console.log(week_from_url, year_from_url);
			
			
			
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
			
			let now = new Date();
			let onejan = new Date(now.getFullYear(), 0, 1);
			let tuan_nay = Math.ceil((((now.getTime() - onejan.getTime()) / 86400000) + onejan.getDay() - 1) / 7);
			
			
			
			/* ===== Đầu: Thiết lập select 2 cho phần Header ===== */
			$('#select_week').select2();
			$('#select_year').select2();
			var week_option = "";
			var year_option = "";
			
			for (let i = 2020; i <= 2022; i++) {
				if (i == year_from_url) {
					year_option += '<option value="' + i + '" selected>' + i + '</option>';
				} else {
					year_option += '<option value="' + i + '">' + i + '</option>';
				}
			}
			document.getElementById("select_year").innerHTML = year_option; // Nhúng HTML cho dữ liệu Select2 (year)
			
			var value_option_week = "";
			for (let i = 1; i <= 53; i++) {
				if (i < 10) {
					value_option_week = value_option_week + "0" + i;
				} else {
					value_option_week = i;
				}
				
				if (i == week_from_url) {
					week_option += '<option value="' + value_option_week + '" selected>' + i + '</option>';
				} else {
					week_option += '<option value="' + value_option_week + '">' + i + '</option>';
				}
				value_option_week = "";
			}
			document.getElementById("select_week").innerHTML = week_option; // Nhúng HTML cho dữ liệu Select2 (week)
			
			var year_link = "", week_link="";
			$('#select_week').on('select2:select', function (e) {
				week_link = $("#select_week").val();
				year_link = $("#select_year").val();
				console.log(year_link);
				window.location.href = '<c:url value="/${role}/dashboard/' + week_link + '_' + year_link + '" />';
			});
			/* ===== Cuối: Thiết lập select 2 cho phần Header ===== */
			
			
			// Form logout cho thẻ a (menu)
			document.getElementById("yourLinkId").onclick = function() {
				document.getElementById("formLogout").submit();
			}
			
			var id_add_ckediter = "#ud_tinh_trang, #cr_tinh_trang, #cr_ket_qua, #cr_swot, " + 
				"#cr_mo_ta_du_an, #ud_swot, #ud_ket_qua, #cr_general_issue, #cr_solution, " + 
				"#cr_ke_hoach, #cr_ket_qua,#add_ckeditor";
			
			$(id_add_ckediter).ckeditor({
			  	toolbar: [
					{ name: 'document', items: [ 'Source', '-' ] },											
					{ name: 'undo', items: [ 'Undo', 'Redo' ] },																
					{ name: 'align', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-' ] },																									
					{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', '-', 'Subscript', 'Superscript', '-' ] },
					{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
					{ name: 'indent', items: [ 'Outdent','Indent' ] },
					{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
					{ name: 'tools', items: [ 'Maximize' ] },
				],
				uiColor : '#F7D358',
				height  : 100 
		  	});
			
			$( ".datepickerJavascript" ).datepicker({
				dateFormat: 'dd / mm / yy'
			});
			
		});
		
		function myFunction() {
			  var x = document.getElementById("myTopnav");
			  if (x.className === "navbar-nav topnav") {
			    x.className = "topnav responsive";
			  } else {
			    x.className = "navbar-nav topnav";
			  }
			  
			}
	</script>
	
</body>
</html>
