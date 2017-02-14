<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>会员管理</title>
		<tags:head_common_content />
		<link href="${assets}/dataTables/dataTables.bootstrap.css"	rel="stylesheet" />
	</head>
	<body class="padTop53 ">
	
		<div id="wrap">
			<tags:main_header />
			
			<tags:main_left active="member" />
			
			
			<div id="content">
					
				<div class="inner">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="col-lg-5">会员信息</h2>
							<ol id = "navigation_n" class="breadcrumb col-lg-2 pull-right">
							    <li><a href="#">主页</a></li>
							    <li><a href="#">会员管理</a></li>
							    <li class="active">会员信息</li>
							</ol>
						</div>
					</div>
					
					<hr />
					<div class="row">
						<div class="box-body">
				          	 <form class="form-horizontal" id="form1" action="${ctx}/member/query" method="post" >
				          		<div class="form-group">
				                   <label for="platformId" class="control-label col-sm-1" style="margin-left:32px;">姓名</label>
				                   <div class="col-sm-4">
				                     <input type="text" class="form-control" name="realName" value="${realName}">
				                   </div>
				                   <label for="platformId" class="control-label col-sm-1">手机号</label>
				                   <div class="col-sm-4">
				                     <input type="text" class="form-control" name="phone" value="${phone}">
				                   </div>
				                 </div>
				                 <div class="form-group">
				                   <label for="platformId" class="control-label col-sm-1" style="margin-left:32px;">身份证</label>
				                   <div class="col-sm-4">
				                     <input type="text" class="form-control" name="idCard" value="${idCard}">
				                   </div>
				                   <label for="platformId" class="control-label col-sm-1">邮箱</label>
				                   <div class="col-sm-4">
				                     <input type="text" class="form-control" name="email" value="${email}">
				                   </div>
				                 </div>
				                 <div class="form-group" style="text-align:center">
				                	 <div class="col-sm-11">
				                 		<button type="submit" id="query" class="btn btn-primary"  style="width:150px;">查询</button>
				                 		<c:if test="${p.content!=null}">
				                 		<button type="submit" id="download" style="width: 150px;margin-left:55px;" class="btn btn-primary" >下载</button>
				                 	 	</c:if>
				                 	 </div>
				                 </div>
				             </form>
			             </div>
		             </div>
					<div class="row" style="margin-top: 50px">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									会员信息列表
								</div>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>姓名</th>
													<th>性别</th>
													<th>手机</th>
													<th>邮箱</th>
													<th>身份证</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="member" items="${p.content }"
													varStatus="status">
													<tr>
														<td>${status.count }</td>
														<td>${member.realName }</td>
														<td>${member.gender }</td>
														<td>${member.phone }</td>
														<td>${member.email }</td>
														<td>${member.idCard }</td>
														<td>
															<div class="btn-group btn-group-xs" role="group">
																<a type="button" class="btn btn-default"
																	href="${ctx}/member/${member.id}/update">更新</a> <a
																	type="button" class="btn btn-default"
																	href="${ctx}/member/${member.id}/download">附件下载</a>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								<div class="box-footer clearfix">
									<tags:pagination url="${ctx}/member/memberList" page="${p}" cssClass="pull-right"/>
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
		<script>
			$(document).ready(function(){
				$("#download").click(function(){
					$("#form1").attr("action","${ctx}/member/download");
				})
				$("#query").click(function(){
					$("#form1").attr("action","${ctx}/member/query");
				})
			});
	    </script>
	</body>
</html>

