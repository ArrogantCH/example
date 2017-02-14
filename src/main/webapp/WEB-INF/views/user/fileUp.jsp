<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<title>管理员管理</title>
	<tags:head_common_content />
	<link rel="stylesheet"
		href="${assets }/bs-admin/css/bootstrap-fileupload.min.css" />
	</head>
	<body class="padTop53 ">
		<div id="wrap">
			<tags:main_header />
	
			<tags:main_left active="user" />
	
			<div id="content">
	
				<div class="inner">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="col-lg-5">文件上传</h2>
							<ol id = "navigation_n" class="breadcrumb col-lg-3 pull-right">
							    <li><a href="#">主页</a></li>
							    <li><a href="#">管理员管理</a></li>
							    <li class="active">文件上传</li>
							</ol>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col-lg-12">
							<div id="collapseOne" class="accordion-body collapse in body">
								<form action="${ctx }/file/upload" class="form-horizontal" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label class="control-label col-lg-6">文件上传</label>
										<div class="col-lg-6">
											<div class="fileupload fileupload-new" data-provides="fileupload">
												<div class="input-group">
													<span class="btn btn-file btn-info"> 
														<span class="fileupload-new">选择文件</span> 
														<span class="fileupload-exists">更改</span>
														<input type="file" name="file" />
													</span> &nbsp;&nbsp;
													<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">删除</a> <br /> <br />
													<div class="col-lg-3">
														<i class="icon-file fileupload-exists"></i> 
														<span class="fileupload-preview"></span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-6">文件上传</label>
										<div class="col-lg-6">
											<div class="fileupload fileupload-new" data-provides="fileupload">
												<div class="input-group">
													<span class="btn btn-file btn-info"> 
														<span class="fileupload-new">选择文件</span> 
														<span class="fileupload-exists">更改</span>
														<input type="file" name="file" />
													</span> &nbsp;&nbsp;
													<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">删除</a> <br /> <br />
													<div class="col-lg-3">
														<i class="icon-file fileupload-exists"></i> 
														<span class="fileupload-preview"></span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-6">文件上传</label>
										<div class="col-lg-6">
											<div class="fileupload fileupload-new" data-provides="fileupload">
												<div class="input-group">
													<span class="btn btn-file btn-info"> 
														<span class="fileupload-new">选择文件</span> 
														<span class="fileupload-exists">更改</span>
														<input type="file" name="file" />
													</span>&nbsp;&nbsp;
													<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">删除</a> <br /> <br />
													<div class="col-lg-3">
														<i class="icon-file fileupload-exists"></i> 
														<span class="fileupload-preview"></span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<input type="submit" value="上传"
											class="btn btn-info btn-sg " />
									</div>
	
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div id="footer">
			<p>&copy; binarytheme &nbsp;2014 &nbsp;</p>
		</div>
	
		<tags:load_common_js />
		<script src="${assets }/jasny/js/bootstrap-fileupload.js"></script>
	</body>
</html>
