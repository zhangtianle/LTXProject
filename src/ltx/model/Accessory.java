package ltx.model;

import java.sql.Date;

public class Accessory {
	private String id;
	private String accName;
	private String articleId;
	private String fileName;
	private Date upLoadTime;
	
	
	
	public Date getUpLoadTime() {
		return upLoadTime;
	}
	public void setUpLoadTime(Date upLoadTime) {
		this.upLoadTime = upLoadTime;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public Accessory() {
	}
	public Accessory(String accName, String fileName) {
		this.accName = accName;
		this.fileName = fileName;
		
	}
	public Accessory(String articleId,String accName ,String fileName) {
		this.accName = accName;
		this.articleId = articleId;
		this.fileName = fileName;
	}
	
	
}
