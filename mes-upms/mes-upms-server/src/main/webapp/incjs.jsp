<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
<!-- FastClick -->     
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/fastclick-1.0.6/lib/fastclick.js"></script>
<!-- NProgress -->     
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/nprogress-0.2.0/nprogress.js"></script>
<!-- Chart.js -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/Chart.js/Chart.js"></script>
<!-- gauge.js -->     
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/gauge.js-1.3.3/dist/gauge.js"></script>
<!-- bootstrap-progressbar与easyui-1.5.1中progress冲突 -->
<!-- <script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/bootstrap-progressbar-0.9.0/bootstrap-progressbar.js"></script> -->

<!-- iCheck --> 
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/icheck-1.0.2/icheck.js"></script>
<!-- Skycons -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/skycons/skycons.js"></script>
<!-- Flot -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot-0.8.3/jquery.flot.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot-0.8.3/jquery.flot.pie.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot-0.8.3/jquery.flot.time.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot-0.8.3/jquery.flot.stack.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot-0.8.3/jquery.flot.resize.js"></script>
<!-- Flot plugins --> 
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot.curvedlines/curvedLines.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/flot-spline/js/jquery.flot.spline.js"></script>
<!-- DateJS --> 
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/date-0.3.1/dist/date.js"></script> -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/Datejs/build/date.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/Datejs/build/date-zh-CN.js"></script>

<!-- JQVMap -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/jqvmap-1.5.1/dist/jquery.vmap.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/jqvmap-1.5.1/dist/maps/jquery.vmap.world.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/jqvmap-1.5.1/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/bootstrap-daterangepicker-2.1.25/moment.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/bootstrap-daterangepicker-2.1.25/daterangepicker.js"></script>
<!-- pnotify-3.2.0 -->
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/pnotify-3.2.0/dist/pnotify.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/pnotify-3.2.0/dist/pnotify.buttons.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/pnotify-3.2.0/dist/pnotify.nonblock.js"></script>


<%--<!-- Datatables -->--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/media/js/dataTables.bootstrap.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Buttons/js/dataTables.buttons.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Buttons/js/buttons.bootstrap.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Buttons/js/buttons.flash.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Buttons/js/buttons.html5.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Buttons/js/buttons.print.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/FixedHeader/js/dataTables.fixedHeader.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/KeyTable/js/dataTables.keyTable.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Responsive/js/dataTables.responsive.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Responsive/js/responsive.bootstrap.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/DataTables-1.10.15/extensions/Scroller/js/dataTables.scroller.js"></script>--%>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/jszip-3.1.3/dist/jszip.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/pdfmake-0.1.28/build/pdfmake.js"></script>
<script type="text/javascript" src="${basePath}/resources/mes-admin/jslib/pdfmake-0.1.28/build/vfs_fonts.js"></script>




<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/custom.js"></script> -->
 
 
 
 
 