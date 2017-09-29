<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/extBrowser.js" charset="utf-8"></script>

<!-- 引入my97日期时间控件 -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

<!-- 引入kindEditor插件 -->
<link rel="stylesheet" href="${basePath}/resources/mes-admin/jslib/kindeditor-4.1.7/themes/default/default.css">
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/kindeditor-4.1.7/kindeditor-all-min.js" charset="utf-8"></script>

<!-- 引入jQuery -->
<!-- <script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>  -->
<script src="${basePath}/resources/mes-admin/jslib/jquery-2.2.4.js" type="text/javascript" charset="utf-8"></script>

<!-- 引入Highcharts -->
<script src="${basePath}/resources/mes-admin/jslib/Highcharts-3.0.1/js/highcharts.js" type="text/javascript" charset="utf-8"></script>


<!-- 引入bootstrap样式 -->
<link href="${basePath}/resources/mes-admin/jslib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${basePath}/resources/mes-admin/jslib/bootstrap-fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

<!-- 引入FileUpload -->
<!-- canvas-to-blob.min.js is only needed if you wish to resize images before upload.
     This must be loaded before fileinput.min.js -->
<script src="${basePath}/resources/mes-admin/jslib/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
<!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview.
     This must be loaded before fileinput.min.js -->
<script src="${basePath}/resources/mes-admin/jslib/bootstrap-fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>
<!-- purify.min.js is only needed if you wish to purify HTML content in your preview for HTML files.
     This must be loaded before fileinput.min.js -->
<script src="${basePath}/resources/mes-admin/jslib/bootstrap-fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
<!-- the main fileinput plugin file -->
<script src="${basePath}/resources/mes-admin/jslib/bootstrap-fileinput/js/fileinput.min.js"></script>



<script charset="utf-8" src="${basePath}/resources/mes-admin/jslib/bootstrap-3.3.7/js/bootstrap.min.js" charset="utf-8"></script>


<!-- 引入FileUpload -->
<script src="${basePath}/resources/mes-admin/jslib/bootstrap-fileinput/themes/gly/theme.js"></script>
<!-- optionally if you need translation for your language then include 
    locale file as mentioned below -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/bootstrap-fileinput/js/locales/zh.js"></script>

<!-- 引入EasyUI -->
<link id="easyuiTheme" rel="stylesheet" href="${basePath}/resources/mes-admin/jslib/jquery-easyui-1.5.1/themes/<c:out value="${cookie.easyuiThemeName.value}" default="bootstrap"/>/easyui.css" type="text/css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.3/themes/icon.css" type="text/css"> -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/jquery-easyui-1.5.1/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<!-- 引入EasyUI Portal插件 -->
<link rel="stylesheet" href="${basePath}/resources/mes-admin/jslib/jquery-easyui-portal/portal.css" type="text/css">
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/jquery-easyui-portal/jquery.portal.js" charset="utf-8"></script>

<!-- 扩展EasyUI -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/extEasyUI.js?v=201305241044" charset="utf-8"></script>

<!-- 扩展EasyUI Icon -->
<link rel="stylesheet" href="${basePath}/resources/mes-admin/style/extEasyUIIcon.css?v=201305301906" type="text/css">

<!-- 扩展jQuery -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/extJquery.js?v=201305301341" charset="utf-8"></script>
