<!DOCTYPE html>
<html>
	<head>
		<#include "../stubs/header.ftl">
		<title>DQF 100</title>
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
	</head>
	<body>
		<div class="container">
			<br/><br/>
			<div id="invalid" class="hide alert alert-danger alert-dismissable">
				INVALID: Curious that we spend more time congratulating people who have succeeded than encouraging people who
				have not.
			</div>

			<div class="col-lg-12 text-center"><h1>DRIVER'S APPLICATION FOR EMPLOYMENT | DQF 100</h1></div>
			<div class="col-lg-12">
				<!-- PAGE ONE -->
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									Page 1
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<div class="row">
									<label class="col-lg-1">Company</label>
									<div class="col-lg-11">
										<input type="text" name="company-name" value="${(company.name)!}" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-1">Street</label>
									<div class="col-lg-11">
										<input type="text" name="company-street" value="${(company.street)!}" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-1">City</label>
									<div class="col-lg-5">
										<input type="text" name="company-city" value="${(company.city)!}" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">State</label>
									<div class="col-lg-2">
										<input type="text" name="company-state" value="${(company.state)!}" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">Zip</label>
									<div class="col-lg-2">
										<input type="text" name="company-zip" value="${(company.zip)!}" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										In compliance with Federal and State equal employment opportunity laws, qualified applicants are
										considered for all positions without regard to race, religion, color, sex, national origin, age, marital
										status, non job related disability, or any other protected group status.
									</div>
								</div>
								<div class="row">
									<label class="col-lg-3">APPLICANT'S NAME</label>
									<div class="col-lg-4">
										<input type="text" name="applicant-name" value="${(driver.firstName)!} ${(driver.lastName)!}" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">DATE</label>
									<div class="col-lg-4">
										<input type="text" name="apply-date" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-3">POSITION APPLIED FOR</label>
									<div class="col-lg-9">
										<input type="text" name="apply-position" class="form-control input-sm" required>
									</div>
								</div>
								<h4>Current Address</h4>
								<div class="row">
									<label class="col-lg-1">Street</label>
									<div class="col-lg-11">
										<input type="text" name="current-street" value="${(driver.street)!}" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-1">City</label>
									<div class="col-lg-5">
										<input type="text" name="current-city" value="${(driver.city)!}" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">State</label>
									<div class="col-lg-2">
										<input type="text" name="current-state" value="${(driver.state)!}" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">Zip</label>
									<div class="col-lg-2">
										<input type="text" name="current-zip" value="${(driver.zip)!}" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										I AM GIVING AUTHORIZATION FOR THE EMPLOYER LISTED ABOVE TO INQUIRE AND
										INVESTIGATE MY PERSONAL, EMPLOYMENT, FINANCIAL AND MEDICAL HISTORY IN
										REGARDS TO MY EMPLOYMENT STATUS. I RELEASE ANY PREVIOUS EMPLOYER,
										SCHOOL, AND HEALTHCARE FACILITY FROM ALL LIABILITY DURING THE RELEASE OF
										MY INFORMATION IN REGARDS TO MY APPLICATION.
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2">SIGNATURE</label>
									<div class="col-lg-5">
										<input type="text" name="inquire-signature" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">DATE</label>
									<div class="col-lg-4">
										<input type="text" name="inquire-signature-date" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" id="parent" data-group="previous-address">
										<br/>
										<label>Previous Addresses for the past 3 years</label>
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>Street</th>
													<th>City</th>
													<th>State</th>
													<th>Zip</th>
													<th>Length</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<tr class="multiple">
													<td><input type="text" class="form-control input-sm" name="street" id="multi" required></td>
													<td><input type="text" class="form-control input-sm" name="city" id="multi"  requiredrequired></td>
													<td><input type="text" class="form-control input-sm" name="state" id="multi" required></td>
													<td><input type="text" class="form-control input-sm" name="zip" id="multi" required></td>
													<td><input type="text" class="form-control input-sm" name="length" id="multi" required></td>
													<td id="remove-button"></td>
												</tr>
											</tbody>
										</table>
										<button class="btn btn-primary add">Add</button>
										<br/><br/>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2">DATE OF BIRTH</label>
									<div class="col-lg-2">
										<input type="text" name="applicant-date-of-birth" class="form-control input-sm" required>
									</div>
									<label class="col-lg-2">TELEPHONE</label>
									<div class="col-lg-2">
										<input type="text" name="applicant-phone" class="form-control input-sm" required>
									</div>
									<label class="col-lg-2">SOCIAL SECURITY</label>
									<div class="col-lg-2">
										<input type="text" name="applicant-ss" class="form-control input-sm" required>
									</div>
								</div>
								<div id="parent">
									<div class="row">
										<label class="col-lg-5">HAVE YOU WORKED FOR THIS COMPANY BEFORE?</label>
										<div class="col-lg-7">
											<label class="checkbox-inline">
												<input type="checkbox" class="required" name="worked-here-before"> Yes
											</label>
										</div>
									</div>
									<div class="row">
										<label class="col-lg-2">IF YES, WHEN?</label>
										<div class="col-lg-3">
											<input type="text" name="worked-here-before-date" class="form-control input-sm">
										</div>
										<label class="col-lg-3 text-right">REASON FOR LEAVING</label>
										<div class="col-lg-4">
											<input type="text" name="reason-for-leaving" class="form-control input-sm">
										</div>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4">HOW DID YOU HEAR OF THIS POSITION?</label>
									<div class="col-lg-8">
										<input type="text" name="worked-here-before-leaving-reason" class="form-control input-sm" required>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- PAGE TWO -->
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									Page 2
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<div class="row">
									<label class="col-lg-3">RATE OF PAY EXPECTED</label>
									<div class="col-lg-9">
										<input type="text" name="expected-pay" class="form-control input-sm" required>
									</div>
								</div>
								<div id="parent">
									<div class="row">
										<label class="col-lg-5">HAVE YOU EVER BEEN CONVICTED OF A FELONY?</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="required" name="convicted-felon"> Yes
										</label>
									</div>
									<div class="row">
										<div class="col-lg-12">
											IF YES, PLEASE EXPLAIN ON A SEPARATE SHEET OF PAPER. CONVICTION OF A CRIME IS
											NOT AN AUTOMATIC BAR TO EMPLOYMENT- ALL CIRCUMSTANCES WILL BE
											CONSIDERED. <br> <br>
											IS THERE ANY REASON YOU WON’T BE ABLE TO PERFORM THE FUNCTIONS OF THE JOB
											WHICH YOU HAVE APPLIED [AS DESCRIBED IN THE ATTACHED JOB DESCRIPTION] IF
											YES, EXPLAIN IF YOU WISH.
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<textarea name="conviction-explanation" class="form-control" rows="5"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-offset-2 col-offset-10">
										<h2>EMPLOYMENT HISTORY</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										All applicants wishing to drive in interstate commerce must provide the following information on all employers
										during the preceding three years. You must give the same information for all employers for whom you have
										driven a commercial vehicle seven years prior to the initial three years (total of ten year employment record).
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" id="parent" data-group="previous-employment">
										<div class="panel panel-default multiple">
											<div class="panel-heading">
												Employer
											</div>
											<div class="panel-body">
												<div class="row">
													<label class="col-lg-2">NAME</label>
													<div class="col-lg-10">
														<input type="text" name="name" id="multi" class="form-control input-sm" required>
													</div>
												</div>
												<div class="row">
													<label class="col-lg-2">STREET</label>
													<div class="col-lg-10">
														<input type="text" name="street" id="multi" class="form-control input-sm" required>
													</div>
												</div>
												<div class="row">
													<label class="col-lg-2">CITY</label>
													<div class="col-lg-4">
														<input type="text" name="city" id="multi" class="form-control input-sm" required>
													</div>
													<label class="col-lg-1">State</label>
													<div class="col-lg-2">
														<input type="text" name="state" id="multi" class="form-control input-sm" required>
													</div>
													<label class="col-lg-1">Zip</label>
													<div class="col-lg-2">
														<input type="text" name="zip" id="multi" class="form-control input-sm" required>
													</div>
												</div>
												<div class="row">
													<label class="col-lg-2">CONTACT PERSON</label>
													<div class="col-lg-6">
														<input type="text" name="contact-name" id="multi" class="form-control input-sm" required>
													</div>
													<label class="col-lg-2">TELEPHONE</label>
													<div class="col-lg-2">
														<input type="text" name="contact-phone" id="multi" class="form-control input-sm" required>
													</div>
												</div>
												<div class="row">
													<label class="col-lg-9">WAS YOUR POSITION SAFETY SENSITIVE REQUIRING PART 40 DRUG AND ALCOHOL TESTING?</label>
													<label class="checkbox-inline">
														<input type="checkbox" name="drug-testing" id="multi" value="true"> Yes
													</label>
												</div>
												<div class="row">
													<label class="col-lg-2">FROM:</label>
													<div class="col-lg-4">
														<input type="text" name="date-from" id="multi" class="form-control input-sm" required>
													</div>
													<label class="col-lg-2">DATE TO:</label>
													<div class="col-lg-4">
														<input type="text" name="date-to" id="multi" class="form-control input-sm" required>
													</div>
												</div>
												<div class="row">
													<label class="col-lg-2">POSITION HELD</label>
													<div class="col-lg-6">
														<input type="text" name="position" id="multi" class="form-control input-sm" required>
													</div>
													<label class="col-lg-1">SALARY</label>
													<div class="col-lg-3">
														<input type="text" name="salary" id="multi" class="form-control input-sm" required>
													</div>
												</div>
												<div class="row">
													<label class="col-lg-2">REASON FOR LEAVING</label>
													<div class="col-lg-10">
														<input type="text" name="leaving-reason" id="multi" class="form-control input-sm" required>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-12" id="remove-button"></div>
												</div>
											</div>
										</div>
										<br/><br/>
										<button class="btn btn-primary add">Add</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- PAGE THREE -->
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									Page 3
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-10 col-lg-offset-2">
										<h3>ACCIDENT RECORD</h3>
										PLEASE LIST THE PAST 3 YEARS OR MORE. IF ZERO, WRITE "NONE"
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" id="parent" data-group="accident-record">
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>DATE</th>
													<th>TYPE OF ACCIDENT</th>
													<th>FATALITIES</th>
													<th>INJURIES</th>
													<th>HAZMAT SPILL</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<tr class="multiple">
													<td><input type="text" name="date" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="type" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="fatalities" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="injuries" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="hazmat" id="multi" class="form-control input-sm" required></td>
													<td id="remove-button" class="text-center"></td>
												</tr>
											</tbody>
										</table>
										<button class="btn btn-primary add">Add</button>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-10 col-lg-offset-2">
										<h3>VIOLATION RECORD</h3>
										PLEASE LIST THE PAST 3 YEARS OF CONVICTION OR FORFEITURES. IF ZERO, WRITE "NONE"
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" id="parent" data-group="violation-group">
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>LOCATION</th>
													<th>DATE</th>
													<th>CHARGE</th>
													<th>PENALTY</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<tr class="multiple">
													<td><input type="text" name="location" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="date" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="charge" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="penalty" id="multi" class="form-control input-sm" required></td>
													<td id="remove-button" class="text-center"></td>
												</tr>
											</tbody>
										</table>
										<button class="btn btn-primary add">Add</button>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-10 col-lg-offset-2">
										<h3>DRIVER EXPERIENCE AND QUALIFICATIONS</h3>
										PLEASE LIST ALL LICENSES AND PERMITS HELD IN THE PAST 3 YEARS
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" id="parent" data-group="driver-experience">
										<table class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>STATE</th>
													<th>LICENSE</th>
													<th>CLASS/ENDORSEMENTS</th>
													<th>EXPIRATION DATE</th>
												</tr>
											</thead>
											<tbody>
												<tr class="multiple">
													<td><input type="text" name="state" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="license" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="class" id="multi" class="form-control input-sm" required></td>
													<td><input type="text" name="expiration" id="multi" class="form-control input-sm" required></td>
													<td id="remove-button" class="text-center"></td>
												</tr>
											</tbody>
										</table>
										<button class="btn btn-primary add">Add</button>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										PLEASE LIST BELOW IF YOU HAVE BEEN DENIED A LICENSE, PRIVILEGE OR PERMIT
										TO OPERATE A MOTOR VEHICLE OR HAS BEEN SUSPENDED OR REVOKED.
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<textarea name="denied-listing" class="form-control" rows="5"></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<label class="checkbox-inline">
											<input type="checkbox" id="" name="not-denied" value="option1">
											CHECK IF YOU HAVEN'T BEEN DENIED
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
									Page 4
								</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-10 col-lg-offset-2">
										<h3>DRIVING EXPERIENCE</h3>
										CHECK LIST
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="panel panel-default">
											<table class="table table-striped table-bordered">
												<thead>
													<tr>
														<th>CLASS OF EQUIPMENT</th>
														<th>TYPE (VAN,TANK,FLAT,DUMP,REFER)</th>
														<th>YEARS</th>
														<th>MILES DRIVEN</th>
													</tr>
												</thead>
												<tbody>
													<tr id="parent">
														<td>
															<label class="col-lg-9">STRAIGHT TRUCK</label>
															<label class="checkbox-inline">
																<input type="checkbox" class="required" name="straight-truck"> Yes
															</label>
														</td>
														<td><input type="text" name="straight-truck-type" class="form-control input-sm"></td>
														<td><input type="text" name="straight-truck-years" class="form-control input-sm"></td>
														<td><input type="text" name="straight-truck-miles" class="form-control input-sm"></td>
													</tr>
													<tr id="parent">
														<td>
															<label class="col-lg-9">TRACTOR AND SEMI-TRAILER</label>
															<label class="checkbox-inline">
																<input type="checkbox" class="required" name="tractor-and-semi-trailer"> Yes
															</label>
														</td>
														<td><input type="text" name="tractor-and-semi-trailer-type" class="form-control input-sm"></td>
														<td><input type="text" name="tractor-and-semi-trailer-years" class="form-control input-sm"></td>
														<td><input type="text" name="tractor-and-semi-trailer-miles" class="form-control input-sm"></td>
													</tr>
													<tr id="parent">
														<td>
															<label class="col-lg-9">TRACTOR-TWO TRAILERS</label>
															<label class="checkbox-inline">
																<input type="checkbox" class="required" name="tractor-two-trailers"> Yes
															</label>
														</td>
														<td><input type="text" name="tractor-two-trailers-type" class="form-control input-sm"></td>
														<td><input type="text" name="tractor-two-trailers-years" class="form-control input-sm"></td>
														<td><input type="text" name="tractor-two-trailers-miles" class="form-control input-sm"></td>
													</tr>
													<tr id="parent">
														<td>
															<label class="col-lg-9">TRACTOR-THREE TRAILERS</label>
															<label class="checkbox-inline">
																<input type="checkbox" class="required" name="tractor-three-trailers" value="true"> Yes
															</label>
														</td>
														<td><input type="text" name="tractor-three-trailers-type" class="form-control input-sm"></td>
														<td><input type="text" name="tractor-three-trailers-years" class="form-control input-sm"></td>
														<td><input type="text" name="tractor-three-trailers-miles" class="form-control input-sm"></td>
													</tr>
													<tr id="parent">
														<td>
															<label class="col-lg-9">MOTORCOACH-SCHOOL BUS MORE THAN 8 PASSENGERS</label>
															<label class="checkbox-inline">
																<input type="checkbox" class="required" name="8-plus-passengers" value="true"> Yes
															</label>
														</td>
														<td><input type="text" name="8-plus-passengers-type" class="form-control input-sm"></td>
														<td><input type="text" name="8-plus-passengers-years" class="form-control input-sm"></td>
														<td><input type="text" name="8-plus-passengers-miles" class="form-control input-sm"></td>
													</tr>
													<tr id="parent">
														<td>
															<label class="col-lg-9">MOTORCOACH-SCHOOL BUS MORE THAN 15 PASSENGERS</label>
															<label class="checkbox-inline">
																<input type="checkbox" class="required" name="15-plus-passengers" value="true"> Yes
															</label>
														</td>
														<td><input type="text" name="15-plus-passengers-type" class="form-control input-sm"></td>
														<td><input type="text" name="15-plus-passengers-years" class="form-control input-sm"></td>
														<td><input type="text" name="15-plus-passengers-miles" class="form-control input-sm"></td>
													</tr>
													<tr>
														<td>
															<label class="col-lg-3">OTHER</label>
															<div class="col-lg-9">
																<input type="text" name="other-experience-name" class="form-control input-sm">
															</div>
														</td>
														<td><input type="text" name="other-experience-type" class="form-control input-sm"></td>
														<td><input type="text" name="other-experience-years" class="form-control input-sm"></td>
														<td><input type="text" name="other-experience-miles" class="form-control input-sm"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-12">
										PLEASE LIST ANY TRANSPORTATION EXPERIENCE THAT MAY HELP YOU WITH YOUR WORK.
									</label>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<textarea name="transportation-experience" rows="5" class="form-control"></textarea>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-12">
										LIST HIGHEST LEVEL OF EDUCATION COMPLETED
									</label>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<input type="text" name="education-level" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-12">
										LAST SCHOOL ATTENDED AND ADDRESS
									</label>
								</div>
								<div class="row">
									<label class="col-lg-1">Name</label>
									<div class="col-lg-11">
										<input type="text" name="last-school-name" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-1">Street</label>
									<div class="col-lg-11">
										<input type="text" name="last-school-street" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-1">City</label>
									<div class="col-lg-5">
										<input type="text" name="last-school-city" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">State</label>
									<div class="col-lg-2">
										<input type="text" name="last-school-state" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">Zip</label>
									<div class="col-lg-2">
										<input type="text" name="last-school-zip" class="form-control input-sm" required>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-10 col-lg-offset-2">
										<h3>APPLICANT AGREEMENT</h3>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										THIS CERTIFIES THAT THIS APPLICATION WAS COMPLETED BY ME, AND THAT ALL
										ENTRIES ON IT AND INFORMATION IN IT ARE TRUE AND COMPLETE TO THE BEST OF MY KNOWLEDGE.
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2">SIGNATURE</label>
									<div class="col-lg-6">
										<input type="text" name="agreement-signature" class="form-control input-sm" required>
									</div>
									<label class="col-lg-1">DATE</label>
									<div class="col-lg-3">
										<input type="text" name="agreement-signature-date" class="form-control input-sm" required>
									</div>
								</div>
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
		<br/><br/>
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
