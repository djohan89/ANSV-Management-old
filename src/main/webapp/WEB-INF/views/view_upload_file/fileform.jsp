<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>Upload File</title>

<div class="content-wrapper center">
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<h1 class="white">Upload báo cáo lên Server</h1>
				</div>
			</div>
			
			<form name="upload" method="post" action="uploadfile" enctype="multipart/form-data" accept-charset="utf-8">
				<div class="row" style="margin-left: 13.1%;">
					<div class="col-md-10 col-md-offset-3 center">
						<div class="btn-container">
							<!--the three icons: default, ok file (img), error file (not an img)-->
							<h1 class="imgupload">
								<i class="fa fa-file-excel"></i>
							</h1>
							<h1 class="imgupload ok">
								<i class="fa fa-check"></i>
							</h1>
							<h1 class="imgupload stop">
								<i class="fa fa-times"></i>
							</h1>
							<!-- Định dạng file cho phép được upload -->
							<p id="namefile">File cho phép! (xlsx)</p>
							<!--our custom btn which which stays under the actual one-->
							<button type="button" id="btnup" class="btn btn-primary btn-lg">
								Chọn file của bạn!
							</button>
							<!--this is the actual file input, is set with opacity=0 beacause we wanna see our custom one-->
							<input type="file" value="" name="profile" id="fileup">
						</div>
					</div>
				</div>
				<!--additional fields-->
				<div class="row">			
					<div class="col-md-12">
						<!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
						<input type="submit" value="Submit!" class="btn btn-primary" id="submitbtn">
						<button type="button" class="btn btn-default" disabled="disabled" id="fakebtn" style="background-color: #ccc;">
							Upload! <i class="fa fa-minus-circle"></i>
						</button>
					</div>
				</div>
				<input type="submit" value="Submit!" class="btn btn-primary">
			</form>
		
			<!-- <div class="row">
				<section class="col-lg-12">

					<h1>Đây là phần upload file</h1>
					<form action="uploadfile" method="post" enctype="multipart/form-data">
					  	<div class="form-group">
					    	<label for="exampleFormControlFile1">Chọn file của bạn</label>
					    	<input type="file" name="profile" class="form-control-file" id="exampleFormControlFile1">
					    	<button class="btn btn-outline-success">Uload</button>
					  	</div>
					</form>
				</section>
			</div> -->
			
		</div>
	</section>
</div>

<style>
	/*just bg and body style*/
	.content-wrapper {
	  	background-color: #1e2832;
	  	padding-top: 15px;
	}
	.center {
	  	text-align: center;
	}
	#top {
	  	margin-top: 20px;
	}
	.btn-container {
	  	background: #fff;
	  	border-radius: 5px;
	  	padding-bottom: 20px;
	  	margin-bottom: 20px;
	}
	.white {
	  	color: white;
	}
	.imgupload {
	  	color: #1e2832;
	  	padding-top: 40px;
	  	font-size: 7em;
	}
	#namefile {
	  	color: black;
	}
	h4 > strong {
	  	color: #ff3f3f;
	}
	.btn-primary {
	  	border-color: #ff3f3f !important;
	  	color: #ffffff;
	  	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	  	background-color: #ff3f3f !important;
	  	border-color: #ff3f3f !important;
	}

	/*these two are set to not display at start*/
	.imgupload.ok {
	  	display: none;
	  	color: green;
	}
	.imgupload.stop {
	  	display: none;
	  	color: red;
	}

	/*this sets the actual file input to overlay our button*/
	#fileup {
	  	opacity: 0;
	  	-moz-opacity: 0;
	  	filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);
	  	width: 200px;
	  	cursor: pointer;
	  	position: absolute;
	  	left: 50%;
	  	transform: translateX(-50%);
	  	bottom: 40px;
	  	height: 50px;
	}

	/*switch between input and not active input*/
	#submitbtn {
	  	padding: 5px 50px;
	  	display: none;
	}
	#fakebtn {
	  	padding: 5px 40px;
	}

	/*www.emilianocostanzo.com*/
	#sign {
	  	color: #1e2832;
	  	position: fixed;
	  	right: 10px;
	  	bottom: 10px;
	  	text-shadow: 0px 0px 0px #1e2832;
	  	transition: all.3s;
	}
	#sign:hover {
	  	color: #1e2832;
	  	text-shadow: 0px 0px 5px #1e2832;
	}
</style>

<script>
	$("#fileup").change(function () {
	  	//here we take the file extension and set an array of valid extensions
	  	var res = $("#fileup").val();
	  	var arr = res.split("\\");
	  	var filename = arr.slice(-1)[0];
	  	filextension = filename.split(".");
	  	filext = "." + filextension.slice(-1)[0];
	  	valid = [".xlsx"];
	  	
	  	var check_tuan = filename.substring(filename.indexOf('tuần') + 5, filename.indexOf('tuần') + 7);
	  	var xyz = parseInt(check_tuan);
	  	console.log("Tên file này mới: ", check_tuan);
	  	console.log(typeof(xyz));
	  	
	  	/* var check_chuoi_dau = filename.substring(0, filename.indexOf('tuần') + 4);
	  	var check_chuoi_sau = filename.substring(filename.indexOf('tuần') + 8); */
	  	
	  	console.log("Tên chuỗi đầu này mới: ", file_upload_accept_chuoi_dau_1, file_upload_accept_chuoi_dau_2, file_upload_accept_chuoi_dau_3);
	  	console.log("Tên chuỗi sau này mới: ", file_upload_accept_chuoi_sau);
	  	
	  	//Kiểm tra tên file theo tên quỷ chuẩn định sẵn
	  	var compare_file_name_1 = file_upload_accept_1.localeCompare(filename);
	  	var compare_file_name_2 = file_upload_accept_2.localeCompare(filename);
	  	var compare_file_name_3 = file_upload_accept_3.localeCompare(filename);
	  	/* var compare_file_name_1 = file_view_1.localeCompare(filename);
	  	var compare_file_name_2 = file_view_2.localeCompare(filename);
	  	var compare_file_name_3 = file_view_3.localeCompare(filename); */
	  	
  		//if file is not valid we show the error icon, the red alert, and hide the submit button
	  	if (valid.indexOf(filext.toLowerCase()) == -1) {
	  		//Trường hợp không đúng đuôi file (định dạng file) -> Trả về lỗi
		    $(".imgupload").hide("slow");
		    $(".imgupload.ok").hide("slow");
		    $(".imgupload.stop").show("slow");

		    $("#namefile").css({ color: "red", "font-weight": 700 });
		    $("#namefile").html("File " + filename + " không hợp lệ!");

		    $("#submitbtn").hide();
		    $("#fakebtn").show();
	  	/* } else if (compare_file_name_1 == 0 || compare_file_name_2 == 0 || compare_file_name_3 == 0) { */
	  	} else if (
	  			( filename.includes(file_upload_accept_chuoi_dau_1) 
	  			|| filename.includes(file_upload_accept_chuoi_dau_2) 
	  			|| filename.includes(file_upload_accept_chuoi_dau_3) )
	  			/* && ( filename.includes(file_upload_accept_chuoi_sau) )*/
	  			&& (xyz >= 1 && xyz <= tuan_nay)) {
	  		//Trường hợp so sánh đúng với 1 trong 3 file đã định sẵn -> Cho phép thực hiện đẩy file
	  		//if file is valid we show the green alert and show the valid submit
		    $(".imgupload").hide("slow");
		    $(".imgupload.stop").hide("slow");
		    $(".imgupload.ok").show("slow");

		    $("#namefile").css({ color: "green", "font-weight": 700 });
		    $("#namefile").html(filename);

		    $("#submitbtn").show();
		    $("#fakebtn").hide();
	  	} else {
	  		//Không thuộc các trường hợp trên -> auto lỗi thôi!!!
	  		$(".imgupload").hide("slow");
		    $(".imgupload.ok").hide("slow");
		    $(".imgupload.stop").show("slow");

		    $("#namefile").css({ color: "red", "font-weight": 700 });
		    $("#namefile").html("Tên File " + filename + " không đúng!");

		    $("#submitbtn").hide();
		    $("#fakebtn").show();
	  	}
  		console.log(filename);
	});
</script>