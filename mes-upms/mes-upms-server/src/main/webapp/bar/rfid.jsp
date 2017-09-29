<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
  <head>
  <!-- 
  	private String rfid;
	private String palletNo;
	private Date createdDateTime;
	private Date modifyDateTime;
	private String remark;
	
	
	
		private String id;
	private String shortbar;
	private String rfid;
	private Date createdDateTime;
	private String remark;
	private String name;
	
   -->
  	<title>RFID管理</title>
	<jsp:include page="../inc.jsp"></jsp:include>
	<script type="text/javascript">
		var datagrid;
		var south_datagrid;
		var datagridEditing;
		var datagridEditRow;
		$(function(){
			//$('#layout').layout('collapse','south');//折叠panel
			datagrid=$('#datagrid').datagrid({
				url:'${pageContext.request.contextPath}/rfidController/datagrid',
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
					field:'palletNo',
					title:'栈板',
					width:60,
					align:'center'
				}]],
				columns:[[{
					field:'rfid',
					title:'芯片',
					width:140,
					align:'center'
				},{
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
			datagrid.datagrid('load',$.serializeObject($('#rfid_searchForm')));
		};
		var cleanFun=function(){
			$('#rfid_searchForm input').val('');
			datagrid.dataagrid('load',{});
		};
		
		var viewDetail=function(){
			if(datagridEditRow!=undefined){
				$.messager.alert({
					title:'提示',
					msg:'正在编辑中,不允许再选中!'
				});
			}else{
				//选中一行做处理，其它的全不处理
				var rows=datagrid.datagrid('getChecked');
				//alert(rows.length);
				if(rows!=undefined && rows.length==1){
					var rfidId=rows[0].id;
					
					south_datagrid=$('#south_datagrid').datagrid({
						url:'${pageContext.request.contextPath}/rfidController/datagrid2',
						queryParams: {
							rfidId: rfidId
						},
						fit:true,
						fitColumns:true,
						border:false,
						idField:'id',
						checkOnSelect : false,
						selectOnCheck : false,
						nowrap : false,
						method:'post',
						rownumbers:true,
						pagination : true,
						pageSize : 3,
						pageList : [ 3, 6, 9, 12, 15 ],
						sortName : 'createdDateTime',
						sortOrder : 'asc',
						frozenColumns:[[{
							field:'id',
							title:'id',
							width:50,
							checkbox:true
						},{
							field:'palletNo',
							title:'栈板',
							width:60,
							align:'center'
						}]],
						columns:[[{
							field:'shortbar',
							title:'条码',
							width:100,
							align:'center'
						},{
							field:'oldbar',
							title:'长条码',
							width:120,
							align:'center'
						},{
							field:'createdDateTime',
							title:'创建时间',
							width:120,
							align:'center'
						},{
							field:'name',
							title:'修改人',
							width:80,
							align:'center'
						},{
							field:'remark',
							title:'备注',
							width:140,
							align:'center'
						}]],
						onLoadSuccess:function(data){
							$('#layout').layout('expand','south');
						},
						onCollapse:function(region){
							alert("xx");
							if(region="south"){
								alert(true);
							}
						},
						onExpand:function(region){
							alert("xxxxx");
						},
					});
					
				}else{
					$.messager.alert('提示','请选择一行!','info');//1.3.1不支持title: msg:的写法
				}
			}
		};
	</script>
  </head>
  
  <body>
	<div id="layout" class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'north',title:'过滤条件',border:false" style="height:65px;overflow:hidden">
			<form id="rfid_searchForm">
				<table class="table table-hover table-condensed">
					<tr>
						<th>部门</th>
						<td><input class="span2"  name="dept" placeholder="可以模糊查询部门"/></td>
						<th>栈板</th>
						<td><input class="span2"  name="palletNo" placeholder="可以模糊查询栈板" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="datagrid"></table>
		</div>
		<div data-options="region:'south',title:'详细情况',border:false,collapsed:true" style="height:160px;">
			<table id="south_datagrid"></table>
		</div>
	</div>
	
	
	
	
	<div id="toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="cleanFun();">清空条件</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick',plain:true" onclick="viewDetail();">详细情况</a>
	</div>
  </body>
</html>
