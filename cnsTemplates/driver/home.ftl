<!DOCTYPE html>
<html>
	<head>
		<#include "../stubs/header.ftl"/>
		<title>Driver</title>
	</head>
	<body>

		<!-- navigation -->
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="navbar-brand">
						<img class="navbar-logo" src="/static/img/cns-logo-sm.png" alt="CNS Truck Licensing Logo"/>
						<span style="margin-left:110px;">Customer & Content Management System</span>
						<#--
						<i class="fa fa-truck">
						Customer & Content Management System
						</i>
						-->
					</div>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/logout"><i class="fa fa-sign-out"></i> Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- navigation -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<#include "../stubs/alerts.ftl"/>
				</div>
				<div class="col-lg-12">
					<legend>${(driver.firstName)!} ${(driver.lastName)!}'s Active Documents</legend>
					<#if documents?has_content>
						<table id="documents" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>ID</th>
									<th>DQF</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<#list documents as document>
									<tr>
										<td>${(document.id?c)!}</td>
										<td>${(document.documentId?c)!}</td>
										<td><a href="/driver/document/${(document.id?c)!}" class="btn btn-primary btn-xs">Edit</a></td>
									</tr>
								</#list>
							</tbody>
						</table>
						<#else/>
						<div class="text-center panel-body">
							No Documents
						</div>
					</#if>
				</div>
			</div>
		</div>
		<#include "../stubs/scripts.ftl"/>
		<script src="/static/js/delete.js"></script>
		<script>
			$(document).ready(function() {
    		$('#documents').DataTable();
			} );
		</script>
	</body>
</html>
