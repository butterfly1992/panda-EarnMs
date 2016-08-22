function downclick(page) {
	var pages = parseInt(page);// 获取当前的总页数
	var input = $("#curpage");
	if (input.val() != pages) {
		input.val(pages);
		pagesubmit();
	}
}
function pagesubmit() {
	$("#form_page").submit();
}

$(".search").mouseover(function(){
	$("#curpage").val("1");
});
 