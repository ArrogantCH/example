<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD-->
<head>
<title>仪表板</title>
	<tags:head_common_content />
	<link rel="stylesheet" href="assets/fullcalendar-1.6.2/fullcalendar/fullcalendar.css" />
	<link rel="stylesheet" href="assets/bs-admin/css/calendar.css" />
	<link rel="stylesheet" href="assets/social-buttons/social-buttons.css" />
</head>


<body class="padTop53 ">
	<div id="wrap">

		<tags:main_header />

		<tags:main_left active="index" />

		<div id="content">

			<div class="inner">
				<div class="row">
					<div class="col-lg-12">

						<div class="box">
							<header>
								<h5>Calendar</h5>
							</header>
							<div class="body">
								<div class="row">
									<div class="col-lg-3">
										<div class="well well-small">
											<div id="add-event-form">
												<fieldset>
													<legend>Add Custom Event</legend>
													<span class="help-block">Event Title</span> <input
														id="title" name="title" type="text"
														placeholder="event title" class="form-control input-small">
													<label class="radio"> <input type="radio"
														name="priority" value="label label-default" checked>
														<span class="label label-default">default</span>
													</label> <label class="radio"> <input type="radio"
														name="priority" value="label label-warning"> <span
														class="label label-warning">warning</span>
													</label> <label class="radio"> <input type="radio"
														name="priority" value="label label-success"> <span
														class="label label-success">success</span>
													</label> <label class="radio"> <input type="radio"
														name="priority" value="label label-info"> <span
														class="label label-info">info</span>
													</label> <label class="radio"> <input type="radio"
														name="priority" value="label label-danger"> <span
														class="label label-danger">danger</span>
													</label> <br>
													<button id="add-event" type="button"
														class="btn btn-sm btn-default">Add Event</button>
												</fieldset>
											</div>

										</div>
										<div class="well well-small">
											<h4>Draggable Events</h4>
											<ul id='external-events' class="list-inline">
												<li class="external-event"><span
													class="label label-default">My Event 1</span></li>
												<li class="external-event"><span
													class="label label-danger">My Event 2</span></li>
												<li class="external-event"><span
													class="label label-success">My Event 3</span></li>
												<li class="external-event"><span
													class="label label-warning">My Event 4</span></li>
												<li class="external-event"><span
													class="label label-info">My Event 5</span></li>
											</ul>

											<label class="checkbox inline" for='drop-remove'> <input
												type="checkbox" id="drop-remove"> remove after drop
											</label>
										</div>
									</div>
									<div id="calendar" class="col-lg-9"></div>
								</div>
							</div>


						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	<!--END MAIN WRAPPER -->
	<!-- FOOTER -->
	<div id="footer">
		<p>&copy; binarytheme &nbsp;2014 &nbsp;</p>
	</div>
	<!--END FOOTER -->
	<!-- GLOBAL SCRIPTS -->
	<tags:load_common_js/>
	<script src="assets/bs-admin/js/jquery-ui.min.js"></script>
	<script
		src="assets/fullcalendar-1.6.2/fullcalendar/fullcalendar.min.js"></script>
	<script src="assets/bs-admin/js/calendarInit.js"></script>
	<script>
		$(function() {
			CalendarInit();
		});
	</script>
</body>

<!-- END BODY-->
</html>
