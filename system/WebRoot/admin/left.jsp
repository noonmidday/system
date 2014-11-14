<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理系统</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="resources/css/invalid.css" type="text/css"
	media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript"
	src="resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="resources/scripts/jquery-2.1.1.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript"
	src="resources/scripts/simpla.jquery.configuration.js"></script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="resources/scripts/facebox.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
<!-- jQuery Datepicker Plugin -->
<script type="text/javascript"
	src="resources/scripts/jquery.datePicker.js"></script>
<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
</head>

<script language="javascript">
	var domain = "http://127.0.0.1:8080/system";
</script>
<script type="text/javascript">
	$(function() {
		/*
			左侧点击变色效果
		 */

		$("#main-nav ul a").click(function() {
			$("#main-nav ul a").removeClass();
			$(this).attr("CLASS", "current");
		});

		$(".nav-top-item").click(function() {
			var s = $("#main-nav ul li a").removeClass();
			console.debug(s);
			$(".nav-top-item").removeClass("current");
			$(this).addClass("current");
		});
	});

	function iframe_src(src) {
		$('#iframe').attr('src', src);

	}

	function IFrameReSize(iframename) {
		var pTar = document.getElementById(iframename);

		if (pTar) { //ff

			if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {

				pTar.height = pTar.contentDocument.body.offsetHeight;

			} //ie

			else if (pTar.Document && pTar.Document.body.scrollHeight) {

				pTar.height = pTar.Document.body.scrollHeight;

			}

		}

	}
	//iframe宽度自适应

	function IFrameReSizeWidth(iframename) {

		var pTar = document.getElementById(iframename);

		if (pTar) { //ff

			if (pTar.contentDocument && pTar.contentDocument.body.offsetWidth) {

				pTar.width = pTar.contentDocument.body.offsetWidth;

			} //ie

			else if (pTar.Document && pTar.Document.body.scrollWidth) {

				pTar.width = pTar.Document.body.scrollWidth;

			}

		}

	}
</script>

<body>
	<div id="body-wrapper">
		<!-- Wrapper for the radial gradient background -->
		<div id="sidebar">
			<div id="sidebar-wrapper">
				<!-- Sidebar with logo and menu -->
				<h1 id="sidebar-title">
					<a href="#">管理系统</a>
				</h1>
				<!-- Logo (221px wide) -->
				<a href="#"><img id="logo" src="resources/images/logo.png"
					alt="Simpla Admin logo" /> </a>
				<!-- Sidebar Profile links -->
				<div id="profile-links">
					Hello, <a href="#" title="Edit your profile"><%=session.getAttribute("username")%></a>
					<br /> <br /> <a href="../servlet/sign_out" title="Sign Out">Sign
						Out</a>
				</div>
				<ul id="main-nav">
					<!-- Accordion Menu -->

					<li><a href="#" class="nav-top-item current"> <!-- Add the class "current" to current menu item -->
							产品信息 </a>
						<ul>
							<li><a class="current" href="javascript:void(0)"
								onclick="iframe_src('product_info/productlist.jsp');">产品列表</a>
							</li>
							<li><a class="" href="javascript:void(0)"
								onclick="iframe_src('product_info/virtualsku_list.jsp');">虚拟SKU</a>
							</li>
							<!-- ../product_info/productlist.jsp -->
							<!-- ../product_info/virtualsku_list.jsp -->
							<!-- Add class "current" to sub menu items also -->

						</ul>
					</li>

					<li><a href="#" class="nav-top-item"> <!-- Add the class "current" to current menu item -->
							成本核算</a>
						<ul>
							<li><a class="" href="#">Ebay成本核算</a>
							</li>
							<!-- Add class "current" to sub menu items also -->
						</ul>
					</li>

					<!--  <li> <a href="#" class="nav-top-item"> Pages </a>
          <ul>
            <li><a href="#">Create a new Page</a></li>
            <li><a href="#">Manage Pages</a></li>
          </ul>
        </li>
		-->
				</ul>
				<!-- End #main-nav -->


			</div>

		</div>
		<!-- onload='IFrameReSize("iframe");IFrameReSizeWidth("iframe");' -->
		<script type="text/javascript">
			function setheight(height) {
				$('#iframe').attr('height', height);
			}
		</script>
		<div id="main-content" style="margin-left: 240px">
			<iframe src="product_info/productlist.jsp" id="iframe" scrolling="no"
				frameborder="0" height="" width="100%" id="mainFrame"
				onload='IFrameReSize("iframe");IFrameReSizeWidth("iframe");'></iframe>
		</div>

		<%@ include file="foot.jsp"%>