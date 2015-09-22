<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
	<head>
		<#include "../../stubs/header.ftl"/>
		<title>dqf180-html.html</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	</head>
	<body vlink="blue" link="blue">
		<form action="/secure/driver/${driverId}/document" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div id="page1-div" style="position:relative;width:918px;height:1188px;">
				<p>Driver Information </p>
				<p>
					Name <input type="text" name="name" value="${(contact.firstName)!} ${(contact.lastName)!}${(document.data.name)!}"/>
					Date <input type="text" name="date" value="${(document.data.date)!}"/>
				</p>
				<p>
					Employee ID <input type="text" name="employeeId" value="${(document.data.employeeId)!}"/>
					SSN <input type="text" name="ss" value="${(document.data.ss)!}"/>
				</p>
				<p>
					License Number <input type="text" name="licenseNumber" value="${(document.data.licenseNumber)!}"/>
					State <input type="text" name="licenseState" value="${(document.data.licenseState)!}"/>
					Exp <input type="text" name="licenseExp" value="${(document.data.licenseExp)!}"/>
				</p>
				<p>
					Motor Carrier <input type="text" name="mcName" value="${(document.data.mcName)!}"/>
				</p>
				<p>
					Motor Carrier Address <input type="text" name="mcAddress" style="width:725px" value="${(document.data.mcAddress)!}"/>
				</p>
				<p>
					I certify that the following is a true and complete list of traffic violations (other than parking
					violations) for which I have been convicted or forfeited bond or collateral during the past 12 months.
				</p>
				<p>
					<input type="checkbox" name="noViolations" value="true" ${(document?? && document.data.noViolations?? && document.data.noViolations =='true') ?string('checked', '')}>
					None. Check here if you have not had any violations in the past 12 months.
				</p>
				<p>Date Offense Location Type of Vehicle Operated</p>
				<p>
					<input type="text" name="violationDate1" value="${(document.data.violationDate1)!}"/>
					<input type="text" name="violationOffense1" value="${(document.data.violationOffense1)!}"/>
					<input type="text" name="violationLocation1" value="${(document.data.violationLocation1)!}"/>
					<input type="text" name="violationVehicle1" value="${(document.data.violationVehicle1)!}"/>
				</p>
				<p>
					<input type="text" name="violationDate2" value="${(document.data.violationDate2)!}"/>
					<input type="text" name="violationOffense2" value="${(document.data.violationOffense2)!}"/>
					<input type="text" name="violationLocation2" value="${(document.data.violationLocation2)!}"/>
					<input type="text" name="violationVehicle2" value="${(document.data.violationVehicle2)!}"/>
				</p>
				<p>
					<input type="text" name="violationDate3" value="${(document.data.violationDate3)!}"/>
					<input type="text" name="violationOffense3" value="${(document.data.violationOffense3)!}"/>
					<input type="text" name="violationLocation3" value="${(document.data.violationLocation3)!}"/>
					<input type="text" name="violationVehicle3" value="${(document.data.violationVehicle3)!}"/>
				</p>
				<p>
					<input type="text" name="violationDate4" value="${(document.data.violationDate4)!}"/>
					<input type="text" name="violationOffense4" value="${(document.data.violationOffense4)!}"/>
					<input type="text" name="violationLocation4" value="${(document.data.violationLocation4)!}"/>
					<input type="text" name="violationVehicle4" value="${(document.data.violationVehicle4)!}"/>
				</p>
				<p>
					<input type="text" name="violationDate5" value="${(document.data.violationDate5)!}"/>
					<input type="text" name="violationOffense5" value="${(document.data.violationOffense5)!}"/>
					<input type="text" name="violationLocation5" value="${(document.data.violationLocation5)!}"/>
					<input type="text" name="violationVehicle5" value="${(document.data.violationVehicle5)!}"/>
				</p>
				<p>
					<input type="text" name="violationDate6" value="${(document.data.violationDate6)!}"/>
					<input type="text" name="violationOffense6" value="${(document.data.violationOffense6)!}"/>
					<input type="text" name="violationLocation6" value="${(document.data.violationLocation6)!}"/>
					<input type="text" name="violationVehicle6" value="${(document.data.violationVehicle6)!}"/>
				</p>
				<p> </p>
				<p>
					If no violations are listed above, I certify that I have not been convicted or forfeited bond or collateral 
					on account of any violation required to be listed during the past 12 months.
				</p>
				<p>
					Driver Signature <input type="text" name="driverSignature" value="${(document.data.driverSignature)!}"/>
					Date <input type="text" name="signDate" value="${(document.data.signDate)!}"/>
				</p>
				<p>
					Reviewer’s Signature <input type="text" name="reviewerSignature" value="${(document.data.reviewerSignature)!}"/>
					Title <input type="text" name="reviewerTitle" value="${(document.data.reviewerTitle)!}"/>
				</p>
				<p><button>Save</button></p>
			</div>
			<input type="hidden" name="docName" value="DQF180"/>
		</form>
	</body>
</html>