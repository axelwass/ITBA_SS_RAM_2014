
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>The KeeperShip</title>
	<link rel="shortcut icon" href="../../imgs/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css" />
	<link rel="stylesheet" type="text/css"
		href="../../css/bootstrap-responsive.css" />
	<link rel="stylesheet" type="text/css" href="../../css/own_style.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<script src="../../js/jquery.js" type="text/javascript"></script>
	<script src="../../js/jquery-ui.js" type="text/javascript"></script>
	
	<script src="../../js/dragNDrop.js" type="text/javascript"></script>
	<script src="../../js/print-button.js" type="text/javascript"></script>

</head>
<body>
	<fmt:setLocale value="en_US" scope="session"/> 
	<a class="dont-print" href="../client/worningSchedule"><img class="title" src="../../imgs/logo_keepership.png"/></a><br/>




	<c:if test="${userId != null}">
		<div class="main_menu dont-print">
			<a class="mian_menu_button" href="../client/search">Clientes</a>
			<a class="mian_menu_button" href="../client/departureSearch">Buscar salidas</a>
			<a class="mian_menu_button" href="../client/worningSchedule">Advertencias</a>
			<a class="mian_menu_button" href="../transaction/main">Transacciones</a>
			<a class="mian_menu_button" href="../check/main">Cheques</a>
			<a class="mian_menu_button" href="../bankaccount/list">Cuentas de banco</a>
			<a class="mian_menu_button" href="../paycategory/list">Categor&iacute;as</a>
			
			<a class="mian_menu_button" href="../user/logout">Salir</a>
		</div>
			<div class="main_menu dont-print">
					<a class="mian_menu_button" href="../user/changePassword">Cambiar contrase&ntilde;a</a>
		<c:if test="${isAdmin != null && isAdmin == true}">
					<a class="mian_menu_button" href="../user/signUp">Crear usuario</a>
					<a class="mian_menu_button" href="../register/search">Registro</a>
		</c:if>
			</div>
	</c:if>
	<c:if test="${userId == null}">
		<div class="main_menu dont-print">
			<a class="mian_menu_button" href="../user/login">Login</a>
		</div>
	</c:if>
	
	<br>
	<div class="container-fluid">
		<div class="container">
			<%-- header --%>
		</div>
		<div class="container">