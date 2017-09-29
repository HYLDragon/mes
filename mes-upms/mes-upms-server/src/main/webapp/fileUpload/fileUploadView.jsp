<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
  <head>
  <!-- 

	
	url:'${pageContext.request.contextPath}/repertoryController/datagrid',
	
	
	
	 $("#update_csv").fileinput({
        showUpload: false,
        language:'zh',
        uploadAsync:true,
        dropZoneEnabled:false,
        uploadUrl:'http://www.soyiyuan.com/',
        maxFileCount: 1,
        maxImageWidth: 600,
        resizeImage: false,
        showCaption: false,
        showPreview: false,
        browseClass: "btn btn-primary btn-lg",
        allowedFileExtensions : ['csv', 'txt'],
        previewFileIcon: ""
    }).on("filebatchselected", function(event, files) {
            $(this).fileinput("upload");
        })
        .on("fileuploaded", function(event, data) {
        if(data.response)
        {
            alert('处理成功');
        }
    });
	
	
	
	$("#file-0a").fileinput({
		uploadUrl : "/upload_img",//上传图片的url
		allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
		overwriteInitial : false,
		maxFileSize : 1000,//上传文件最大的尺寸
		maxFilesNum : 1,//上传最大的文件数量
		initialCaption: "请上传商家logo",//文本框初始话value
		//allowedFileTypes: ['image', 'video', 'flash'],
		slugCallback : function(filename) {
		return filename.replace('(', '_').replace(']', '_');
		}
		});
	
	
	
   -->
  	<title>文件上传</title>
	<jsp:include page="../inc.jsp"></jsp:include>
	<script type="text/javascript">
		var datagrid;
		
		
		$(function(){
			$("#input-fa").fileinput({
			    theme: "fa",
			    uploadUrl: "${pageContext.request.contextPath}/fileController/upload"
			});
			parent.$.messager.progress('close');
		});
		
		var searchFun=function(){
			datagrid.datagrid('load',$.serializeObject($('#bar_bar_searchForm')));
		};
		var cleanFun=function(){
			$('#bar_bar_searchForm input').val('');
			datagrid.dataagrid('load',{});
		};
	</script>
  </head>
  
  <body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		
		<div data-options="region:'center',border:false">
			<!-- <table id="datagrid"></table> -->
			<label class="control-label">请选择上传文件</label>
			<input id="input-fa" name="inputfa[]" type="file" multiple class="file-loading">
		</div>
	</div>
	
	<div id="toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="cleanFun();">清空条件</a>
	</div>
  </body>
</html>
