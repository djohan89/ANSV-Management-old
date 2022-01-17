<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>AM | Project into Deployment</title>
</head>
<body>
<c:url value="/AM/createDeployment_test/${week}_${year}_${id}" var="createDeployment"/>
<form:form action="${createDeployment}" method="POST" modelAttribute="project">
	<div class="content-wrapper">
		<section class="content">
			<div class="container-fluid">
			
				Số tiền tạm ứng: <form:input type="number" path="so_tien_tam_ung" class="form-control" />
				Kế hoạch tạm ứng: <form:input type="date" path="ke_hoach_tam_ung" class="form-control" />
				DAC: <form:input type="date" path="DAC" class="form-control" />
				PAC: <form:input type="date" path="PAC" class="form-control" />
				FAC: <form:input type="date" path="FAC" class="form-control" />
				
				Số tiền DAC: <form:input type="number" path="so_tien_DAC" class="form-control" />
				Kế hoạch thanh toán DAC: <form:input type="date" path="ke_hoach_thanh_toan_DAC" class="form-control" />
				
				Số tiền PAC: <form:input type="number" path="so_tien_PAC" class="form-control" />
				Kế hoạch thanh toán PAC: <form:input type="date" path="ke_hoach_thanh_toan_PAC" class="form-control" />
				
				Số tiền FAC: <form:input type="number" path="so_tien_FAC" class="form-control" />
				Kế hoạch thanh toán FAC: <form:input type="date" path="ke_hoach_thanh_toan_FAC" class="form-control" />
				
				Tổng giá trị thực tế: <form:input type="number" path="tong_gia_tri_thuc_te" class="form-control" />
				
				<button type="submit">Submit</button>
				
			</div>
		</section>
	</div>
</form:form>
</body>