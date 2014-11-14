<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../resources/kindeditor/default.css" />
<script charset="utf-8" src="../resources/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="../resources/kindeditor/zh_CN.js"></script>

<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			allowFileManager : true
		});

	});
</script>

<div id="main-content">
	<!-- Main Content Section with everything -->
	<!-- Page Head -->
	<h2>产品管理系统</h2>
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


				<script type="text/javascript">
					function add_product_info() {
						var pronum = $('#pronum').val();
						var weigh = $('#weigh').val();
						var cost = $('#cost').val();
						var sgprice = $('#sgprice').val();
						var choose_xj = $(
								'input[type=radio][name=choose_xj][checked]')
								.val();
						var choose_pf = $(
								'input[type=radio][name=choose_pf][checked]')
								.val();
						var officialname = $('#officialname').val();
						var usage = $('#usage').val();
						var brandowner = $('#brandowner').val();
						var pro_category = $('#pro_category').val();
						var the_keywords = $('#the_keywords').val();
						var pro_color = $('#pro_color').val();
						var suitforstyle = $('#suitforstyle').val();
						var highlights1 = $('#highlights1').val();
						var highlights2 = $('#highlights1').val();
						var highlights3 = $('#highlights1').val();
						var highlights4 = $('#highlights1').val();
						var highlights5 = $('#highlights1').val();
						var pro_cname = $('#pro_cname').val();
						var pro_ename = $('#pro_ename').val();
						var pro_amzname = $('#pro_amzname').val();
						var content = editor.html();

						$.post('../../servlet/product_info/add_product_list', {
							'pronum' : pronum,
							'weigh' : weigh,
							'cost' : cost,
							'sgprice' : sgprice,
							'choose_xj' : choose_xj,
							'choose_pf' : choose_pf,
							'officialname' : officialname,
							'usage' : usage,
							'brandowner' : brandowner,
							'pro_category' : pro_category,
							'the_keywords' : the_keywords,
							'pro_color' : pro_color,
							'suitforstyle' : suitforstyle,
							'highlights1' : highlights1,
							'highlights2' : highlights2,
							'highlights3' : highlights3,
							'highlights4' : highlights4,
							'highlights5' : highlights5,
							'pro_cname' : pro_cname,
							'pro_ename' : pro_ename,
							'pro_amzname' : pro_amzname,
							'content' : content
						}, function(d) {
							if (d == 0) {
								alert("商品添加成功！");
							} else if (d == 1) {
								alert("商品添加失败！");
							} else if (d == 2) {
								alert("该商品已有记录!");
							}

						}, 'json');

					}
				</script>


				<!--删除class=tab-content-->
				<form action="#" method="post" id="addprobf">
					<input type="hidden" value="addpro" name="act">
					<fieldset>
						<!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
						<p>
							<label>产品编号</label> <input class="text-input small-input"
								type="text" id="pronum" name="pronum" /> <br /> <small>请输入SKU编号</small>
						</p>

						<p>
							<label>重量</label> <input class="text-input small-input"
								type="text" id="weigh" name="weigh" />克
						</p>

						<p>
							<label>成本</label> <input class="text-input small-input"
								type="text" id="cost" name="cost" />(美元)
						</p>

						<p>
							<label>建议价格</label> <input class="text-input small-input"
								type="text" id="sgprice" name="sgprice" />(美元)
						</p>



						<p>
							<label>新旧程度 : </label> <input type="radio" name="choose_xj"
								value="1" checked="checked" />新 <input type="radio"
								name="choose_xj" value="0" />旧
						</p>

						<p>
							<label>普货 OR 仿货 : </label> <input type="radio" name="choose_pf"
								value="0" checked="checked" />普货 <input type="radio"
								name="choose_pf" value="1" />仿货
						</p>
						<p>
							<label>报关名称: </label> <input class="text-input small-input"
								type="text" id="officialname" name="officialname" />
						</p>
						<p>
							<label>USAGE: </label> For&nbsp;&nbsp;<input
								class="text-input small-input" type="text" id="usage"
								name="usage" />
						</p>
						<p>
							<label>品牌商: </label> <input class="text-input small-input"
								type="text" id="brandowner" name="brandowner" />
						</p>
						<p>
							<label>分类: </label> <input class="text-input small-input"
								type="text" id="pro_category" name="pro_category" />
						</p>
						<p>
							<label>关键词: </label> <input class="text-input medium-input"
								type="text" id="the_keywords" name="the_keywords" />
						</p>
						<p>
							<label>产品颜色: </label> <input class="text-input small-input"
								type="text" id="pro_color" name="pro_color" />
						</p>
						<p>
							<label>适用型号: </label> <input class="text-input small-input"
								type="text" id="suitforstyle" name="suitforstyle" />
						</p>
						<p>
							<label>亮点: </label> &nbsp;&nbsp;&nbsp;&nbsp;One:<input
								class="text-input small-input" type="text" id="highlights1"
								name="highlights1" /><br> &nbsp;&nbsp;&nbsp;&nbsp;Two:<input
								class="text-input small-input" type="text" id="highlights2"
								name="highlights2" /><br> &nbsp;&nbsp;&nbsp;&nbsp;Three:<input
								class="text-input small-input" type="text" id="highlights3"
								name="highlights3" /><br> &nbsp;&nbsp;&nbsp;&nbsp;Four:<input
								class="text-input small-input" type="text" id="highlights4"
								name="highlights4" /><br> &nbsp;&nbsp;&nbsp;&nbsp;Five:<input
								class="text-input small-input" type="text" id="highlights5"
								name="highlights5" /><br>
						</p>
						<p>
							<label>关于标题: </label> 中文标题：<br> <input
								class="text-input medium-input" type="text" id="pro_cname"
								name="pro_cname" /><br> 英文标题：<input
								class="text-input large-input" type="text" id="pro_ename"
								name="pro_ename" /><br> 亚马逊标题：<input
								class="text-input large-input" type="text" id="pro_amzname"
								name="pro_amzname" />
						</p>
						<p>
						<div>
							<label>产品信息描述</label>
							<textarea name="content" id="content"
								style="width:800px;height:400px;visibility:hidden;"></textarea>
						</div>
						</p>

						<p>
						<div class="notification attention png_bg" style="display:none;"
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
						<input class="button" type="button" value="Submit"
							onclick="add_product_info();" /> <input class="button"
							type="button" value="返回产品列表"
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

