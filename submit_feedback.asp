<!--#include file="connection.inc.asp"-->

<%
	name=request.form("name")
	feedback=request.form("feedback")
	
	if len(name)=0 or len(feedback)=0  then
		response.redirect "feedback.asp?q=Please+fill+all+the+fields"
	else
		set record=server.createobject("adodb.recordset")
		record.open "feedback", conn2, 2, 2
		record.addnew
		record("_name")=name
		record("_feedback")=feedback
		record.update
		response.redirect "feedback.asp?q=Thank+you+for+your+feedback"
	end if
%>