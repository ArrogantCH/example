<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>管理员管理</title>
		<tags:head_common_content />
		<link href="${assets}/dataTables/dataTables.bootstrap.css"	rel="stylesheet" />
	</head>
	<body class="padTop53 ">
	
		<div id="wrap">
			<tags:main_header />
			
			<tags:main_left active="user" />
			
			<div id="content">
	
				<div class="inner">
					<div class="row">
						<div class="col-lg-12">
								<h2 class="col-lg-5">信息管理</h2>
								<ol id = "navigation_n" class="breadcrumb col-lg-3 pull-right">
								    <li><a href="#">主页</a></li>
								    <li><a href="#">管理员管理</a></li>
								    <li class="active">信息管理</li>
								</ol>
							</div>
					</div>
					<hr />
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">信息管理</div>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>用户名</th>
													<th>邮箱</th>
													<th>手机号</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="user" items="${p.content }"
													varStatus="status">
													<tr>
														<td>${status.count }</td>
														<td>${user.userName }</td>
														<td>${user.email }</td>
														<td>${user.phone }</td>
														<td>
															<div class="btn-group btn-group-xs" role="group">
																<a type="button" class="btn btn-default"
																	href="${ctx}/merchants/${merchant.id}/update">更新</a> <a
																	type="button" class="btn btn-default"
																	href="${ctx}/merchants/${merchant.id}/download">附件下载</a>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								<div class="box-footer clearfix">
									<tags:pagination url="${ctx}/user/userList" page="${p}" cssClass="pull-right"/>
                				</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div id="footer">
			<p>&copy; binarytheme &nbsp;2014 &nbsp;</p>
		</div>
		
		<tags:load_common_js/>
		<script src="${assets }/dataTables/jquery.dataTables.js"></script>
		<script src="${assets }/dataTables/dataTables.bootstrap.js"></script>
	</body>
</html>

