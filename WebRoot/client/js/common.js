/**
 * 限制输入长度
 */
$(function(){
	$(".checkLength").keyup(function(){alert(1231)
		var val=this.value;
		if(this.tagName.toLowerCase()=='textarea' ){
			val=$(this).text();
		}
		var length=$(this).attr("maxlength")
		if(strlen(val)>length){
			var strlength = 0;
			for (var i=0; i < val.length; ++i){
				  if (isChinese(val.charAt(i)) == true)
					  strlength = strlength + 2;//中文计算为二个字符
				  else
					  strlength = strlength + 1;
				  if(strlength>length){
					  this.value=val.substring(0,i);
					  break;
				  }
			 }
		}
	});
});

/**
 * 验证函数
 * @param boolean
 * @param str
 * @param obj
 * @returns {Boolean}
 */
function check(boolean,str,obj){
	$(obj).parent().find(".check").remove();
	if(boolean){
		$(obj).parent().find(".check").remove();
		return true;
	}else{
		if($(obj).parent().find(".check").size()==0){
			$(obj).parent().append(" <span class='check' style='color:red;font-size:12px;line-height:24px;'>"+str+"</span>");
		}
		return false;
	}
}
/**
 * 计算文字个字符数
 */
function strlen(str) 
{
 var strlength = 0;
 for (var i=0; i < str.length; ++i)
 {
  if (isChinese(str.charAt(i)) == true)
   strlength = strlength + 2;//中文计算为二个字符
  else
   strlength = strlength + 1;
 }
 return strlength;
}
function isChinese(str)
{
   var lst = /[u00-uFF]/;
   return !lst.test(str);      
}
/**
 * 不能为空，且不能大于length个字符
 * @param obj
 * @param length
 */
function checkNotEmtry(obj,length){
	if(strlen(obj.value)>length){
		check(false,"此项字符数不得大于"+length+"个！",obj);
	}else{
		check(obj.value!="","此项为必填项！",obj);
	}
}
/**
 * 可以为空，且不能大于length个字符
 * @param obj
 * @param length
 */
function checkEmtry(obj,length){
	var str=obj.value;
	if(strlen(str)>length){
		check(false,"此项字符数不得大于"+length+"个！",obj);
	}else{
		check(str=="" || strlen(str)<=length,"",obj);
	}
}
/**
 * 检测是数字
 * @param obj
 * @param length
 */
function checkIsNumber(obj,length){
	var str=/^[\d]{1,}$/;
	if(strlen(obj.value)>length){
		check(false,"此项字符数不得大于"+length+"个！",obj);
	}else{
		check(str.test(obj.value),"请填写数字类型！",obj);
	}
}
/**
 * 检测密码
 */
$(function(){
	$("#checkedPassword").blur(function(){
		var str=/^[\w]{6,16}$/;
		if(check(str.test(this.value),"只能输入6~16之间字母、数字或符号，区分大小写！",this)){
			check($("#repeatPassword").val()=="" || this.value==$("#repeatPassword").val(),"输入密码与确认密码必须相同。",$("#repeatPassword"));
		}
	});
});
$(function(){
	$("#repeatPassword").blur(function(){
		check(this.value==$("#checkedPassword").val() || this.value=="","输入密码与确认密码必须相同。",this);
	});
});
/**
 * 检测身份证(，例如：350625199912255632)
 * @param obj
 */
function checkIdenf(obj){
	var str=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
	check(str.test(obj.value),"请输入正确的身份证号码！",obj);
}

/**
 * 检测身份证(可以为空)
 * @param obj
 */
function checkIdenfEmtry(obj){
	var str=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
	check(obj.value=="" || str.test(obj.value),"请输入正确的身份证号码！",obj);
}
/**
 * 检测联系电话
 */
function checkTelephone(obj){
	var str=/^[\d]{11}$/;
	check(str.test(obj.value),"请输入正确的手机格式，例如：16565856565！",obj);
}
/**
 * 检测联系电话(可以为空)
 */
function checkTelephoneEmtry(obj){
	var str=/^[\d]{11}$/;
	check(obj.value=="" || str.test(obj.value),"请输入正确的手机格式，例如：16565856565！",obj);
}
/**
 * 检测QQ
 */
function checkQQ(obj){
	var str=/^[\d]{6,15}$/;
	check(str.test(obj.value),"请输入正确的QQ格式，例如：123456！",obj);
}
/**
 * 检测电子邮件
 * @param obj
 */
function checkEmail(obj){
	var str=/^[\w]+@[\w]+(\.com|\.COM)$/;
	check(str.test(obj.value),"请输入正确的email，例如：yourname@domain.com",obj);
}

