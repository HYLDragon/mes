<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
  <head>
  <!-- 
private String id;
	private String repertoryName;
	private Timestamp createdDateTime;
	private Timestamp modifyDateTime;
	private String remark;
   -->
  	<title>库区管理</title>
	<jsp:include page="../inc.jsp"></jsp:include>
	<script type="text/javascript">
		var datagrid;
		$(function(){
			datagrid=$('#datagrid').datagrid({
				url:'${pageContext.request.contextPath}/repertoryController/datagrid',
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
					field:'repertoryName',
					title:'库区名称',
					width:60,
					align:'center'
				}]],
				columns:[[{
					field:'createdDateTime',
					title:'创建时间',
					width:120,
					align:'center'
				},{
					field:'modifyDateTime',
					title:'修改时间',
					width:120,
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
			});
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
		<div data-options="region:'north',title:'过滤条件',border:false" style="height:160px;overflow:hidden">
			<form id="searchForm">
			
			</form>
		</div>

		<div data-options="region:'center',border:false">
			<table id="datagrid"></table>
		</div>
	</div>
	
	<div id="toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="cleanFun();">清空条件</a>
	</div>
  </body>
</html>
