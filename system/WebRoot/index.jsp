<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理系统</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="admin/resources/css/reset.css"
	type="text/css" media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="admin/resources/css/style.css"
	type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="admin/resources/css/invalid.css"
	type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript"
	src="admin/resources/scripts/jquery-1.3.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript"
	src="admin/resources/scripts/simpla.jquery.configuration.js"></script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="admin/resources/scripts/facebox.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript"
	src="admin/resources/scripts/jquery.wysiwyg.js"></script>
<script type="text/javascript"
	src="admin/resources/scripts/jquery-2.1.1.js"></script>
</head>

<body id="login">
	<script type="text/javascript">
		function keyUp(e) {
			var currKey = 0, e = e || event;
			currKey = e.keyCode || e.which || e.charCode;
			var keyName = String.fromCharCode(currKey);
			if (currKey == 13) {
				post_info();
			}
		}
		document.onkeyup = keyUp;

		function post_info() {
			var username = $('#username').val();
			var password = $('#password').val();
			$.post('servlet/login_ver', {
				'username' : username,
				'password' : password
			}, function(d) {
				if (d == 0) {
					alert("用户名或密码错误");
				} else if (d == 1) {
					//alert("登陆成功");
					window.location.href = 'admin/left.jsp';
				}
			}, 'json');
		}
	</script>
	<div id="login-wrapper" class="png_bg">
		<div id="login-top">
			<h1>管理系统</h1>
			<!-- Logo (221px width) -->
			<a href="#"><img id="logo" src="admin/resources/images/logo.png"
				alt="Simpla Admin logo" /> </a>
		</div>
		<!-- End #logn-top -->
		<div id="login-content">

			<div class="notification information png_bg">
				<div>欢迎登陆管理系统</div>
			</div>

			<p>
				<label> Username </label> <input class="text-input" type="text"
					name="username" id="username" />
			</p>
			<div class="clear"></div>
			<p>
				<label> Password </label> <input class="text-input" type="password"
					name="password" id="password" />
			</p>
			<div class="clear"></div>
			<p id="remember-password">
				<input type="checkbox" /> 在这台计算机上记住我一个月
			</p>
			<div class="clear"></div>
			<p>
				<input class="button" id="button" type="button" value="登陆"
					onclick="post_info()" />
			</p>



		</div>
		<!-- End #login-content -->
	</div>
	<!-- End #login-wrapper -->
</body>

</html>