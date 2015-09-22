<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "stubs/header.ftl"/>
		<title>Error</title>
		<style>body{ background-color: lightslategray;}</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<#include "stubs/alerts.ftl"/>
				<br/><br/>
				<br/>
				<div class="col-lg-offset-3 col-lg-6">
					<div class="row well text-danger">
						<div class="col-lg-4">
							<h1><i class="fa fa-exclamation-triangle fa-3x"></i></h1>
						</div>
						<div class="text-center col-lg-8">
							<h3><strong>${error!} ${status!}</strong></h3>
							<p>We apologize for the inconvenience</p>
							<a href="/" class="btn btn-warning btn-block">Take me back to safety!</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#include "stubs/scripts.ftl"/>
	</body>
</html>