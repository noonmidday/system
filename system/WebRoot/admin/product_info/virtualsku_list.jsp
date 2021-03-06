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



<div id="main-content">
	<!-- Main Content Section with everything -->
	<noscript>
		<!-- Show a notification if the user has disabled javascript -->
		<div class="notification error png_bg">
			<div>
				Javascript is disabled or is not supported by your browser. Please <a
					href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a>
				your browser or <a
					href="http://www.google.com/support/bin/answer.py?answer=23852"
					title="Enable Javascript in your browser">enable</a> Javascript to
				navigate the interface properly. Download From <a href="#">exet.tk</a>
			</div>
		</div>
	</noscript>
	<!-- add virtualsku -->
	<script type="text/javascript">
		function add_virtualsku() {
			var prasku = $('#prasku').val();
			var virsku = $('#virsku').val();
			$.post('../../servlet/product_info/add_virtualsku_list', {
				'id' : id,
			}, function(d) {
				if (d == 1) {
					alert("删除成功");
					location.reload();
				} else {
					alert("删除失败");
				}
			}, 'json');
		}
	</script>
	<!-- Page Head -->
	<h2>虚拟SKU</h2>
	<p id="page-intro"></p>

	<form action="#">
		实际SKU:<input class="text-input small-input" type="text" id="prasku"
			width=50px height=100px /> 虚拟SKU:<input
			class="text-input small-input" type="text" id="virsku" /> <input
			type="button" class="button" value="添  加" onclick="add_virtualsku();" /><br />
		<br /> <br /> <br />
	</form>

	<!-- End .shortcut-buttons-set -->
	<div class="clear"></div>
	<!-- End .clear -->
	<span id="dscontent"></span>

	<script src="../resources/jquery_messager/jquery.messager.js"></script>

	<DIV style="DISPLAY: none" id=goTopBtn>
		<IMG border=0 src="../resources/images/lanren_top.jpg">
	</DIV>
	<form action="#">
		<p>

			<label>实际SKU:</label><input class="text-input small-input"
				type="text" id="searchval" name="searchval" value="">
			&nbsp;&nbsp;&nbsp;&nbsp; <input class="button" type="button"
				value="Search" onclick="search_sku();">

		</p>
	</form>
	<!-- select all -->
	<script type="text/javascript">
		function selectAll() {
			var checklist = document.getElementsByName("checkbox_name");
			if (document.getElementById("controlAll").checked) {
				for ( var i = 0; i < checklist.length; i++) {
					checklist[i].checked = 1;
				}
			} else {
				for ( var j = 0; j < checklist.length; j++) {
					checklist[j].checked = 0;
				}
			}
		}
	</script>
	<!-- del -->
	<script type="text/javascript">
		function del(id) {
			$.post('../../servlet/product_info/del_virtualsku_list', {
				'id' : id,
			}, function(d) {
				if (d == 1) {
					alert("删除成功");
					location.reload();
				} else {
					alert("删除失败");
				}
			}, 'json');
		}

		function dels() {
			var value = "";
			var arr = document.getElementsByName("checkbox_name");
			for ( var i = 0; i < arr.length; i++) {
				if (arr[i].checked) {
					value = value + arr[i].value + ",";
				}
			}

			$.post('../../servlet/product_info/del_virtualsku_list', {
				'id' : value,
			}, function(d) {
				if (d == 1) {
					alert("删除成功");
					location.reload();
				} else {
					alert("删除失败");
				}
			}, 'json');
		}
	</script>
	<!-- product_list -->
	<script type="text/javascript">
		var list;
		var all_pagenum;
		var each_page_count;
		var to_page_num_count;
		function show_list(pagenum) {
			//alert("all_pagenum:" + all_pagenum);
			var table = "";
			if ((pagenum + 1) >= all_pagenum) {

				to_page_num_count = list.length;
			} else {
				to_page_num_count = each_page_count * pagenum;
			}
			for ( var i = ((pagenum - 1) * 20); i < to_page_num_count; i++) {
				//alert(list[i]['id']);
				var tr_str;
				if (i % 2 == 0) {
					tr_str = "<tr style=\"background-color:#ffffff\">\n";
				} else {
					tr_str = "<tr style=\"background-color:#f3f3f3\">\n";
				}

				table = table
						+ tr_str
						+ "<td><input name=\"checkbox_name\" id=\"checkbox_id\" type=\"checkbox\" class=\"check_one\" value=\""+list[i]['id']+"\">\n"
						+ "</td>\n"
						+ "<td>"
						+ list[i]['virsku']
						+ "</td>\n"
						+ "<td>"
						+ list[i]['prasku']
						+ "</td>\n"
						+ "<td>"
						+ list[i]['subtime']
						+ "</td>\n"
						+ "<td><a href=\"javascript:;\" onclick=\"del("
						+ list[i]['id']
						+ ");\" title=\"Delete\"><img src=\"../resources/images/icons/cross.png\" alt=\"Delete\"> </a>\n"
						+ "</td>\n" + "</tr>";
			}

			$('#show').html(table);
			parent
					.setheight(document.getElementById("main-content").offsetHeight);
			//$('#show').empty();
			//$('#show').append(table);

			//footpage
			//$('#footpage').empty();

			var Previous_num_str;
			var Next_num_str;
			var fu2;
			var fu1;
			var zheng1;
			var zheng2;
			if (pagenum <= 1) {
				Previous_num_str = "";
			} else {
				Previous_num_str = "<a href=\"javascript:;\" onclick=\"show_list("
						+ (pagenum - 1)
						+ ");\" title=\"Previous Page\">« Previous</a>";
			}

			if ((pagenum + 1) <= all_pagenum) {
				Next_num_str = "<a href=\"javascript:;\" onclick=\"show_list("
						+ (pagenum + 1) + ");\" title=\"Next Page\">Next »</a>";

			} else {
				Next_num_str = "";
			}

			if (pagenum <= 2) {
				fu2 = "";
			} else {
				fu2 = "<a href=\"javascript:;\" onclick=\"show_list("
						+ (pagenum - 2) + ");\" class=\"number \">"
						+ (pagenum - 2) + "</a>";
			}

			if (pagenum <= 1) {
				fu1 = "";
			} else {
				fu1 = "<a href=\"javascript:;\" onclick=\"show_list("
						+ (pagenum - 1) + ");\" class=\"number \">"
						+ (pagenum - 1) + "</a>";
			}

			if ((pagenum + 1) <= all_pagenum) {
				zheng1 = "<a href=\"javascript:;\" onclick=\"show_list("
						+ (pagenum + 1) + ");\" class=\"number \">"
						+ (pagenum + 1) + "</a>";
			} else {
				zheng1 = "";
			}
			if ((pagenum + 2) <= all_pagenum) {
				zheng2 = "<a href=\"javascript:;\" onclick=\"show_list("
						+ (pagenum + 2) + ");\" class=\"number \">"
						+ (pagenum + 2) + "</a>";
			} else {
				zheng2 = "";
			}

			var pagenum_show = "<a href=\"javascript:;\" onclick=\"show_list(1);\" title=\"First Page\">« First</a>\n"
					+ Previous_num_str
					+ fu2
					+ fu1
					+ "<a href=\"javascript:;\" onclick=\"show_list("
					+ pagenum
					+ ");\" class=\"number current\">"
					+ pagenum
					+ "</a>"
					+ zheng1
					+ zheng2
					+ Next_num_str
					+ "<a href=\"javascript:;\" onclick=\"show_list("
					+ Math.floor(all_pagenum)
					+ ");\" title=\"Last Page\">Last »</a>";
			footpage.innerHTML = pagenum_show;
		}
	</script>

	<!-- search_sku -->
	<script type="text/javascript">
		function search_sku() {
			var sku = $('#searchval').val();
			$.post('../../servlet/product_info/show_virtualsku_list', {
				'type' : 'search',
				'prasku' : sku
			}, function(d) {
				list = d;
				//	$.each(list, function(key, value) {
				//alert(key + ' ' + value);	
				//	});
				if (list.length > 20) {
					each_page_count = 20;
				} else {
					each_page_count = list.length;
				}

				if (list.length % 20 == 0) {
					all_pagenum = list.length / 20;
				} else {
					all_pagenum = (list.length / 20) + 1;
				}
				count_all.innerHTML = "每页20条，共" + list.length + "条";
				show_list(1);

			}, 'json');
		}
	</script>

	<script type="text/javascript">
		function post_info() {

			//var sql="select * from ";
			//var pipei_status =$("input[name='pipei_status']:checked").val();
			//var content = $('#content').val();
			$.post('../../servlet/product_info/show_virtualsku_list', {

			}, function(d) {
				list = d;
				//	$.each(list, function(key, value) {
				//alert(key + ' ' + value);	
				//	});

				if (list.length > 20) {
					each_page_count = 20;
				} else {
					each_page_count = list.length;
				}

				if (list.length % 20 == 0) {
					all_pagenum = list.length / 20;
				} else {
					all_pagenum = (list.length / 20) + 1;
				}
				count_all.innerHTML = "每页20条，共" + list.length + "条";
				show_list(1);

			}, 'json');
		}
		$(document).ready(function() {
			post_info();

		});
	</script>

	<!-- table -->
	<div class="content-box">
		<!-- Start Content Box -->

		<div class="content-box-content">

			<div class="tab-content default-tab" id="tab1">

				<!-- This is the target div. id must match the href of this div's tab -->
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

				<table>
					<thead>
						<tr>
							<th></th>
							<th>虚拟SKU</th>
							<th>实际SKU</th>
							<th>添加时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="8">
								<div class="bulk-actions align-left">
									<input onclick="selectAll()" type="checkbox" name="controlAll"
										style="controlAll" id="controlAll" />全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
										class="button" href="javascript:;" onclick="dels();">删除所选</a>
									&nbsp;&nbsp;<span id="count_all">每页20条，共0条</span>
								</div>
								<div class="pagination" id="footpage">
									<a href="javascript:;" onclick="turnpage(1);"
										title="First Page">« First</a> <a href="javascript:;"
										onclick="turnpage(1);" title="Previous Page">« Previous</a> <a
										href="javascript:;" onclick="turnpage(1);"
										class="number current">1</a> <a href="javascript:;"
										onclick="turnpage(2);" class="number ">2</a> <a
										href="javascript:;" onclick="turnpage(3);" class="number ">3</a>
									<a href="javascript:;" onclick="turnpage(4);" class="number ">4</a>

									<a href="javascript:;" onclick="show_list(2);"
										title="Next Page">Next »</a> <a href="javascript:;"
										onclick="turnpage(297);" title="Last Page">Last »</a>
								</div> <!-- End .pagination -->
								<div class="clear"></div></td>
						</tr>
					</tfoot>
					<tbody id="show">
					</tbody>
				</table>
			</div>
			<!-- End #tab1 -->


		</div>
		<!-- End .content-box-content -->
	</div>