<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <!-- 


url:'${pageContext.request.contextPath}/repertoryController/datagrid',

  -->
<script type="text/javascript">
	var datagrid;
	
	//parent.$.messager.progress('close');
	$(function(){
		parent.$.messager.progress('close');
		$("#input-fa").fileinput({
		    theme: "fa",
		    language:'zh',
	        uploadAsync:true,  
		    uploadUrl: "${pageContext.request.contextPath}/fileController/upload"
		}).on("fileuploaded", function(event, data) {
	        if(data.response)
	        {
	            //alert('处理成功'+data+" [response]"+data.response);
	        }
		});
		
		//setTimeout($("#kvFileinputModal").find(".modal-content").attr({"z-index",9999}),20000);
		
		
	});
	
	var searchFun=function(){
		datagrid.datagrid('load',$.serializeObject($('#bar_bar_searchForm')));
	};
	var cleanFun=function(){
		$('#bar_bar_searchForm input').val('');
		datagrid.dataagrid('load',{});
	};
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	
	<div data-options="region:'center',border:false">
		<label class="control-label">选择上传文件</label>
		<input id="input-fa" name="inputfa[]" type="file" multiple class="file-loading">
	</div>
</div>

<div id="toolbar">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="cleanFun();">清空条件</a>
</div>

