<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>更新会员信息</title>
<tags:head_common_content />
<link rel="stylesheet"
	href="${assets }/validationengine/css/validationEngine.jquery.css" />

</head>
<body class="padTop53 ">
	<div id="wrap">
		<tags:main_header />
		
		<tags:main_left active="member" />

		<div id="content">

			<div class="inner">
				<div class="row">
					<div class="col-lg-12">
							<h2 class="col-lg-5">更新会员</h2>
							<ol id = "navigation_n" class="breadcrumb col-lg-2 pull-right">
							    <li><a href="#">主页</a></li>
							    <li><a href="#">会员管理</a></li>
							    <li class="active">更新会员</li>
							</ol>
						</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-12">
							<div id="collapseOne" class="accordion-body collapse in body">
								<form action="${ctx }/member/update" method="post" class="form-horizontal" id="block-validate">
									<input type="hidden" name="id" value="${member.id }" />
									<div class="form-group">
										<label class="control-label col-lg-4">姓名</label>
										<div class="col-lg-4">
											<input type="text" id="realName" name="realName" value="${member.realName }"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">身份证号</label>
										<div class="col-lg-4">
											<input type="text" id="idCard" name="idCard" value="${member.idCard }"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">性别</label>
										<div class="col-lg-4">
											<div class="radio  col-md-2">
	                                                <label>
	                                                    <input type="radio" name="gender" id="gender" value="男" checked="checked" />男
	                                                </label>
	                                         </div>
	                                         <div class="radio col-md-2">
	                                                <label>
	                                                    <input type="radio" name="gender" id="gender" value="女"  />女
	                                                </label>
	                                         </div>
                                         </div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">邮箱</label>

										<div class="col-lg-4">
											<input type="email" id="email" name="email" value="${member.email }"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">电话</label>

										<div class="col-lg-4"> 
											<input type="text" id="phone" name="phone" value="${member.phone }"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">地址</label>

										<div class="col-lg-4">
											<input type="text" id="address" 
												name="address" value="${member.address }" class="form-control" />
										</div>
									</div>
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<input type="submit" value="会员更新"
											class="btn btn-primary btn-lg " />
									</div>

								</form>
							</div>
					</div>
				</div>
			</div>
		</div>
		<!--END PAGE CONTENT -->
	</div>

	<div id="footer">
		<p>&copy; binarytheme &nbsp;2014 &nbsp;</p>
	</div>

	<tags:load_common_js />

</body>
</html>
