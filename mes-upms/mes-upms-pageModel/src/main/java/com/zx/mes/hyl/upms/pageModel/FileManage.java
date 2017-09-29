package com.zx.mes.hyl.upms.pageModel;



public class FileManage {
	
	private String id;
	private String filename;
    private int filesize;
    private String filetype;
    private boolean has_file;
    private boolean is_dir;
    private boolean is_photo;
    private String datetime;
    
    private String currentPath;

	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public boolean isHas_file() {
		return has_file;
	}
	public void setHas_file(boolean has_file) {
		this.has_file = has_file;
	}
	public boolean isIs_dir() {
		return is_dir;
	}
	public void setIs_dir(boolean is_dir) {
		this.is_dir = is_dir;
	}
	public boolean isIs_photo() {
		return is_photo;
	}
	public void setIs_photo(boolean is_photo) {
		this.is_photo = is_photo;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getCurrentPath() {
		return currentPath;
	}
	public void setCurrentPath(String currentPath) {
		this.currentPath = currentPath;
	}

}


