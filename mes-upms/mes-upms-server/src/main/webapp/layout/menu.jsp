

<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
  <div class="menu_section">
    <h3>General</h3>
    <ul class="nav side-menu">
      <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="index.jsp">Dashboard</a></li>
          <li><a _href="index2.jsp">Dashboard2</a></li>
          <li><a _href="index3.jsp">Dashboard3</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="form.jsp">General Form</a></li>
          <li><a _href="form_advanced.jsp">Advanced Components</a></li>
          <li><a _href="form_validation.jsp">Form Validation</a></li>
          <li><a _href="form_wizards.jsp">Form Wizard</a></li>
          <li><a _href="form_upload.jsp">Form Upload</a></li>
          <li><a _href="form_buttons.jsp">Form Buttons</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="general_elements.jsp">General Elements</a></li>
          <li><a _href="media_gallery.jsp">Media Gallery</a></li>
          <li><a _href="typography.jsp">Typography</a></li>
          <li><a _href="icons.jsp">Icons</a></li>
          <li><a _href="glyphicons.jsp">Glyphicons</a></li>
          <li><a _href="widgets.jsp">Widgets</a></li>
          <li><a _href="invoice.jsp">Invoice</a></li>
          <li><a _href="inbox.jsp">Inbox</a></li>
          <li><a _href="calendar.jsp">Calendar</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="tables.jsp">Tables</a></li>
          <li><a _href="tables_dynamic.jsp">Table Dynamic</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="chartjs.jsp">Chart JS</a></li>
          <li><a _href="chartjs2.jsp">Chart JS2</a></li>
          <li><a _href="morisjs.jsp">Moris JS</a></li>
          <li><a _href="echarts.jsp">ECharts</a></li>
          <li><a _href="other_charts.jsp">Other Charts</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="fixed_sidebar.jsp">Fixed Sidebar</a></li>
          <li><a _href="fixed_footer.jsp">Fixed Footer</a></li>
        </ul>
      </li>
    </ul>
  </div>
  <div class="menu_section">
    <h3>Live On</h3>
    <ul class="nav side-menu">
      <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="e_commerce.jsp">E-commerce</a></li>
          <li><a _href="projects.jsp">Projects</a></li>
          <li><a _href="project_detail.jsp">Project Detail</a></li>
          <li><a _href="contacts.jsp">Contacts</a></li>
          <li><a _href="profile.jsp">Profile</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a _href="page_403.jsp">403 Error</a></li>
          <li><a _href="page_404.jsp">404 Error</a></li>
          <li><a _href="page_500.jsp">500 Error</a></li>
          <li><a _href="plain_page.jsp">Plain Page</a></li>
          <li><a _href="login.jsp">Login Page</a></li>
          <li><a _href="pricing_tables.jsp">Pricing Tables</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
            <li><a _href="#level1_1">Level One</a>
            <li><a>Level One<span class="fa fa-chevron-down"></span></a>
              <ul class="nav child_menu">
                <li class="sub_menu"><a _href="level2.jsp">Level Two</a>
                </li>
                <li><a _href="#level2_1">Level Two</a>
                </li>
                <li><a _href="#level2_2">Level Two</a>
                </li>
              </ul>
            </li>
            <li><a _href="#level1_2">Level One</a>
            </li>
        </ul>
      </li>                  
      <li><a _href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
    </ul>
  </div>

</div>
<!-- /sidebar menu -->

<!-- /menu footer buttons -->
<div class="sidebar-footer hidden-small">
  <a data-toggle="tooltip" data-placement="top" title="Settings">
    <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
  </a>
  <a data-toggle="tooltip" data-placement="top" title="FullScreen">
    <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
  </a>
  <a data-toggle="tooltip" data-placement="top" title="Lock">
    <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
  </a>
  <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
    <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
  </a>
</div>
<!-- /menu footer buttons -->

<script type="text/javascript">
var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
	$SIDEBAR_MENU = $('#sidebar-menu'),
	$BODY = $('#bodyMenu');
	
$(function(){
	init_sidebar();
});
	
	
// Sidebar
function init_sidebar() {

  $SIDEBAR_MENU.find('a').on('click', function(ev) {
	  console.log('clicked - sidebar_menu');
	  
        var $li = $(this).parent();
		var str=$(this).attr('_href');
        if(str && str.length>4){
        	addTab({
        		url:'${pageContext.request.contextPath}/jsTest/'+str,
        		title:str.substring(0,str.length-4),
        		iconCls:''
        	});
        }
        
        if ($li.is('.active')) {
            $li.removeClass('active active-sm');
            $('ul:first', $li).slideUp();
        } else {
            // prevent closing menu if we are on child menu
            if (!$li.parent().is('.child_menu')) {
                $SIDEBAR_MENU.find('li').removeClass('active active-sm');
                $SIDEBAR_MENU.find('li ul').slideUp();
            }else
            {
				if ( $BODY.is( ".nav-sm" ) )
				{
					$SIDEBAR_MENU.find( "li" ).removeClass( "active active-sm" );
					$SIDEBAR_MENU.find( "li ul" ).slideUp();
				}
			}
            //先清除原先选 中的
            $li.parent().find('li').removeClass('active active-sm');
            
            $li.addClass('active');
            $('ul:first', $li).slideDown(function() {
            	
            });
        }
    });
 

	


};
// /Sidebar

function addTab(params) {
	var iframe = '<iframe src="' + params.url + '" frameborder="0" style="border:0;width:98%;height:98%;"></iframe>';
	var t = $('#index_tabs');
	var opts = {
		title : params.title,
		closable : true,
		iconCls : params.iconCls,
		content : iframe,
		border : false,
		fit : true
	};
	if (t.tabs('exists', opts.title)) {
		t.tabs('select', opts.title);
		parent.$.messager.progress('close');
	} else {
		t.tabs('add', opts);
	}
}
</script>


