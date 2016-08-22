$(document).ready(function() {
	// alert($("input.bankcard").val().length);
	$("input#save").hide();
	$("input#invalue").hide();
	$("input#quit").hide();
	
	$("input#quit").click(function() {
		$("input#save").hide();
		$("input#invalue").hide();
		$("input#quit").hide();
		$("span#outvalue").show();
		$("input#back").show();
		$("input#update").show();
	});
	
	
	$("input#update").click(function() {
		$("input#back").hide();
		$("span#outvalue").hide();
		$("input#invalue").show();
		$("input#quit").show();
		$("input#update").hide();
		$("input#save").show();
		
		$("input.notnull").blur(function() {
			if($(this).val().length>0&&$(this).val()!=""){
				$(this).css("border", "1px solid green");
			}else{
				$(this).css("border", "1px solid red");
			}
		});
 
	});

	$("input#save").click(function() {
		var isOk=true;
		$("input.notnull").each(function() {
			if($(this).val().length>0&&$(this).val()!=""){
				$(this).css("border", "1px solid green");
			}else{
				isOk=false;
				$(this).css("border", "1px solid red");
			}
		});
		if(isOk){
		 // 输入符合规范
			if (confirm("确认修改用户信息?")) {
				$("input#invalue").hide();
				$("span#outvalue").show();
				$("input#save").hide();
				$("input#update").show();
				// 提交 submit
				$("form.updateLeu").submit();
			}
		} 
	});
});