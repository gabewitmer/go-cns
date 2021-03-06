<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		<#include "../stubs/header.ftl"/>
		<title>DQF 750</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<legend>Certification of Other Compensated Work<span class="pull-right">DQF 750</span></legend>
					<div>
						When employed by a motor carrier, a driver must report all on-duty hours worked from other employers. On-duty hours are
						defined below from the Federal Motor Carrier Association.
					</div>
					<div>
						<strong>§ 395.2</strong>
					</div>
					<div class="col-lg-12">
						<div>
							On-duty time means all time from the time a driver begins to work or is required to be in readiness to work until the time the
							driver is relieved from work and all responsibility for performing work. On-duty time shall include:
						</div>
						<div>
							(1) All time at a plant, terminal, facility, or other property of a motor carrier or shipper, or on any public property, waiting to
							be dispatched, unless the driver has been relieved from duty by the motor carrier
						</div>
						<div>
							(2) All time inspecting, servicing, or conditioning any commercial motor vehicle at any time
						</div>
						<div>
							(3) All driving time as defined in the term driving time
						</div>
						<div>
							(4) All time in or on a commercial motor vehicle, other than:
						</div>
						<div>
							(i) Time spent resting in or on a parked vehicle, except as otherwise provided in §397.5 of this subchapter
						</div>
						<div>
							(ii) Time spent resting in a sleeper berth
						</div>
						<div>
							(iii) Up to 2 hours riding in the passenger seat of a property-carrying vehicle moving on the highway immediately before or
							after a period of at least 8 consecutive hours in the sleeper berth
						</div>
						<div>
							(5) All time loading or unloading a commercial motor vehicle, supervising, or assisting in the loading or unloading, attending a
							commercial motor vehicle being loaded or unloaded, remaining in readiness to operate the commercial motor vehicle, or in
							giving or receiving receipts for shipments loaded or unloaded
						</div>
						<div>
							(6) All time repairing, obtaining assistance, or remaining in attendance upon a disabled commercial motor vehicle
						</div>
						<div>
							(7) All time spent providing a breath sample or urine specimen, including travel time to and from the collection site, to comply
							with the random, reasonable suspicion, post-crash, or follow-up testing required by part 382 of this subchapter when directed
							by a motor carrier
						</div>
						<div>
							(8) Performing any other work in the capacity, employ, or service of, a motor carrier
						</div>
						<div>
							(9) Performing any compensated work for a person who is not a motor carrier.
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr/>
					<div class="col-lg-offset-3 col-lg-6">
						<div class="form-horizontal">
							<h4>Driver Information</h4>
							<div class="form-group">
								<label class="control-label left col-xs-3">Name:</label>
								<div class="col-xs-9">
									<input type="text" name="driver-name" class="form-control input-sm" value="${(driver.firstName)!} ${(driver.lastName)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">Employee #:</label>
								<div class="col-lg-9">
									<input type="text" name="driver-employee-no" class="form-control input-sm">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">Street: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-street" class="form-control input-sm" value="${(driver.street)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">City: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-city" class="form-control input-sm" value="${(driver.city)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">State: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-state" class="form-control input-sm" value="${(driver.state)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">Zip: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-zip" class="form-control input-sm" value="${(driver.zip)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-12">Are you currently employed at another company?</label>
								<div class="col-xs-12">
									<label class="checkbox-inline">
										<input type="checkbox" name="driver-current-employed-company"> Yes
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-12">How long do you expect to be employed by this company?</label>
								<div class="col-xs-12">
									<input type="text" name="driver-employment-prediction" class="form-control input-sm">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="form-inline">
						I,
						<input type="text" class="form-control input-sm" name="driver-agreement-name" value="${(driver.firstName)!} ${(driver.lastName)!}">
						attest that the information I have listed above if accurate and true. I will notify this
						company of any additional employers for compensation.
					</div>
					<br/>
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label left col-lg-2">Driver Signature:</label>
							<div class="col-lg-6">
								<input type="text" name="driver-signature" class="form-control input-sm">
							</div>
							<label class="control-label left col-lg-1">Date:</label>
							<div class="col-lg-3">
								<input type="text" name="driver-signature-date" class="form-control input-sm">
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
