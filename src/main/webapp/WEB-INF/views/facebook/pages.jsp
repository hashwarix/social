<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
<!--
.post{
border-radius: 25px;
background-color: #e6e6e6;
padding: 10px;
font-family: sans-serif;
margin-bottom: 10px;
border-color: #7ba428;
border: 5px;
}

.inner{
border-radius: 10px;
background-color: #3399ff;
color:white;
padding: 2px;
font-family: sans-serif;
margin: 2px;
}
.inner1{
border-radius: 10px;
background-color: #004080;
padding: 2px;
color:white;
font-family: sans-serif;
margin: 4px;
}
-->
</style>


<h3>Your Facebook Pages</h3>

<c:if test="${not empty message}">
	<div class="${message.type.cssClass}">${message.text}</div>
</c:if>

<c:url value="/facebook/pages" var="postUrl" />
<form:form id="post" action="${postUrl}" method="post"	modelAttribute="postForm">
	<div class="formInfo">
		<s:bind path="*">
			<c:choose>
				<c:when test="${status.error}">
					<div class="error">Unable to sign up. Please fix the errors
						below and resubmit.</div>
				</c:when>
			</c:choose>
		</s:bind>
	</div>

	



	<table style="width: 100%; border: 1" >
		<tr>
			<td style="width: 70%">
				<div style="overflow-y: scroll;height: 300px">
				<table>
					<c:forEach items="${postForm.posts}" var="posts">
						<tr>
							<td>
								<div class="post">
									<div>
										<table>
											<tr >
												<td rowspan="2" valign="top">
													<img src="http://graph.facebook.com/Branddudes/picture" align="middle"/>
												</td>
											</tr>
										
											<tr>
												<td>
													<table>
															<tr>
																<td valign="top">
																	<b style="color: #3399ff;">Branddudes</b> <c:out value="${posts.statusType}"/> in <c:out value="${posts.name}"/>
																</td>
															</tr>
															<tr>
																<td valign="top">
																	Published By <b><c:out value="${posts.from}"/></b> at <c:out value="${posts.createdTime}"/>
																</td>
															</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>
									<div>
									<hr>
									</div>
									<div>
										<table>
											<tr>
												<td valign="bottom">
													<c:out value="${posts.message}"/>
												</td>
											</tr>
											<tr>
												<td valign="top">
													<img src="<c:out value="${posts.picture}"/>" align="middle"/>
												</td>
											</tr>
										</table>
									</div>
									<div>
									<hr>
									</div>
									<div>
										<table>
											<tr>
												<td valign="bottom">
													<div class="inner">
														<span class="inner1"><c:out value="${posts.likes}"/></span> Liked
													</div>
												</td>
												<td valign="bottom">
												<div class="inner">
													<span class="inner1"><c:out value="${posts.sharesCount}"/></span> Shared
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
							
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</td>
			<td style="width: 30%" valign="top">
				<fieldset>
					<table>
						<tr>
							<td colspan="3"><span id="PageImage"></span> <span
								id="PageName"></span></td>
						</tr>
						<tr style="display: none">
							<td><form:label path="pageId">Page Id </form:label></td>
							<td id="PageId"><form:input path="pageId" /></td>
							<td><form:errors path="pageId" cssClass="error" /></td>
						</tr>
						<tr style="display: none">
							<td><form:label path="name">Page Name </form:label></td>
							<td><form:input id="Name" path="name" /></td>
							<td><form:errors path="name" cssClass="error" /></td>
						</tr>
						<tr>
							<td><form:label path="message">Message </form:label></td>
							<td><form:textarea cols="30" rows="5" path="message" /></td>
							<td><form:errors path="message" cssClass="error" /></td>
						</tr>
						<tr style="display: none">
							<td></td>
							<td><input type="file" path="image" id="imagePath1" /></td>
							<td></td>
						</tr>
						<tr style="display: none">
							<td><form:label path="albumId">Album Name </form:label></td>
							<td><form:input type="text" path="albumId" /></td>
							<td><form:errors path="albumId" cssClass="error" /></td>
						</tr>
						<tr>
							<td><form:label path="image">Image </form:label></td>
							<td><form:input type="text" path="image" id="imagePath" /></td>
							<td><form:errors path="image" cssClass="error" /></td>
						</tr>
						<tr>
							<td><form:label path="link">Link</form:label></td>
							<td><form:input path="link" /></td>
							<td><form:errors path="link" cssClass="error" /></td>
						</tr>
						<tr>
							<td><form:label path="linkName">Link Name</form:label></td>
							<td><form:input path="linkName" /></td>
							<td><form:errors path="linkName" cssClass="error" /></td>
						</tr>
						<tr>
							<td><form:label path="linkCaption">Link Caption</form:label></td>
							<td><form:input path="linkCaption" /></td>
							<td><form:errors path="linkCaption" cssClass="error" /></td>
						</tr>
						<tr>
							<td><form:label path="linkDescription">Link Description</form:label></td>
							<td><form:input path="linkDescription" /></td>
							<td><form:errors path="linkDescription" cssClass="error" /></td>
						</tr>
						<tr style="display: none">
							<td><form:label path="id">Id </form:label></td>
							<td><form:password path="id" value="qwe" /></td>
							<td><form:errors path="id" cssClass="error" /></td>
						</tr>

						<tr>
							<td colspan="3" align="center">
								<p>
									<button type="submit">Post</button>
								</p> 
<!-- 								<input type="button" onclick="alertImage()"> -->
								<div id="disp_tmp_path"></div></td>
						</tr>

					</table>
				</fieldset>
			</td>
		</tr>
	</table>






</form:form>


<script>
	document.getElementById("PageImage").innerHTML = "<img src=\"http://graph.facebook.com/"
			+ document.getElementById("Name").value
			+ "/picture\" align=\"middle\"/>";
	document.getElementById("PageName").innerHTML = document
			.getElementById("Name").value;

	// function alertImage(){
	$('#imagePath1')
			.change(
					function(event) {
						var tmppath = URL
								.createObjectURL(event.target.files[0]);
						// 	    $("img").fadeIn("fast").attr('src',URL.createObjectURL(event.target.files[0]));

						$("#disp_tmp_path")
								.html(
										"Temporary Path(Copy it and try pasting it in browser address bar) --> <strong>["
												+ tmppath + "]</strong>");

						$("#imagePath").val(tmppath);

					});
	// }
</script>