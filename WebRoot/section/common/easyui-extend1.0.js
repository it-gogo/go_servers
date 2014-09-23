$.extend($.fn.form.methods,{ 
	setForm:function(jq,json){
		jQuery('input,select,textarea',jq).each(function() {
	    	var t = this.type, tag = this.tagName.toLowerCase(), id = this.id;
	    	if( id != "" )
			{
	    		
				if ( t == 'text' || t == 'hidden' || t == 'password'||t =='textarea' || tag=='textarea' )
				{
					
					if( json[id] != null )
					{
						this.value = json[id];
						
					}
				}
				else if( t == 'select-one' )
				{
					if( json[id] != null )
					{
						this.value = json[id];
						this.title = json[id];
					}
				}
				else if(t == "checkbox" || t=="radio")
				{
					if( json[id] != null )
						if( json[id] == this.value )
							this.checked = true;
				}
				
			}
		
	});
	}
	
});

$.extend($.fn.datagrid.methods, {
    editCell: function(jq,param){
        return jq.each(function(){
            var opts = $(this).datagrid('options');
            var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
            for(var i=0; i<fields.length; i++){
                var col = $(this).datagrid('getColumnOption', fields[i]);
                col.editor1 = col.editor;
                if (fields[i] != param.field){
                    col.editor = null;
                }
            }
            $(this).datagrid('beginEdit', param.index);
            for(var i=0; i<fields.length; i++){
                var col = $(this).datagrid('getColumnOption', fields[i]);
                col.editor = col.editor1;
            }
        });
    }
});

var editIndex = undefined;
var editField = undefined;
function endEditing(){
	//alert(editIndex);
    if (editIndex == undefined){return true}
    
	    if ($('#'+gID).datagrid('validateRow', editIndex)){
	        $('#'+gID).datagrid('endEdit', editIndex);
	        
	        editIndex = undefined;
	        editField = undefined;
	        return true;
	    } else {
	        return false;
	    }
    
}

$.extend($.fn.datagrid.defaults.editors, {
    text: {
        init: function(container, options){
            var input = $('<input type="text" class="datagrid-editable-input">').appendTo(container);
            return input;
        },
        destroy: function(target){
            $(target).remove();
        },
        getValue: function(target){
            return $(target).val();
        },
        setValue: function(target, value){
            $(target).val(value);
        },
        resize: function(target, width){
            $(target)._outerWidth(width);
        }
    }
});

$.extend($.fn.datagrid.defaults.editors, {
    checkboxs: {
        init: function(container, options){
            var input = $('<input type="checkbox" class="datagrid-editable-input">').appendTo(container);
            return input;
        },
        destroy: function(target){
            $(target).remove();
        },
        getValue: function(target){
            return $(target).val();
        },
        setValue: function(target, value){
            $(target).val(value);
        },
        resize: function(target, width){
            $(target)._outerWidth(width);
        }
    }
});




