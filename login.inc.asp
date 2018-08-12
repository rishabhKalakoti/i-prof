<!-- #include file="connection.inc.asp"-->

<%
	'full line code for url
	'current_page_full_url=request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
	
	'required url code
	current_page_url=Request.ServerVariables("URL")
	current_page_full_url=Request.ServerVariables("URL") & "?" & Request.Querystring
%>

<%
	'taking the values from the form
	login_state = request.form("login_state")
	username = request.form("username")
	password = request.form("password")
	
	'checks whether the user has submitted the form or not
	if login_state="on" then		
		if len(username)=0 or len(password)=0 then
			login_error="Please fill all the fields"
		else
			'initializes the recordset
			set record=server.createobject("adodb.recordset")
			record.open "users", conn1
			login_flag=0
			'browsing through all records one by one
			while not record.eof
				'checking the username and password
				if record("username") = username and record("password") = password then
					session("id")=record("id")
					session("username")=record("username")
					session("logged_in")=true
					login_flag=1
				end if
				record.movenext
			wend
			 
			'action after username/password check
			if login_flag=0 then
				login_error="Incorrect username/ password combination"
			else
				response.redirect current_page_url
			end if
		end if
		
	end if
%>

<html>
	<body>
		<h1 class="heading1">Login</h1>
		<form name="login_form" method="post" action="<%=current_page_full_url%>">
			
			<%
				'displaying the error, if any
				if not login_error="" then
					response.write(login_error & "<br />")
				end if
			%>
			
			<input type="hidden" name="login_state" value="on">
			<table>
			<tr>
			<td>Username:</td>
			<td><input type="text" name="username" value="<%=username%>" /></td>
			<tr>
			<td>Password:</td>
			<td><input type="password" name="password" /></td>
			<tr>
			<tr>
			<td colspan=2 align="center"><input type="submit" value="Login" class="simple_button"></td>
			</table>
		</form>
	</body>
</html>