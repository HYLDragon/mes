<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
  <head>
  <!-- 

	
	url:'${pageContext.request.contextPath}/repertoryController/datagrid',
	
	private String filename;
    private int filesize;
    private String filetype;
    private boolean has_file;
    private boolean is_dir;
    private boolean is_photo;
    private String datetime;
	
	
	
	if (downloadIframe == "undefined"){  
             var iframe = document.createElement("iframe");  
             downloadIframe = iframe;  
             document.body.appendChild(downloadIframe);  
         }  
downloadIframe.src = '${pageContext.request.contextPath}/fileController/downLoad?pathUrl='+currentPath;  

downloadIframe.style.display = "none";  

	
	$.ajax({ url: '${pageContext.request.contextPath}/fileController/downLoad',
	dataType: 'json',
	type: 'POST',
	data:{pathUrl:currentPath},
	success: function(data){
		alert(data);
       	alert("下载成功!");
     }});
   -->
  	<title>上传下载管理</title>
	<jsp:include page="../inc.jsp"></jsp:include>
	<script type="text/javascript">
		var datagrid;
		var checkRow;
		var downloadIframe;
		$(function(){
			
			
			datagrid=$("#datagrid").datagrid({
				url:'${pageContext.request.contextPath}/fileController/fileManage',
				fit:true,
				fitColumns:true,
				border:false,
				idField:'id',
				checkOnSelect : false,
				selectOnCheck : false,
				nowrap : false,
				method:'post',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 40, 50 ],
				sortName : 'name',
				sortOrder : 'asc',
				frozenColumns:[[{
					field:'id',
					title:'id',
					width:50,
					checkbox:true
				},{
					field:'filename',
					title:'文件名',
					width:140,
					align:'center'
				}]],
				columns:[[{
					field:'filesize',
					title:'文件大小',
					width:60,
					align:'center'
				},{
					field:'filetype',
					title:'文件类型',
					width:70,
					align:'center'
				},{
					field:'datetime',
					title:'创建时间',
					width:120,
					align:'center'
				},{
					field:'currentPath',
					title:'当前路径',
					width:190,
					align:'center'
				},{
					field:'remark',
					title:'备注',
					width:140,
					align:'center'
				}]],
				toolbar:'#toolbar',
				onLoadSuccess:function(data){
					parent.$.messager.progress('close');
					//$.messager.progress('close');
				},
				onLoad:function(){
					
				},
				onBeforeRender:function(target, rows){
					
				},
				onCheck:function(index,row){
					//datagrid.datagrid('uncheckAll').datagrid('checkRow',index);
					//checkRow=index;
				},
				onDblClickRow:function(index,row){
					datagrid.datagrid('checkRow',index);
					next();
				},
				
			});
			
			
			//$("#layout_south").layout('collapse','south');
			
		});
		
		
		var searchFun=function(){
			datagrid.datagrid('load',$.serializeObject($('#bar_bar_searchForm')));
		};
		var cleanFun=function(){
			$('#bar_bar_searchForm input').val('');
			datagrid.dataagrid('load',{});
		};
		
		var upload=function(){
			//<!-- -->
			//parent.$.modalDialog({
			//	title : '上传',
			//	width : 800,
			//	height : 500,
			//	href : '${pageContext.request.contextPath}/fileController/view2',
			//});
			$("#layout_south").layout('collapse','north').layout('','center');
			$("#layout_south").layout('onExpand','south');
		};
		var next=function(){
			//如果先前有选中，先清除掉
			//if(checkRow){
			//	var row =datagrid.datagrid('getRowIndex',checkRow);
			//	datagrid.datagrid('uncheckRow',row);
			//	checkRow=undefined;
			//}
			//datagrid.datagrid('uncheckAll').datagrid('checkRow',checkRow);
			
			//获得所选 择行
			var rows=datagrid.datagrid('getChecked');
			
			if(rows.length==1){
				//获得码数值
				//console.log(rows.currentPath);
				var currentPath=rows[0].currentPath;
				var filename=rows[0].filename;
				var is_dir=rows[0].is_dir;
				currentPath+="/"+filename+"/";
				var row =datagrid.datagrid('getRowIndex',rows[0].id);
				datagrid.datagrid('uncheckRow',row);
				//传参，重新加载
				if(is_dir){
					datagrid.datagrid('load',{pathUrl:currentPath});					
				}else{
					$.messager.alert({
						title:'提示',
						msg:'你所点是文件,不是目录!',
					});
				}
			}else{
				$.messager.alert({
					title:'提示',
					msg:'请选择一行!'
				});
			}

		};
		
		var previous=function(){
			var rows=datagrid.datagrid('getRows');
			var currentPath=rows[0].currentPath;
			var index=currentPath.lastIndexOf("//");
			if(index>0){
				var currentPath=currentPath.substring(0,index+1);
				datagrid.datagrid('load',{pathUrl:currentPath});
			}else{
				$.messager.alert({
					title:'提示',
					msg:'已到顶极目录!'
				});
			}
			
		};
		
		var down=function(){
			
			//获得所选 择行
			var rows=datagrid.datagrid('getChecked');
			
			if(rows.length==1){
				//获得码数值
				//console.log(rows.currentPath);
				var currentPath=rows[0].currentPath;
				var currentUrl="";
				var filename=rows[0].filename;
				var is_dir=rows[0].is_dir;
				currentPath+="/"+filename;
				var index=currentPath.indexOf("ZXMES");
				//currentUrl=currentPath.substring(index+6,(currentPath.length-1));
				var row =datagrid.datagrid('getRowIndex',rows[0].id);
				datagrid.datagrid('uncheckRow',row);
				
				//currentUrl='${pageContext.request.contextPath}/'+currentUrl;
				//var reg=new RegExp("\//","g");
				//currentUrl=currentUrl.replace(reg,"\/");
				
				//currentUrl=encodeURI(encodeURI(currentUrl));


				//var mydown = window.open(currentUrl);
				//mydown.document.execCommand("SaveAs");
				//mydown.close();
				if(!is_dir){				
					currentPath=encodeURI(encodeURI(currentPath));
					
					$('<iframe/>', {  
					     src: '${pageContext.request.contextPath}/fileController/downLoad?pathUrl='+currentPath,  
					     width: 0,  
					     height:0,
					     display:'none'
					 }).appendTo('body');  
				
				}else{
					$.messager.alert({
						title:'提示',
						msg:'不能对目录进行下载!,请选择文件'
					});
				}
				
			}else{
				$.messager.alert({
					title:'提示',
					msg:'请选择一行!'
				});
			}

			

		};
	</script>
  </head>
  
  <body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'north',title:'查询条件',border:false" style="height:60px;overflow:hidden;">
			<form id="searchForm">
				<table class="table table-hover table-condensed">
					<tr>
						<th>搜索文件</th>
						<td><input class="span2" name="fileName" placeholder="模糊查询文件" /></td>
					</tr>
				</table>
			</form>
			
		</div>
		<div data-options="region:'center',title:'文件管理',border:false">
			<table id="datagrid"></table>
		</div>
		<!-- 
		<div id="layout_south" data-options="region:'south',title:'文件上传',border:false,href:'${pageContext.request.contextPath}/fileUpload/fileUpload.jsp'">
			
		</div>
		 -->
	</div>
	
	<div id="toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="cleanFun();">清空条件</a>
			<!-- <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="upload();">上传</a> -->
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="next();">下一层</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="previous();">上一层</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="down();">下载</a>
	</div>
  </body>
</html>
