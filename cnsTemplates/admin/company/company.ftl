
<html>
	<head>
		<#include "../../stubs/header.ftl">
		<style>input.uploader{position:absolute;left:-9999px;}label.uploader{cursor:pointer;}</style>
		<title>Company</title>
	</head>
	<body>
		<#include "../../stubs/secure-navbar-admin.ftl">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<#include "../../stubs/alerts.ftl">

					<!-- file error alert -->
					<div id="fileError" class="hide">
						<div class="alert alert-danger">
							<p id="fileMessage"></p>
						</div>
					</div>
					<!-- file error alert -->

				</div>

				<!-- BREADCRUMB NAVIGATION -->
				<div class="col-lg-12">
					<ol class="breadcrumb">
						<li>
							<a href="/">Home</a>
						</li>
						<li class="active">
							${(company??)?string('<a href="/admin/company">Companies</a>','Companies')!}
						</li>
						${(company??)?string('<li class="active">${(company.name)!}</li>','')!}
					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->

				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							Company
							<a href="/admin/company" class="btn btn-default btn-sm pull-right">Clear</a>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="/admin/company" method="post">
								<div class="form-group">
									<label class="control-label col-lg-4">Name</label>
									<div class="col-lg-8">
										<input type="text" name="name" class="form-control" value="${(company.name)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Street</label>
									<div class="col-lg-8">
										<input type="text" name="street" class="form-control" value="${(company.street)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">City</label>
									<div class="col-lg-8">
										<input type="text" name="city" class="form-control" value="${(company.city)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">State</label>
									<div class="col-lg-8">
										<input type="text" name="state" class="form-control" value="${(company.state)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Zip</label>
									<div class="col-lg-8">
										<input type="text" name="zip" class="form-control" value="${(company.zip)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Age Requirement</label>
									<div class="col-lg-8">
										<input type="number" name="ageRequirement" class="form-control" value="${(company.ageRequirement)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Feature</label>
									<div class="col-lg-8">
										<label class="radio-inline">
											<input type="radio" name="feature" value="true" ${(company.feature)? string('checked', '')}/> Yes
										</label>
										<label class="radio-inline">
											<input type="radio" name="feature" value="false" ${(!company.feature)? string('checked', '')}/> No
										</label>
									</div>
								</div>
								<div class="col-lg-12">
                                    <input type="hidden" name="logo" value="${(company.logo?c)!}"/>
									<input type="hidden" name="id" value="${(company.id)!}"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button class="btn btn-primary btn-block">Save</button>
									</div>
									<div class="form-group">
										<a href="#" data-delete="/admin/company/${(company.id)!}" data-message="Are you sure you would like to permanently delete this company?" class="btn btn-danger btn-block delete-button">Delete</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="col-lg-offset-4 col-lg-4">
					<div class="row">
						<div class="col-lg-12">
                    		<div class="panel panel-default">
                    		    <div class="panel-heading">Driver Stats</div>
                    		    <div class="panel-body">
									<div class="row">
                    		        	<label class="col-lg-6">Company Logo:</label>
										<div class="col-lg-4">
											<#if company.logo>
                                    			<img id="src-image" class="img-responsive" src="/logo/${(company.slug)!}" alt=""/>
											</#if>
										</div>
									</div>
									<br/>
                                    <form action="/admin/company/upload/${(company.id)!}" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="btn btn-default btn-block uploader" for="logo">
                                                Select Image
                                            </label>
                                            <input class="uploader" id="logo" type="file" name="logo" required="true">
                                        </div>
                                        <button class="btn btn-success uploader btn-block" id="upload" type="submit"
                                                disabled="true">
                                            Upload
                                        </button>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									</form>
                    		    </div>
                    		</div>
						</div>
					</div>
                    <div class="row">
                        <div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">Driver Stats</div>
								<div class="panel-body">
									<p>Number of drivers: ${(driverCount)!'0'}</p>
									<a class="btn btn-block btn-default" href="/admin/company/${(company.id)!}/driver">Manage Drivers</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">Vehicle Stats</div>
								<div class="panel-body">
									<p>Number of vehicles: ${(vehicleCount)!'0'}</p>
									<a class="btn btn-block btn-default" href="/admin/company/${(company.id)!}/vehicle">Manage Vehicles</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#include "../../stubs/scripts.ftl">
		<script src="/static/js/password.js"></script>
		<script src="/static/js/delete.js"></script>
        <script src="/static/js/upload.js"></script>
	</body>
</html>