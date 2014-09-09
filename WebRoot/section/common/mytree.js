function  initTree(treeId,treeurl,formID){
	 $("#"+treeId).tree({
         url:treeurl,
         
         cascadeCheck:true,
         
         checkbox:treecheckbox,
	        onClick:function(node){
	            treeclick(node,formID);
	        }
     });
}

function  loadTreeData(tId){
	$("#"+tId).tree('reload');
}

//取得选择的树的节点
function  getCheckedNodes(treeID,isChecked){
	var  nodes = {} ;
	if(isChecked){
	 
	   nodes = $("#"+treeID).tree('getChecked',["indeterminate","checked"]);
//	   var inodes = $("#"+treeID).tree('getChecked',["indeterminate","checked"]);
//	   alert(inodes.length);
//	   if(inodes.length>0){
//		 for(var i=0;i<inodes.lenght;i++){
//	       nodes[nodes.length]=inodes[i];
//		 }
//	   }
	   
	}else{
	   nodes = $("#"+treeID).tree("getChecked","unchecked");
	}
	return nodes;
}

function  getSelectTreeNode(treeID){
	var  node = $("#"+treeID).tree('getSelected');
	return  node;
}


//取得选择或者非选择的ID编号
function  getCheckedNodesOfID(treeID,isChecked){
	var nodes = getCheckedNodes(treeID,isChecked);
	var ids = "";
	//alert(nodes.length);
	for(var i=0;i<nodes.length;i++){
		var node = nodes[i];
		var id = node.id;
		
		ids += id+",";
	}
	if(ids.length!=0){
		ids = ids.substring(0,ids.length-1);
	}
	return ids;
}

//全不选
function  unchecked(treeID){
	var node = $("#"+treeID).tree("find",0);
	$("#"+treeID).tree("uncheck",node.target);
}

//设置树选定
function  setTreeChecked1(treeID,data){
	var nodes = $("#"+treeID).tree("getRoots");
	//alert(nodes["data"]);
	for(var i=0;i<data.length;i++){
		var json = data[i];
		//菜单编号
		var mnumber = json.menuid;
		if(mnumber!=0){
			var node = $("#"+treeID).tree("find",mnumber);
			if(node!=null&&node!='undefined'){
			   $("#"+treeID).tree("check",node.target);
			}
		}
	}
}

function  getTreeNodes(treeID){
	var troots = $("#"+treeID).tree("getRoots");
	var array = new Array();
	for(var i=0;i<troots.length;i++){
	   var troot = troots[i];
	  // array[array.length] = troot;
	   var childs = $("#"+treeID).tree("getChildren",troot.target);
	   for(var j=0;j<childs.length;j++){
		   var child = childs[j];
		   array[array.length] = child;
	   }
	  
	}
	return array;
}


//设置树选定
function  setTreeChecked(treeID,data){
	var nodes = getTreeNodes(treeID);
	//alert(nodes.length);
	
	for(var i=0;i<nodes.length;i++){
		var json = nodes[i];
		//菜单编号
		var mnumber = json.id;
		//alert($.toJSON(mnumber));
		//alert(data[mnumber]);
		var node = $("#"+treeID).tree("find",mnumber);
		if(typeof(data[mnumber])!='undefined'&&
			data[mnumber]!=null){
			
			if(node!=null&&node!='undefined'){
			   $("#"+treeID).tree("check",node.target);
			}
		}else{
			$("#"+treeID).tree("uncheck",node.target);
		}
	}
}