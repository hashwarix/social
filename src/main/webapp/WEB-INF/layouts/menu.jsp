<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/spring-social/social/tags" prefix="social" %>


<h4>
<div style="width: 100%;background-color: #006600;">
<a href="<c:url value="/connect"/>">Connections</a>
</div>
</h4>

<h4>
<div style="width: 100%;background-color: #006600;">
<a href="<c:url value="/facebook"/>">Facebook</a>
<social:connected provider="facebook">
<ul class="menu">
	<li><a href="<c:url value="/facebook"/>">User Profile</a></li>
	<li><a href="<c:url value="/facebook/feed"/>">Feed</a></li>
	<li><a href="<c:url value="/facebook/friends"/>">Friends</a></li>
	<li><a href="<c:url value="/facebook/albums"/>">Albums</a></li>
	<li><a href="<c:url value="/facebook/pages"/>">Pages</a></li>
</ul>
</social:connected>
</div>
</h4>

<h4>
<div style="width: 100%;background-color: #006600;">
<a href="<c:url value="/twitter"/>">Twitter</a>
</div>
</h4>

<h4>
<div style="width: 100%;background-color: #006600;">
<a href="<c:url value="/linkedin"/>">LinkedIn</a>
</div>
</h4>

<h4>
<div style="width: 100%;background-color: #006600;">
<a href="<c:url value="/youtube"/>">LinkedIn</a>
</div>
</h4>


