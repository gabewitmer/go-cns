<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "stubs/header.ftl"/>
		<title>Login</title>
	</head>
	<body>
		<#include "stubs/navbar.ftl"/>
		<div class="container">
			<div class="row">
				<#include "stubs/alerts.ftl"/>
				<br/><br/>
				<div class="text-center">
					<img src="/static/img/cns-logo.png" alt="CNS Truck Licensing Logo"/>
				</div>
				<div class="col-lg-offset-4 col-lg-4">
					<div class="panel panel-default">
						<div class="panel-body">
							<form action="/login" method="post">
								<div class="form-group">
									<input type="text" name="username" class="form-control" placeholder="Username"/>
								</div>
								<div class="form-group">
									<input type="password" name="password" class="form-control" placeholder="Password"/>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button class="btn btn-block btn-primary">Login</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#include "stubs/scripts.ftl"/>
	</body>
</html>