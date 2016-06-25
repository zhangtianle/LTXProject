package ltx.model;

public class Image {
	private String imgId;
	private String imgUrl;
	private String articleId;
	
	
	public Image() {
	}


	public String getImgId() {
		return imgId;
	}

	public void setImgId(String imgId) {
		this.imgId = imgId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public Image(String imgUrl, String articleId) {
		this.imgUrl = imgUrl;
		this.articleId = articleId;
	}

}
