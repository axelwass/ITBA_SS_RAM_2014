
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>SS_RAM</title>
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css" />
	<link rel="stylesheet" type="text/css"
		href="../../css/bootstrap-responsive.css" />
	<link rel="stylesheet" type="text/css" href="../../css/own_style.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	
        <script language="JavaScript">
        function refreshIt(element) {
            setTimeout(function() {
            	
                element.src = element.src.split('?')[0] + '?' + new Date().getTime();
                
            }, 3000);
        }
        </script>

</head>
<body>
	<fmt:setLocale value="en_US" scope="session"/> 
	<h1 class="title">SS RAM</h1><br/>

	<div class="container-fluid">
		<div class="container">