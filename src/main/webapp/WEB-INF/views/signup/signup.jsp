<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h3>Sign Up</h3>

<c:if test="${not empty message}">
<div class="${message.type.cssClass}">${message.text}</div>
</c:if>

<c:url value="/signup" var="signupUrl" />
<form:form id="signup" action="${signupUrl}" method="post" modelAttribute="signupForm">
	<div class="formInfo">
		<s:bind path="*">
			<c:choose>
				<c:when test="${status.error}">
					<div class="error">Unable to sign up. Please fix the errors below and resubmit.</div>
				</c:when>
			</c:choose>                     
		</s:bind>
	</div>
	
	<fieldset>
		<table>
			<tr>
				<td><form:label path="firstName">First Name </form:label></td>
				<td><form:input path="firstName" /></td>	
				<td><form:errors path="firstName" cssClass="error" /></td>		
			</tr>
			<tr>
				<td><form:label path="lastName">Last Name </form:label></td>
				<td><form:input path="lastName" /></td>	
				<td><form:errors path="lastName" cssClass="error" /></td>		
			</tr>
			<tr>
				<td><form:label path="username">Username </form:label></td>
				<td><form:input path="username" /></td>	
				<td><form:errors path="username" cssClass="error" /></td>			
			</tr>
			<tr>
				<td><form:label path="password">Password (at least 6 characters) </form:label></td>
				<td><form:password path="password" /></td>	
				<td><form:errors path="password" cssClass="error" /></td>		
			</tr>
			
			<tr>
				<td colspan="3" align="center"><p><button type="submit">Sign Up</button></p></td>
			</tr>
			
		</table>
	
	
	
		
		
		
		
		
		
		
		
	</fieldset>
	
</form:form>
