<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>登录</title>
     <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/bs-admin/css/login.css" />
    <link rel="stylesheet" href="assets/magic/magic.css" />
    <!--[if lt IE 9]>
      <script src="${assets}/html5shiv/html5shiv.min.js"></script>
      <script src="${assets}/respond/respond.min.js"></script>
    <![endif]-->
</head>
<body >

    <div class="container">
    <div class="text-center">
        <img src="assets/bs-admin/img/logo.png" id="logoimg" alt=" Logo" />
    </div>
    <div class="tab-content">
        <div id="login" class="tab-pane active">
            <form action="${ctx }/login" class="form-signin" id="loginForm" method="post">
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">
                    	请输入用户名和密码
                </p>
                <input type="text" placeholder="用户名" id="user" name="user" required class="form-control" />
                <input type="password" placeholder="密码" id="passw" name="passw" required class="form-control" />
                <button class="btn text-muted text-center btn-danger" id="loginBtn" type="submit">登录</button>
            </form>
        </div>
        <div id="forgot" class="tab-pane">
            <form action="index.html" class="form-signin">
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">请输入你的邮箱</p>
                <input type="email"  required="required" placeholder="Your E-mail"  class="form-control" />
                <br />
                <button class="btn text-muted text-center btn-success"  type="submit">Recover Password</button>
            </form>
        </div>
        <div id="signup" class="tab-pane">
            <form action="${ctx }/register" class="form-signin" id="registerForm" method="post">
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">请填写注册信息</p>
                <input type="text" placeholder="用户名" name="userName" required class="form-control" />
                <input type="text" placeholder="手机号" name="phone" required class="form-control" />
                <input type="email" placeholder="邮箱" name="email" required class="form-control" />
                <input type="password" placeholder="密码" id="password" required name="password" class="form-control" />
                <input type="password" placeholder="再次输入密码" id="repassword" required name="repassword" class="form-control" />
                <button class="btn text-muted text-center btn-success">注册</button>
            </form>
        </div>
    </div>
    <div class="text-center">
        <ul class="list-inline">
            <li><a class="text-muted" href="#login" data-toggle="tab">登录</a></li>
            <li><a class="text-muted" href="#forgot" data-toggle="tab">忘记密码</a></li>
            <li><a class="text-muted" href="#signup" data-toggle="tab">注册</a></li>
        </ul>
    </div>


</div>

	      
      <script src="assets/jquery-2.0.3.min.js"></script>
      <script src="assets/bootstrap/js/bootstrap.js"></script>
   	  <script src="assets/bs-admin/js/login.js"></script>
   	  <script type="text/javascript">
   	 	$(document).ready(function(){
   	 		alert("123");
   	 		$("#repassword,#password").blur(function(){
   	 			var pass1 = document.getElementById("password");
   	 			var pass2 = document.getElementById("repassword");
   	 			if(pass1.value != pass2.value){
	   	 			pass1.setCustomValidity("两次输入的密码不匹配"); 
   	 			}else{
   	 				pass1.setCustomValidity(""); 
   	 			}
   	 		});
   	 		
   	 		 $("#loginBtn").click(function(){
   	 			if($("#user").val()!=null&&$("#user").val()!=""&&$("#passw").val()!=null&&$("#passw").val()!=""){
	   	 			$.ajax({
	   	 				url : "/loginVer",
	   	 				type : "POST",
	   	 				async : false,
	   	 				data : 
	   	 				{
	   	 					user : $("#user").val(),
	   	 					passw : $("#passw").val()
	   	 				},
	   	 				dataType : 'json',
	   	 				success : function(data){
	   	 					 var pass = document.getElementById("passw");
	   	 					 if(data.status != "OK"){
	   	 						pass.setCustomValidity(data.comment);  
	   	 					 }else{
	   	 						pass.setCustomValidity("");
	   	 					 }
	   	 				} 
	   	 			});  
   	 			}
   	 		});   
   	 	});	
   	  </script>

</body>
</html>