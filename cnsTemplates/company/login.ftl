<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "../stubs/header.ftl"/>
		<title>${(company.name)!}'s Login</title>
	</head>
	<body>

		<!-- navigation -->
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/login/${(company.slug)!}">
						<span style="margin-left:90px;">DQF Management System Portal Login</span>
					</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/landing/${(company.slug)!}"><i class="fa fa-home"></i>&nbsp;${(company.name)!}</a></li>
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
				<div class="col-lg-offset-4 col-lg-4">
					<div class="panel panel-default">
						<div class="panel-body">
							<#if company.logo>
								<a href="/landing/${(company.slug)!}">
									<div class="form-group text-center">
										<img id="src-image" class="img-responsive col-lg-10 col-lg-offset-1" src="/logo/${(company.slug)!}"/>
									</div>
								</a>
							</#if>
							<div class="col-lg-12">
								<p class="lead text-center">DQF Portal Login</p>
							</div>
							<form action="/login" method="post">
								<div class="form-group">
									<input type="text" name="username" class="form-control" placeholder="Username"/>
								</div>
								<div class="form-group">
									<input type="password" name="password" class="form-control" placeholder="Password"/>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button id="dynamic-btn" class="btn btn-block btn-primary">Login to ${(company.name)!}</button>
							</form>
						</div>
					</div>
					<p class="text-center">
						<small>*Powered by CNS Compliance Company &amp; Truck Licensing</small>
					</p>
				</div>
			</div>
		</div>
		<#include "../stubs/scripts.ftl"/>
		<script src="/static/js/color-theif.min.js"></script>
		<script src="/static/js/color-styler.js"></script>
	</body>
</html>
