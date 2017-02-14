<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="active" type="java.lang.String" required="true"%>
	<div id="left">
		<div class="media user-media well-small">
			<a class="user-link" href="#"> 
				<img class="media-object img-thumbnail user-img" alt="User Picture" src="${assets}/bs-admin/img/user.gif" />
			</a> <br />
			<div class="media-body">
				<h5 class="media-heading">${user.userName }</h5>
				<ul class="list-unstyled user-info">
					<li><a class="btn btn-success btn-xs btn-circle"
						style="width: 10px; height: 12px;"></a> Online</li>
				</ul>
			</div>
			<br />
		</div>
		<ul id="menu" class="collapse">
			<li class="panel <c:if test="${active == 'index'}">active</c:if>">
				<a href="${ctx }/"> 
					<i class="icon-table"></i> 仪表板
				</a>
			</li>
			
				<li class="panel <c:if test="${active == 'user'}">active</c:if>">
				<a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
					 <i class="icon-tasks"> </i> 管理员管理 <span
					class="pull-right"> <i class="icon-angle-left"></i>
				</span> &nbsp; <span class="label label-default">10</span>&nbsp;
			</a>
				<ul class="collapse <c:if test="${active == 'user'}">in</c:if>" id="component-nav">
					<li class=""><a href="${ctx }/user/userList"><i
							class="icon-angle-right"></i> 信息管理 </a></li>
					<li class=""><a href="${ctx }/file/upload"><i
							class="icon-angle-right"></i> 文件上传 </a></li>
				</ul></li>
			<li class="panel <c:if test="${active == 'member'}">active</c:if>"><a href="#" data-parent="#menu"
				data-toggle="collapse" class="accordion-toggle collapsed"
				data-target="#form-nav"> <i class="icon-pencil"></i> 会员管理 <span
					class="pull-right"> <i class="icon-angle-left"></i>
				</span> &nbsp; <span class="label label-success">5</span>&nbsp;
			</a>
				<ul class="collapse <c:if test="${active == 'member'}">in</c:if>" id="form-nav">
					<li class=""><a href="${ctx }/member/memberList"><i
							class="icon-angle-right"></i> 会员信息 </a></li>
					<li class=""><a href="${ctx }/member/add"><i
							class="icon-angle-right"></i> 新增会员 </a></li>
				</ul></li>
	
			<li class="panel"><a href="#" data-parent="#menu"
				data-toggle="collapse" class="accordion-toggle"
				data-target="#pagesr-nav"> <i class="icon-table"></i> 订单管理 <span
					class="pull-right"> <i class="icon-angle-left"></i>
				</span> &nbsp; <span class="label label-info">6</span>&nbsp;
			</a>
				<ul class="collapse" id="pagesr-nav">
					<li><a href="#"><i
							class="icon-angle-right"></i> Calendar </a></li>
					<li><a href="#"><i
							class="icon-angle-right"></i> Timeline </a></li>
					<li><a href="#"><i class="icon-angle-right"></i>
							Social </a></li>
					<li><a href="#"><i
							class="icon-angle-right"></i> Pricing </a></li>
				</ul></li>
			<li class="panel"><a href="#" data-parent="#menu"
				data-toggle="collapse" class="accordion-toggle"
				data-target="#chart-nav"> <i class="icon-bar-chart"></i> 客户管理 <span
					class="pull-right"> <i class="icon-angle-left"></i>
				</span> &nbsp; <span class="label label-danger">4</span>&nbsp;
			</a>
				<ul class="collapse" id="chart-nav">
					<li><a href="#"><i class="icon-angle-right"></i>
							Line Charts </a></li>
					<li><a href="#"><i class="icon-angle-right"></i>
							Bar Charts</a></li>
					<li><a href="#"><i class="icon-angle-right"></i>
							Pie Charts </a></li>
					<li><a href="#"><i class="icon-angle-right"></i>
							other Charts </a></li>
				</ul></li>
		</ul>
	</div>