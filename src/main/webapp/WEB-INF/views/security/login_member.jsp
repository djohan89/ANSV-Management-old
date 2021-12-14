<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<title>User | Login</title>
</head>
<body>
	<div class="auto-form-wrapper">
		<div class="form-group">
			<p align="center">
				<font size="+3" color="#FF6600"><b>ANSV Management</b></font>
			</p>
		</div>
		<form name='loginForm' action="<c:url value='/j_spring_security_login' />" method='POST'>
			<div class="form-group">
				<label class="label">Tên đăng nhập<dec:body /></label>
				<div class="input-group">
					<input type="text" name='username' class="form-control" placeholder="Tên đăng nhập">
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
					<input type="password" name='password' class="form-control" placeholder="*********">
					<div class="input-group-append">
						<span class="input-group-text"> <i
							class="mdi mdi-check-circle-outline"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary submit-btn btn-block">Đăng
					nhập</button>
				<c:if test="${ not empty message }">
					<p align="center">
						<font color="red" size="2"><u>${message}</u></font>
					</p>
				</c:if>
			</div>
			<div class="form-group d-flex justify-content-between">
				<div class="form-check form-check-flat mt-0">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" checked> Ghi nhớ
					</label>
				</div>
				<a href="#" class="text-small forgot-password text-black">Quên
					mật khẩu</a>
			</div>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
		</form>
	</div>
</body>