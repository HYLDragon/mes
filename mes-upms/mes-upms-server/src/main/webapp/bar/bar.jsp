<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<title>条码管理</title>

<jsp:include page="../inc.jsp"></jsp:include>
<c:if test="${fn:contains(sessionInfo.resourceList,'barController/datagrid')}">
	<script type="text/javascript">
		$.canView=true;
	</script>
</c:if>
<script type="text/javascript">
	var datagrid;
	var matTypeCombobox;
	$(function(){
		datagrid=$("#datagrid").datagrid({
			url:'${pageContext.request.contextPath}/barController/datagrid',
			fit : true,
			fitColumns : true,
			border : false,
			pagination : true,
			idField : 'id',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			sortName : 'name',
			sortOrder : 'asc',
			checkOnSelect : false,
			selectOnCheck : false,
			nowrap : false,
			rownumbers:true,
			columns : [ [{
				field : 'id',
				title : 'id',
				width : 20,
				checkbox : true
			}, {
				field : 'shortBar',
				title : '条码',
				width : 75,
				align:'center'
			}, {
				field : 'matName',
				title : '胶料名称',
				width : 50,
				align:'center'
			}, {
				field : 'matLot',
				title : '批号',
				width : 60,
				align:'center'
			}, {
				field : 'starBatch',
				title : '开始手数',
				width : 40,
				align:'center'
			}, {
				field : 'endBatch',
				title : '结束手数',
				width : 40,
				align:'center'
			}, {
				field : 'remainder',
				title : '剩余',
				width : 30,
				align:'center'
			}, {
				field : 'createdDateTime',
				title : '生成条码时间',
				width : 90,
				align:'center'
			}, {
				field : 'modifyDateTime',
				title : '条码修改时间',
				width : 90,
				align:'center'
			}, {
				field : 'kuWei',
				title : '库位',
				width : 120,
				align:'center',
				formatter:function(value,row,index){
					var str="";
					var arr1=$.stringToList(row.kuWei);
					var arr2=$.stringToList(row.kuWeiDate);
					var b=false;
					for(var i=0;i<arr1.length;i++){
						if(b){
							str+='<br/>';
						}else{
							b=true;
						}
						str+="库位:["+arr1[i]+"] 时间:["+new Date(arr2[i]).format()+"]";
					}
					return str;
				}
			}, {
				field : 'palletNo',
				title : '栈板',
				width : 120,
				align:'center',
				formatter:function(value,row,index){
					var str="";
					var arr1=$.stringToList(row.palletNo);
					var arr2=$.stringToList(row.palletNoDate);
					var b=false;
					for(var i=0;i<arr1.length;i++){
						if(b){
							str+='<br/>';
						}else{
							b=true;
						}
						str+="栈板:["+arr1[i]+"] 时间:["+new Date(arr2[i]).format()+"]";
					}
					return str;
				}
			}, {
				field : 'matType',
				title : '胶料类型',
				width : 40,
				align:'center'
			}, {
				field : 'matTypeSLZ',
				title : '试量正',
				width : 40,
				align:'center'
			}]],
			toolbar:'#toolbar',
			onLoadSuccess : function() {
				//$('#searchForm table').show();
				parent.$.messager.progress('close');
				$(this).datagrid('tooltip');
			},
			onRowContextMenu : function(e, rowIndex, rowData) {
				e.preventDefault();
				$(this).datagrid('unselectAll').datagrid('uncheckAll');
				//$(this).datagrid('selectRow', rowIndex);
				//$('#menu').menu('show', {
				//	left : e.pageX,
			//		top : e.pageY
			//	});
			}
		});
	});
	
	//加载input matType类型
	$(function(){
		matTypeCombobox=$('#matType').combobox({
		    url:'${pageContext.request.contextPath}/json/matTypeCombobox.json',
		    width:80,
		    valueField:'id',
		    textField:'text'
		});
	});
	
	var searchFun=function(){
		datagrid.datagrid('load',$.serializeObject($('#bar_bar_searchForm')));
	};
	var cleanFun=function(){
		//$("#bar_bar_searchForm input").not("#matType").val('');
		var j=$("#bar_bar_searchForm input").not("#_easyui_textbox_input2");
		j.val('');
		datagrid.datagrid('load',{});
	};
</script>

</head>
<body>
	<div id="bar_bar_layout" class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'north',title:'查询条件',border:false" style="heigth:180px;overflow:hidden;">
			<form id="bar_bar_searchForm">
				<table class="table table-hover table-condensed">
					<tr>
						<th>条码</th>
						<td><input class="span2"  name="shortBarCX" placeholder="可以模糊查询条码"/></td>
						<th>批号</th>
						<td><input class="span2"  name="matLotCX" placeholder="可以模糊查询批号" /></td>
						<th>胶号</th>
						<td><input class="span2"  name="matName" placeholder="可以模糊查询批号" /></td>
					</tr>

					<tr>
						<th>胶料类型</th>
						<td><input id="matType" name="matType" class="easyui-combobox" data-options="valueField:'id',textField:'text',panelHeight:'auto'" /></td>
						<th>创建时间</th>
						<td><input class="span2"  name="createdDateTimeStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至<input class="span2" name="createdDateTimeEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/></td>
						<th>修改时间</th>
						<td><input class="span2"  name="modifyDateTimeStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至<input class="span2" name="modifyDateTimeStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/></td>
					</tr>

				</table>
			</form>
		</div>
		
		<div data-options="region:'center',title:'条码管理'">
			<table id="datagrid"></table>
		</div>
		<div id="toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'brick_delete',plain:true" onclick="cleanFun();">清空条件</a>
		</div>
	</div>
</body>
</html>