<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/kindeditor/default.css" />
<script charset="utf-8" src="../resources/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="../resources/kindeditor/zh_CN.js"></script>
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css"
	media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="../resources/css/style_right.css"
	type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="../resources/css/invalid.css"
	type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript"
	src="../resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="../resources/scripts/jquery-2.1.1.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript"
	src="../resources/scripts/simpla.jquery.configuration.js"></script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="../resources/scripts/facebox.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript"
	src="../resources/scripts/jquery.wysiwyg.js"></script>
<!-- jQuery Datepicker Plugin -->
<script type="text/javascript"
	src="../resources/scripts/jquery.datePicker.js"></script>
<script type="text/javascript" src="../resources/scripts/jquery.date.js"></script>
<!-- Main Content Section with everything -->



<script type="text/javascript">
	var $_GET = (function() {
		var url = window.document.location.href.toString();
		//alert(url);
		var u = url.split("?");

		if (typeof (u[1]) == "string") {
			u = u[1].split("&");

			var get = {};
			for ( var i in u) {
				var j = u[i].split("=");

				get[j[0]] = j[1];
			}
			return get;
		} else {
			return {};
		}
	})();
	//alert($_GET['id']);
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.post(
										'../../servlet/product_info/get_product_details',
										{
											'id' : $_GET['id'],
										},
										function(d) {
											list = d;

											$('#proinfomation')
													.html(
															"<div>\n"
																	+ "<p>创建人："
																	+ list[0]['creator']
																	+ "&nbsp;&nbsp;创建时间："
																	+ list[0]['creattime']
																	+ "</p>\n"
																	+ "<p>最后编辑："
																	+ list[0]['editor']
																	+ "&nbsp;&nbsp;编辑时间："
																	+ list[0]['lastedittime']
																	+ "</p>\n"
																	+ "</div>");

											$('#pronum').val(list[0]['pronum']);
											$('#weigh').val(list[0]['weigh']);
											$('#cost').val(list[0]['cost']);
											$('#sgprice').val(
													list[0]['sgprice']);
											$(
													"input[name='choose_xj'][value="
															+ list[0]['oldnew']
															+ "]").attr(
													"checked", true);
											$(
													"input[name='choose_pf'][value="
															+ list[0]['legalcopy']
															+ "]").attr(
													"checked", true);
											$('#officialname').val(
													list[0]['officialname']);
											$('#usage').val(
													list[0]['sku_usage']);
											$('#brandowner').val(
													list[0]['brandowner']);
											$('#pro_category').val(
													list[0]['pro_category']);
											$('#the_keywords').val(
													list[0]['the_keywords']);
											$('#pro_color').val(
													list[0]['pro_color']);
											$('#suitforstyle').val(
													list[0]['suitforstyle']);
											$('#highlights1').val(
													list[0]['highlights1']);
											$('#highlights2').val(
													list[0]['highlights2']);
											$('#highlights3').val(
													list[0]['highlights3']);
											$('#highlights4').val(
													list[0]['highlights4']);
											$('#highlights5').val(
													list[0]['highlights5']);
											$('#pro_cname').val(
													list[0]['pro_cname']);
											$('#pro_ename').val(
													list[0]['pro_ename']);
											$('#pro_amzname').val(
													list[0]['pro_amzname']);
											$('#cost').val(list[0]['cost']);
											$('#content').html(
													list[0]['content']);
											parent
													.setheight(document
															.getElementById("main-content").offsetHeight);
										}, 'json');
					});
</script>

<div id="main-content">
	<!-- Main Content Section with everything -->
	<!-- Page Head -->
	<h2>商品详情</h2>
	<p id="page-intro"></p>
	<ul class="shortcut-buttons-set">
		<!--
		<li><a class="shortcut-button" href="#messages" rel="modal"><span> <img src="../resources/images/icons/comment_48.png" alt="icon" /><br />今日最新三条</span></a></li>
		-->
	</ul>
	<!-- End .shortcut-buttons-set -->
	<div class="clear"></div>
	<!-- End .clear -->
	<div class="content-box">
		<!-- Start Content Box -->
		<div class="content-box-content">

			<div id="tab2">
				<!--删除class=tab-content-->
				<div class="notification  png_bg" id="proinfomation"></div>
				<form action="#" method="post" id="addprobf">
					<input type="hidden" value="addpro" name="act">
					<fieldset>
						<!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
						<p>
							<label>产品编号</label> <input class="text-input small-input"
								type="text" id="pronum" name="pronum" readonly /> <br />
						</p>

						<p>
							<label>重量</label> <input class="text-input small-input"
								type="text" id="weigh" name="weigh" readonly />克
						</p>

						<p>
							<label>成本</label> <input class="text-input small-input"
								type="text" id="cost" name="cost" readonly />(美元)
						</p>

						<p>
							<label>建议价格</label> <input class="text-input small-input"
								type="text" id="sgprice" name="sgprice" readonly />(美元)
						</p>



						<p>
							<label>新旧程度 : </label> <input type="radio" name="choose_xj"
								value="1" checked disabled />新 <input type="radio"
								name="choose_xj" value="0" disabled />旧
						</p>

						<p>
							<label>普货 OR 仿货 : </label> <input type="radio" name="choose_pf"
								value="0" checked disabled />普货 <input type="radio"
								name="choose_pf" value="1" disabled />仿货
						</p>
						<p>
							<label>报关名称: </label> <input class="text-input small-input"
								type="text" id="officialname" name="officialname" readonly />
						</p>
						<p>
							<label>USAGE: </label> For&nbsp;&nbsp;<input
								class="text-input small-input" type="text" id="usage"
								name="usage" readonly />
						</p>
						<p>
							<label>品牌商: </label> <input class="text-input small-input"
								type="text" id="brandowner" name="brandowner" readonly />
						</p>
						<p>
							<label>分类: </label> <input class="text-input small-input"
								type="text" id="pro_category" name="pro_category" readonly />
						</p>
						<p>
							<label>关键词: </label> <input class="text-input medium-input"
								type="text" id="the_keywords" name="the_keywords" readonly />
						</p>
						<p>
							<label>产品颜色: </label> <input class="text-input small-input"
								type="text" id="pro_color" name="pro_color" readonly />
						</p>
						<p>
							<label>适用型号: </label> <input class="text-input small-input"
								type="text" id="suitforstyle" name="suitforstyle" readonly />
						</p>
						<p>
							<label>亮点: </label> &nbsp;&nbsp;&nbsp;&nbsp;One:<input
								class="text-input small-input" type="text" id="highlights1"
								name="highlights1" readonly /><br>
							&nbsp;&nbsp;&nbsp;&nbsp;Two:<input class="text-input small-input"
								type="text" id="highlights2" name="highlights2" readonly /><br>
							&nbsp;&nbsp;&nbsp;&nbsp;Three:<input
								class="text-input small-input" type="text" id="highlights3"
								name="highlights3" readonly /><br>
							&nbsp;&nbsp;&nbsp;&nbsp;Four:<input
								class="text-input small-input" type="text" id="highlights4"
								name="highlights4" readonly /><br>
							&nbsp;&nbsp;&nbsp;&nbsp;Five:<input
								class="text-input small-input" type="text" id="highlights5"
								name="highlights5" readonly /><br>
						</p>
						<p>
							<label>关于标题: </label> 中文标题：<br> <input
								class="text-input medium-input" type="text" id="pro_cname"
								name="pro_cname" readonly /><br> 英文标题：<input
								class="text-input large-input" type="text" id="pro_ename"
								name="pro_ename" readonly /><br> 亚马逊标题：<input
								class="text-input large-input" type="text" id="pro_amzname"
								name="pro_amzname" readonly />
						</p>
						<p>
						<div>
							<label>产品信息描述:</label>
							<div id="content"></div>
						</div>
						</p>

						<p>
						<div cla ss="notification attention png_bg" style="display:none;"
							id="attention_info">
							<div></div>
						</div>
						<div class="notification success png_bg" style="display:none;"
							id="success_info">
							<div></div>
						</div>
						<div class="notification error png_bg" style="display:none;"
							id="error_info">
							<div></div>
						</div>
						<input class="button" type="button" value="返回产品列表"
							onclick="javascript:window.location.href='productlist.jsp';" />
						</p>
					</fieldset>
					<div class="clear"></div>
					<!-- End .clear -->
				</form>
			</div>
			<!-- End #tab2 -->

		</div>
		<!-- End .content-box-content -->
	</div>
	<!-- End .content-box -->

	<script src="../resources/jquery_messager/jquery.messager.js"></script>