<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
        <#include "../stubs/header.ftl"/>
        <title>DQF 300</title>
    </head>
    <body>
		<#--TODO: finish setting unique names-->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <legend>Request for Information From Previous Employer<span class="pull-right">DQF 300</span></legend>
                    <div>
                        <h4>Former/Current Employer Liability Waiver</h4>
                        <div class="form-inline">
                            I
                            <input type="text" class="form-control input-sm" name="person" value="${(driver.firstName)!} ${(driver.lastName)!}">
                            hereby authorize you to release all information regarding my employment at
                            <input type="text" class="form-control input-sm" name="current-employer">, to
                            <input type="text" class="form-control input-sm" name="future-employer" value="${(company.name)!}"> for purposes of
                            investigation and inquiry, including written and oral assessment of my job performance, ability and fitness, and
                            controlled substance and alcohol test results in connection with my application for employment with the above
                            stated company. I hereby release you from any and all liability of any type as a result of providing the above
                            information to the above mention company/person.
                        </div>
                    </div>
                    <br>
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label left col-lg-2">Applicant Signature:</label>
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
			<div class="row">
				<div class="col-lg-12">
					<hr>
				</div>
				<div class="col-lg-offset-1 col-lg-4">
					<div class="form-horizontal">
						<h4>Name/Address of Previous Employer</h4>
						<div class="form-group">
							<label class="control-label left col-xs-2">Name: </label>
							<div class="col-xs-10">
								<input type="text" name="previous-employer-name" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">Street: </label>
							<div class="col-xs-10">
								<input type="text" name="previous-employer-street" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">City: </label>
							<div class="col-xs-10">
								<input type="text" name="previous-employer-city" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">State: </label>
							<div class="col-xs-10">
								<input type="text" name="previous-employer-state" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">Zip: </label>
							<div class="col-xs-10">
								<input type="text" name="previous-employer-zip" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-offset-2 col-lg-4">
					<div class="form-horizontal">
						<h4>Name/Address of Prospective Employer</h4>
						<div class="form-group">
							<label class="control-label left col-xs-2">Name: </label>
							<div class="col-xs-10">
								<input type="text" name="prospective-employer-name" class="form-control input-sm" value="${(company.name)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">Street: </label>
							<div class="col-xs-10">
								<input type="text" name="prospective-employer-street" class="form-control input-sm" value="${(company.street)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">City: </label>
							<div class="col-xs-10">
								<input type="text" name="prospective-employer-city" class="form-control input-sm" value="${(company.city)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">State: </label>
							<div class="col-xs-10">
								<input type="text" name="prospective-employer-state" class="form-control input-sm" value="${(company.state)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-2">Zip: </label>
							<div class="col-xs-10">
								<input type="text" name="prospective-employer-zip" class="form-control input-sm" value="${(company.zip)!}">
							</div>
						</div>
					</div>
				</div>
			</div>
			<#if !driver??>
				<div class="row">
					<div class="col-lg-12">
						<hr>
						<p><strong>This form was (Check appropriate box)</strong></p>
						<div class="form-horizontal">
							<div class="form-group">
								<div class="col-lg-2">
									<div class="radio">
										<label>
											<input type="radio" name="mailed" value="mailed">
											Mailed, Date
										</label>
									</div>
								</div>
								<div class="col-lg-3">
									<input type="text" class="form-control input-sm" name="mailed-date">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-2">
									<div class="radio">
										<label>
											<input type="radio" name="faxed" value="faxed">
											Faxed, Date
										</label>
									</div>
								</div>
								<div class="col-lg-3">
									<input type="text" class="form-control input-sm" name="faxed-date">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-2">
									<div class="radio">
										<label>
											<input type="radio" name="emailed" value="emailed">
											Emailed, Date
										</label>
									</div>
								</div>
								<div class="col-lg-3">
									<input type="text" class="form-control input-sm" name="emailed-date">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-2">
									<div class="radio">
										<label>
											<input type="radio" name="phone" value="phone">
											Received By Phone, Date
										</label>
									</div>
								</div>
								<div class="col-lg-3">
									<input type="text" class="form-control input-sm" name="phone-date">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-2">Name of Person Contacted:</label>
								<div class="col-xs-4">
									<input type="text" name="contact-name" class="form-control input-sm">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<br>
						<div class="form-horizontal">
							<div class="form-group">
								<label class="control-label left col-xs-2">Name of Applicant: </label>
								<div class="col-xs-4">
									<input type="text" name="applicant-name" class="form-control input-sm" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-2">Date of Birth: </label>
								<div class="col-xs-4">
									<input type="text" name="applicant-date-of-birth" class="form-control input-sm" value="">
								</div>
								<label class="control-label col-xs-2">Social Security # </label>
								<div class="col-xs-4">
									<input type="text" name="applicant-ss" class="form-control input-sm" value="">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<br>
						<div class="form-inline">
							The individual named above has made application to this company for employment as a truck driver
							and states that he/she was employed by you as a
							<input type="text" class="form-control input-sm" name="previous-position">
							 from
							<input type="text" class="form-control input-sm" name="from-date">
							 to
							<input type="text" class="form-control input-sm" name="to-date">
						</div>
						<br>
						<ol>
							<li>
								Is employment dates record with your company correct as stated above?&nbsp;&nbsp;&nbsp;
								<label class="checkbox-inline">
									<input type="checkbox" name="correctDates"> Yes
								</label>
								<br>
								<div class="form-inline form-group">
									If No, please states dates employed.&nbsp;&nbsp;&nbsp;&nbsp;
									To: <input type="text" class="form-control input-sm" name="change-to-date" value="">
									From: <input type="text" class="form-control input-sm" name="change-from-date" value="">
								</div>
							</li>
							<li>
								<div class="form-inline form-group">
									What kind of work did applicant do?
									<input type="text" name="kind-of-work" class="form-control input-sm" value="">
								</div>
							</li>
							<li>
								<div class="form-inline form-group">
									If employed as a driver, specify equipment driven.
									<input type="text" class="form-control input-sm" name="equipment-driven" value="">
								</div>
							</li>
							<li>
								<div class="form-inline form-group">
									Number of Accidents?
									<input type="text" class="form-control input-sm" name="number-accidents" value="">
									Number of Preventable?
									<input type="text" class="form-control input-sm" name="number-preventable" value="">
									Details?
									<input type="text" class="form-control input-sm" name="details" value="">
								</div>
							</li>
							<li>
								<div class="form-inline form-group">
									Was applicant’s driver’s license ever suspended or revoked?
									<input type="text" class="form-control input-sm" name="license-revoked" value="">
								</div>
							</li>
							<li>
								<div class="form-inline form-group">
									Commodities transported?
									<input type="text" class="form-control input-sm" name="commodities" value="">
									Areas driven in?
									<input type="text" class="form-control input-sm" name="areas" value="">
								</div>
							</li>
							<li>
								<div class="form-group">
									Reason for leaving your employ?&nbsp;&nbsp;&nbsp;
									<label class="radio-inline">
										<input type="radio" name="leaving-reason" value="discharged"> Discharged
									</label>
									<label class="radio-inline">
										<input type="radio" name="leaving-reason" value="laidOff"> Laid Off
									</label>
									<label class="radio-inline">
										<input type="radio" name="leaving-reason" value="resigned"> Resigned
									</label>
								</div>
							</li>
							<li>
								<div class="form-group form-inline">
									Was applicant’s general conduct satisfactory?&nbsp;&nbsp;&nbsp;
									<label class="checkbox-inline">
										<input type="checkbox" name="satisfactory-conduct"> Yes
									</label>
									&nbsp;&nbsp;&nbsp;&nbsp;Comments?
									<input type="text" class="form-control input-sm" name="conduct-comment" style="width:50%" value="">
								</div>
							</li>
							<li>
								<div class="form-group form-inline">
									Is applicant competent for the position he/she is seeking?&nbsp;&nbsp;&nbsp;
									<label class="checkbox-inline">
										<input type="checkbox" name="competent"> Yes
									</label>
									&nbsp;&nbsp;&nbsp;&nbsp;Comments?
									<input type="text" class="form-control input-sm" name="competent-comment" style="width:45%" value="">
								</div>
							</li>
							<li>
								<div class="form-group form-inline">
									Would you re-employ?&nbsp;&nbsp;&nbsp;
									<label class="checkbox-inline">
										<input type="checkbox" name="reemploy"> Yes
									</label>
									&nbsp;&nbsp;&nbsp;&nbsp;Comments?
									<input type="text" class="form-control input-sm" name="reemploy-comment" style="width:65%" value="">
								</div>
							</li>
							<li>
								<div class="form-inline form-group">
									Was there any physical condition including work comp claims?
									<input type="text" class="form-control input-sm" name="work-comp-claim" value="">
								</div>
							</li>
							<li>
								<div class="form-inline form-group">
									Any remarks or comments?
									<input type="text" class="form-control input-sm" name="final-comment" style="width:80%" value="">
								</div>
							</li>
						</ol>
					</div>
				</div>
			</#if>
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
