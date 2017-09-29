package com.zx.mes.hyl.upms.controller;


import com.zx.mes.hyl.controller.BaseController;
import com.zx.mes.hyl.pageModel.DataGrid;
import com.zx.mes.hyl.pageModel.PageHelper;
import com.zx.mes.hyl.upms.comparator.NameComparator;
import com.zx.mes.hyl.upms.comparator.SizeComparator;
import com.zx.mes.hyl.upms.comparator.TypeComparator;
import com.zx.mes.hyl.util.ConfigUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * 文件控制器
 * 
 * @author 
 * 
 */
@Controller
@RequestMapping("/fileController")
public class FileController extends BaseController {
	
	@RequestMapping("/view")
	public String view() {
		return "/fileUpload/fileManage";
	}
	
	@RequestMapping("/view2")
	public String view2() {
		return "/fileUpload/fileUploadView";
	}
	
	/**
	 * 浏览器服务器附件
	 * 
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/fileManage")
	@ResponseBody
	public DataGrid fileManage(HttpServletResponse response, HttpServletRequest request, HttpSession session, PageHelper pageHelper) {
		Map<String, Object> m = new HashMap<String, Object>();
		String rootPath="";
		String rootUrl="";
		String path="";
		String currentPath="";
		String currentUrl="";
		String currentDirPath="";
		String moveupDirPath="";
		DataGrid datagrid=new DataGrid();
		String pathUrl=request.getParameter("pathUrl");
		if (pathUrl==null || "".equals(pathUrl)) {
			// 根目录路径，可以指定绝对路径，比如 /var/www/attached/
			rootPath = session.getServletContext().getRealPath("/") + "attached/";

			// 根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
			rootUrl = request.getContextPath() + "/attached/";
			// 根据path参数，设置各路径和URL
			path = request.getParameter("path") != null ? request.getParameter("path") : "";
			currentPath = rootPath + path;
			currentUrl = rootUrl + path;
			currentDirPath = path;
		}else {
			currentPath=pathUrl;
		} 
		// 图片扩展名
		String[] fileTypes = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };

		
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}

		// 排序形式，name or size or type
		String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

		// 最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			// out.println("Parameter is not valid.");
			// return;
			try {
				response.getWriter().write("参数无效！");
			} catch (IOException e) {
				e.printStackTrace();
			}
			//return m;
		}
		// 目录不存在或不是目录
		File currentPathFile=null;
		try {
			currentPathFile = new File(currentPath.substring(0, currentPath.length()-1));
			if (!currentPathFile.isDirectory()) {
				// out.println("Directory does not exist.");
				// return;
				return datagrid;
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		// 遍历目录取的文件信息
		List<Hashtable<String, Object>> fileList = new ArrayList<Hashtable<String, Object>>();
		if (currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if (file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "目录");
				} else if (file.isFile()) {
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String> asList(fileTypes).contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified());
				hash.put("datetime", datetime);
				hash.put("id", fileName+datetime);
				//hash.put("currentPath", currentPath+"/"+fileName+"/");
				hash.put("currentPath", currentPath);
				hash.put("currentUrl", currentUrl);
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		m.put("moveup_dir_path", moveupDirPath);
		m.put("current_dir_path", currentDirPath);
		m.put("current_url", currentUrl);
		m.put("total_count", fileList.size());
		m.put("file_list", fileList);
		if (fileList.size()>pageHelper.getRows() &&  fileList.size()>pageHelper.getPage()*pageHelper.getRows()) {
			datagrid.setRows(fileList.subList((pageHelper.getPage()-1)*pageHelper.getRows(),pageHelper.getPage()*pageHelper.getRows()));		
		}else if (fileList.size()>pageHelper.getRows() &&  fileList.size()<pageHelper.getPage()*pageHelper.getRows()) {
			datagrid.setRows(fileList.subList((pageHelper.getPage()-1)*pageHelper.getRows(),fileList.size()));
		}else {
			datagrid.setRows(fileList);
		}
		datagrid.setTotal((long)fileList.size());
		return datagrid;
	}


	
	
	

@RequestMapping("/upload")
@ResponseBody
public Map<String, Object> upload(HttpServletResponse response, HttpServletRequest request, HttpSession session) {
	Map<String, Object> m = new HashMap<String, Object>();
	// 文件保存目录路径
	String savePath = session.getServletContext().getRealPath("/") + "attached/";

	// 文件保存目录URL
	String saveUrl = request.getContextPath() + "/attached/";

	// 定义允许上传的文件扩展名
	HashMap<String, String> extMap = new HashMap<String, String>();
	extMap.put("image", ConfigUtil.get("image"));
	extMap.put("flash", ConfigUtil.get("flash"));
	extMap.put("media", ConfigUtil.get("media"));
	extMap.put("file", ConfigUtil.get("file"));

	long maxSize = Long.parseLong(ConfigUtil.get("maxFileSize")); // 允许上传最大文件大小(字节)

	if (!ServletFileUpload.isMultipartContent(request)) {
		m.put("error", 1);
		m.put("message", "请选择文件！");
		return m;
	}

	// 检查目录
	File uploadDir = new File(savePath);
	if (!uploadDir.isDirectory()) {
		uploadDir.mkdirs();
	}

	// 检查目录写权限
	if (!uploadDir.canWrite()) {
		m.put("error", 1);
		m.put("message", "上传目录没有写权限！");
		return m;
	}

	//String dirName = request.getParameter("dir");
	if (ServletFileUpload.isMultipartContent(request)) {// 判断表单是否存在enctype="multipart/form-data"
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				String fileName = item.getName();
				if (!item.isFormField()) {
					// 检查文件大小
					if (item.getSize() > maxSize) {
						m.put("error1", 1);
						m.put("message1", "文件:"+ fileName + "上传文件大小超过限制！(允许最大[" + maxSize + "]字节，您上传了[" + item.getSize() + "]字节)");
						//return m;
					}
					// 检查扩展名
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					
					String dirName="";
					for (String  key : extMap.keySet()) {
						if (Arrays.<String> asList(extMap.get(key).split(",")).contains(fileExt)) {
							dirName=key;
							break;
						}
					}
					
					
					
					if ("".equals(dirName)) {
						m.put("error2", 1);
						m.put("message2", "文件:"+ fileName + " 上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式！");
						//return m;
					}
					savePath=whichDirName(dirName, savePath, saveUrl, extMap, m);
					//对上传的目录进行判断
					if (savePath.equals("")) {
						continue;//如果目录不正，直接执行下一个
					}else {
						//System.out.println("目录正确");
					}
					
					//String newFileName = UUID.randomUUID().toString() + "." + fileExt;
					
					//判断在此目录下是否已经上传
					if (new File(savePath,fileName).exists()) {
						m.put(savePath, "文件在当前目录下已存在!");
						continue;
					}
					
					try {
						File uploadedFile = new File(savePath, fileName);
						item.write(uploadedFile);
					} catch (Exception e) {
						m.put("error3", 1);
						m.put("message3", "文件:"+ fileName + "上传文件失败！");
						//return m;
					}

					//m.put("OK", 0);
					//m.put("url", savePath + fileName);
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

	return m;
}

public String whichDirName(String dirName,String savePath,String saveUrl,Map<String, String> extMap,Map<String, Object> m){
	
	if (!extMap.containsKey(dirName)) {
		m.put("error6", 1);
		m.put("message6", "目录名不正确！");
		return "";
	}

	// 创建文件夹
	savePath += dirName + "/";
	saveUrl += dirName + "/";
	File saveDirFile = new File(savePath);
	if (!saveDirFile.exists()) {
		saveDirFile.mkdirs();
	}
	SimpleDateFormat yearDf = new SimpleDateFormat("yyyy");
	SimpleDateFormat monthDf = new SimpleDateFormat("MM");
	SimpleDateFormat dateDf = new SimpleDateFormat("dd");
	Date date = new Date();
	String ymd = yearDf.format(date) + "/" + monthDf.format(date) + "/" + dateDf.format(date) + "/";
	savePath += ymd;
	saveUrl += ymd;
	File dirFile = new File(savePath);
	if (!dirFile.exists()) {
		dirFile.mkdirs();
	}

	return savePath;
}
	
@RequestMapping("/downLoad")
@ResponseBody
public void downLoad(HttpServletResponse response, HttpServletRequest request, HttpSession session) {
	//访问路径
	String  pathUrl = request.getParameter("pathUrl"); 
	try {
		pathUrl=java.net.URLDecoder.decode(pathUrl, "utf-8");
	} catch (UnsupportedEncodingException e2) {
		e2.printStackTrace();
	}
	//设置文件mime类型
	File file=new File(pathUrl);
	String fileName=file.getName();
	response.setContentType(session.getServletContext().getMimeType(fileName));
	
	//提示保存
	try {
		response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fileName,"UTF-8"));
	} catch (UnsupportedEncodingException e1) {
		e1.printStackTrace();
	} 
//	//设置编码格式
//	response.setCharacterEncoding("utf-8");
	//读取文件
	InputStream in=null;
	OutputStream out=null;
	try {
		in=new FileInputStream(pathUrl);
		try {
			out=response.getOutputStream();
			int len=0;
			byte[] buffer=new byte[1024];
			while ((len=in.read(buffer))!=-1) {
				out.write(buffer, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	} catch (FileNotFoundException e) {
		e.printStackTrace();
	}finally{
		//关闭流
		try {
			in.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//至此成功
}
	
}
