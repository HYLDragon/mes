<%@ page language="java" pageEncoding="UTF-8"%>
<ul>
	<li>20170417添加了文件上传的功能，并且优化了上传界面,做到美观</li>
	<li>20170417将bootstrap更新到3.3.7版本，不再支持IE6，7，8，9，将针对全面支持HTML5的浏览器进行开发</li>
	<li>20170302添加了ehcache功能，缓存了资源类型和BUG类型的数据</li>
	<li>20170231修复Oracle数据库中，用户图表报错的BUG，原因是创建时间是java.util.Date类型，在使用[HOUR]函数的时候，报错信息[ORA-30076: 对析出来源无效的析出字段]</li>
	<li>20175230修复菜单地址错误的时候，点击菜单，遮罩一直不消失的BUG</li>
	<li>20170229增加一个图表演示功能，计算出某时间段用户注册数量</li>
	<li>20170229修正用户登录中，自动补全登录和补全表格登录时，不能按回车进行登录的BUG</li>
	<li>20170229修正用户管理中，点击任何操作按钮的时候，会记住以前选中过的行的BUG</li>
	<li>20170228用户登录增加自动补全表格功能</li>
	<li>20170228用户登录增加自动补全功能</li>
	<li>20170228升级hibernate版本到4.3.1.Final</li>
	<li>20170228升级spring版本到4.3.6.RELEASE</li>
	<li>20170228将只对tomacat进行优化</li>
	<li>20170224修正登录时，左侧功能树会加载两次的BUG</li>
	<li>20170224系统登录时，左侧菜单增加数据加载遮罩效果</li>
	<li>20170224修正在火狐/IE浏览器中，点击添加XX按钮后，然后不断点击回车键会出现重复弹出dialog的BUG</li>
	<li>20170223为datagrid和treegrid增加了tooltip功能</li>
	<li>20170222添加了用户可以查看自己的角色和权限功能</li>
	<li>20170222修正角色管理中，越权管理角色的BUG</li>
	<li>20170222修正如果没有权限的时候，在grid上右键还是能看到相关菜单的BUG</li>
	<li>20170221修正刚刚添加的角色，当前用户看不到的BUG</li>
	<li>20170221修正给用户赋予角色时，可以赋予用户自己本角色之外的角色BUG</li>
	<li>20170220增加jetty插件(mvn jetty:run可以启动项目，可以用http://127.0.0.1:8080/ZXMES/index.jsp访问)</li>
	<li>20170218修复删除角色时会刷新左侧菜单树的BUG</li>
	<li>20170217左侧功能菜单点击的时候，弹出遮罩层</li>
	<li>20170217更新了弹出窗口的onOpen事件，增加遮罩效果</li>
	<li>20170217在grid页面删除item时，进行遮罩屏蔽，删除成功再解除屏蔽</li>
	<li>20170216更新了fastjson到1.2.29</li>
	<li>20170216更新了druid到1.0.29版本</li>
	<li>20170215修复了嵌套角色删除的BUG</li>
	<li>20170213升级EasyUI1.5.1</li>
</ul>