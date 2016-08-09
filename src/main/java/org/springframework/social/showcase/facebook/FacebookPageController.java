/*
 * Copyright 2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.social.showcase.facebook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.core.io.PathResource;
import org.springframework.social.facebook.api.Account;
import org.springframework.social.facebook.api.Album;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.ImageType;
import org.springframework.social.facebook.api.Page;
import org.springframework.social.facebook.api.PageOperations;
import org.springframework.social.facebook.api.PagePostData;
import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;
import org.springframework.social.facebook.api.Reference;
import org.springframework.social.showcase.account.PostForm;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

@Controller
public class FacebookPageController {
	private Logger logger = Logger.getLogger(FacebookPageController.class);
	private final Facebook facebook;

	@Inject
	public FacebookPageController(Facebook facebook) {
		this.facebook = facebook;
	} 

//	@RequestMapping(value="/facebook/pages", method=RequestMethod.GET)
//	public String home(Model model) {
//		List<org.springframework.social.showcase.account.Page> pages= new ArrayList<org.springframework.social.showcase.account.Page>();
//		PageOperations pagesObj = facebook.pageOperations();
//		model.addAttribute("pages", pagesObj.getAccounts());
//		
//		for (Account account : pagesObj.getAccounts()) {
//			Page facebookPage = pagesObj.getPage(account.getId());
//			org.springframework.social.showcase.account.Page page = new org.springframework.social.showcase.account.Page();
//			page.setImage(facebookPage.getMpg());
//			page.setAccessToken(facebookPage.getAccessToken());
//			page.setName(facebookPage.getName());
//			page.setId(facebookPage.getId());
//			pages.add(page);
//			PagePostData post = new PagePostData(page.getId());
//			post.message("Soon, We will be on all Android Device!!!");
//			facebook.pageOperations().post(post);
//		}
//
//		System.out.println("Page in UI Details :" +new Gson().toJson(pages));
//		model.addAttribute("page", pages);
//		
//		return "facebook/pages";
//	}
	
//	@RequestMapping(value="/facebook/pagePost", method=RequestMethod.POST)
//	@ResponseBody
//	public String pagePost(@RequestBody String param) {
//		Post post = new Gson().fromJson(param,Post.class);
//		
//		PagePostData postData = new PagePostData(post.getId());
//		postData.message(post.getMessage());
//		facebook.pageOperations().post(postData);
//		
//		return "Successfully Posted!!!";
//	}
	
	@RequestMapping(value="/facebook/pages", method=RequestMethod.GET)
	public PostForm signupForm(WebRequest request) {
		PostForm postForm = new PostForm();
		
		List<org.springframework.social.showcase.account.Page> pages= new ArrayList<org.springframework.social.showcase.account.Page>();
		PageOperations pagesObj = facebook.pageOperations();
//		model.addAttribute("pages", pagesObj.getAccounts());
		
		for (Account account : pagesObj.getAccounts()) {
			Page facebookPage = pagesObj.getPage(account.getId());
			
			
			
			org.springframework.social.showcase.account.Page page = new org.springframework.social.showcase.account.Page();
			page.setImage(facebookPage.getMpg());
			page.setAccessToken(facebookPage.getAccessToken());
			page.setName(facebookPage.getName());
			page.setId(facebookPage.getId());
			pages.add(page);
			
			PagedList<Album> albums = facebook.mediaOperations().getAlbums(facebookPage.getId());
			for (Album album : albums) {
				System.out.println(album.getId() +":" + album.getName());
//				if( "Timeline Photos"){
					System.out.println(album.getId() +":-:" + album.getName());
					postForm.setAlbumId("855908411153715");
//				}
//					else{
//					String albumid = facebook.mediaOperations().createAlbum(facebookPage.getId(), "SocialHub", "Social Hub managed photo album");
//					postForm.setAlbumId(albumid);
//				}
			}
			
			postForm.setPageId(facebookPage.getId());
			postForm.setName(facebookPage.getName());
//			postForm.setPosts(null);
			PagedList<Post> posts = facebook.feedOperations().getFeed(facebookPage.getId());
			
			List<org.springframework.social.showcase.account.Post> disPosts = preparePostList(posts);
			System.out.println("POST : " + new Gson().toJson(disPosts));
			postForm.setPosts(disPosts);
//			PagePostData post = new PagePostData(page.getId());
//			post.message("Soon, We will be on all Android Device!!!");
//			facebook.pageOperations().post(post);
		}

//		System.out.println("Page in UI Details :" +new Gson().toJson(pages));
//		model.addAttribute("page", pages);
		System.out.println("postForm" + new Gson().toJson(postForm));
		
		return postForm;
	}
	
	@RequestMapping(value="/facebook/pages", method=RequestMethod.POST)
	public String signup(@Valid PostForm form, BindingResult formBinding, WebRequest request) throws IOException {
		if (formBinding.hasErrors()) {
			return null;
		}
		logger.info("posting to facebook");
		PagePostData post = new PagePostData(form.getPageId());
		
		if(!StringUtils.isEmpty(form.getLink()) && !StringUtils.isEmpty(form.getLinkCaption())){
			post.link(form.getLink(), form.getImage(), form.getLinkName(), form.getLinkCaption(), form.getLinkDescription());
		}
		
		post.message(form.getMessage());
		
		if(!StringUtils.isEmpty(form.getImage())){
			PathResource imageFile = new PathResource(form.getImage());
			System.out.println("Image Path : "+form.getImage());
			System.out.println("Image Description from PathResource : "+imageFile.getDescription());
			System.out.println("Image File Name : "+imageFile.getFilename());
			System.out.println("Image Path : "+imageFile.getPath());
			System.out.println("Image URL : "+imageFile.getURL());
			
			
//			String albumid = facebook.mediaOperations().createAlbum(form.getPageId(), "SocialHub", "Social Hub managed photo album");
			
			
			facebook.pageOperations().postPhoto(form.getPageId(), form.getAlbumId(), imageFile, form.getLinkCaption());
		}else{
			facebook.pageOperations().post(post);
		}
		
		
//		form.setPosts(null);
		PagedList<Post> posts = facebook.feedOperations().getFeed(form.getPageId());
		
		List<org.springframework.social.showcase.account.Post> disPosts = preparePostList(posts);
		form.setPosts(disPosts);
		
		System.out.println("Posts : "+new Gson().toJson(posts));
		
		return "redirect:/facebook/pages";
	}
	
	
	private List<org.springframework.social.showcase.account.Post> preparePostList(PagedList<Post> posts){
		List<org.springframework.social.showcase.account.Post> disPosts = new ArrayList<org.springframework.social.showcase.account.Post>();
		for (Post post : posts) {
			org.springframework.social.showcase.account.Post disPost = new org.springframework.social.showcase.account.Post();
			disPost.setCreatedTime(post.getCreatedTime().toString());
			disPost.setFrom(post.getFrom().getName());
			disPost.setId(post.getId());
			
			if(post.getObjectId()!=null){
				PagedList<Reference> likes = facebook.likeOperations().getLikes(post.getObjectId());
				if(likes!=null && likes.size()>0){
					disPost.setLikes(String.valueOf(likes.size()));
				}
				
//				facebook.mediaOperations().getPhotoImage(post.getObjectId(), ImageType.NORMAL);
			}
			
			
			disPost.setPicture(post.getPicture());
			disPost.setMessage(post.getMessage());
			disPost.setName(post.getName());
			disPost.setPostLink(post.getLink());
			disPost.setObjectId(post.getObjectId());
			disPost.setSharesCount(String.valueOf(post.getShares()));
			
			if(post.getStatusType()!=null){
				disPost.setStatusType(post.getStatusType().name());
			}
			if(post.getType()!=null){
				disPost.setType(post.getType().name());
			}
			if(post.getUpdatedTime()!=null){
				disPost.setUpdatedTime(post.getUpdatedTime().toString());
			}
			disPosts.add(disPost);
		}
		
		return disPosts;
	}

}
