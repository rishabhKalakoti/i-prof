<%
	url=request.querystring("url")
	
	session.abandon()
	
	response.redirect(url)
%>