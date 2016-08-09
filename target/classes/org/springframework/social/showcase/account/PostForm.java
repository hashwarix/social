package org.springframework.social.showcase.account;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

public class PostForm {
	@NotEmpty
	private String id;

	@NotEmpty
	private String message;
	
	@NotEmpty
	private String name;
	
	private String image;
	
	private String albumId;
	
	private String link;
	private String linkName;
	private String linkCaption;
	private String linkDescription;
	
	private List<Post> posts;
	
	
	




	public List<Post> getPosts() {
		return posts;
	}




	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}




	public String getAlbumId() {
		return albumId;
	}




	public void setAlbumId(String albumId) {
		this.albumId = albumId;
	}




	public String getLinkName() {
		return linkName;
	}




	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}




	public String getLinkCaption() {
		return linkCaption;
	}




	public void setLinkCaption(String linkCaption) {
		this.linkCaption = linkCaption;
	}




	public String getLinkDescription() {
		return linkDescription;
	}




	public void setLinkDescription(String linkDescription) {
		this.linkDescription = linkDescription;
	}



	@NotEmpty
	private String pageId;
	
	public String getId() {
		return id;
	}

	


	public String getLink() {
		return link;
	}




	public void setLink(String link) {
		this.link = link;
	}




	public String getImage() {
		return image;
	}




	public void setImage(String image) {
		this.image = image;
	}




	public void setId(String id) {
		this.id = id;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPageId() {
		return pageId;
	}



	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	
	
}
