<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		<#include "../stubs/header.ftl"/>
		<title>DQF 600</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<legend>Notification of Convictions for a Driver Violation<span class="pull-right">DQF 600</span></legend>
					<div>
						<strong>§ 383.31</strong>
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						Each person who operates a commercial motor vehicle, who has a commercial driver's license issued by
						a State or jurisdiction, and who is convicted of violating, in any type of motor vehicle, a State or local law
						relating to motor vehicle traffic control (other than a parking violation) in a State or jurisdiction other than the
						one which issued his/her license, shall notify an official designated by the State or jurisdiction which issued such
						license, of such conviction. The notification must be made within 30 days after the date that the person has been
						convicted.
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						Each person who operates a commercial motor vehicle, who has a commercial driver's license issued by
						a State or jurisdiction, and who is convicted of violating, in any type of motor vehicle, a State or local law
						relating to motor vehicle traffic control (other than a parking violation), shall notify his/her current employer of
						such conviction. The notification must be made within 30 days after the date that the person has been convicted.
						If the driver is not currently employed, he/she must notify the State or jurisdiction which issued the license
						according to §383.31
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr/>
				</div>
				<div class="col-lg-6">
					<div class="form-horizontal">
						<h4>Driver Conviction Information</h4>
						<div class="form-group">
							<label class="control-label left col-xs-3">Driver's Name:</label>
							<div class="col-xs-9">
								<input type="text" name="applicant-name" class="form-control input-sm" value="${(driver.firstName)!} ${(driver.lastName)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Driver's License Number:</label>
							<div class="col-xs-9">
								<input type="text" name="applicant-license-number" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Date of Conviction:</label>
							<div class="col-xs-9">
								<input type="text" name="conviction-date" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-12">Did the violation take place in a commercial vehicle?</label>
							<div class="col-xs-12">
								<label class="checkbox-inline">
									<input type="checkbox" name="commercial-vehicle"> Yes
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-horizontal">
						<h4>Location Where the Offense Took Place</h4>
						<div class="form-group">
							<label class="control-label left col-xs-3">Street: </label>
							<div class="col-xs-9">
								<input type="text" name="offense-street" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">City: </label>
							<div class="col-xs-9">
								<input type="text" name="offense-city" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">State: </label>
							<div class="col-xs-9">
								<input type="text" name="offense-state" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Zip: </label>
							<div class="col-xs-9">
								<input type="text" name="offense-zip" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr/>
					<div>
						The specific criminal or other offense(s), serious traffic violation(s), and other violation(s) of State or local law
						relating to motor vehicle traffic control, for which the person was convicted and any suspension, revocation, or
						cancellation of certain driving privileges which resulted from such conviction(s)
					</div>
					<textarea name="applicants-notes" class="form-control" rows="3"></textarea>
					<br/>
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label left col-lg-2">Driver Signature:</label>
							<div class="col-lg-6">
								<input type="text" name="applicant-signature" class="form-control input-sm">
							</div>
							<label class="control-label left col-lg-1">Date:</label>
							<div class="col-lg-3">
								<input type="text" name="applicant-signature-date" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1 col-lg-offset-9">
				<button type="button" name="button" id="save" >Save</button>
			</div>
			<div class="col-lg-1">
				<button type="button" name="button" id="complete" >Complete</button>
			</div>
		</div>
		<#include "../stubs/scripts.ftl"/>
		<script src="/static/js/input-tools.js"></script>
		<script src="/static/js/document.js"></script>
		<script>

			var id = '${(document.id)!}';
			var documentId = '${(document.documentId)!}';
			var data = '${(document.data)!}';

		</script>
	</body>
</html>
