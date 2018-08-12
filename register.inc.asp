<!-- #include file="connection.inc.asp"-->

<%
	'full line code for url
	'current_page_full_url=request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
	
	'required url code
	current_page_url=Request.ServerVariables("URL")
	current_page_full_url=Request.ServerVariables("URL") & "?" & Request.Querystring
%>

<%
	'form input
	register_state=request.form("register_state")
	username=request.form("username")
	password=request.form("password")
	confirm_password=request.form("confirm_password")
	first_name=request.form("first_name")
	last_name=request.form("last_name")
	dob=request.form("dob")
	
	if register_state="on" then
			if len(username)=0 or len(password)=0 or len(confirm_password)=0 or len(first_name)=0 or len(last_name)=0 then
				register_error = "Please fill all the fields"
			elseif password<>confirm_password then
				register_error = "Passwords do not match"
			elseif isdate(dob)=false then
				register_error= "Enter a valid date of birth"
			else
				'initializes the recordset
				set record=server.createobject("adodb.recordset")
				record.open "users", conn1, 2, 2
				
				already_exists=false
				while not record.eof
					if record("username")=username then
						already_exists=true
						register_error="Username already exisits"
					end if
					record.movenext
				wend
				if already_exists=false then
					if already_exists=false then
					record.addnew
					record("username")=username
					record("password")=password
					record("first_name")=first_name
					record("last_name")=last_name
					record("dob")=dob
					record.update
					session("id")=record("id")
					session("username")=record("username")
					session("logged_in")=true
					response.redirect current_page_url
				end if
				end if
			end if
	end if
%>

<html>
	<body>
		<h1 class="heading1">Register</h1>
		<form name="register_form" method="post" action="<%=current_page_full_url%>">
			
			<%
				if not register_error="" then
					response.write(register_error & "<br />")
				end if
			%>
			
			<input type="hidden" name="register_state" value="on" />
			<table>
			<tr>
			<td>Username:</td>
			<td><input type="text" name="username" value="<%=username%>"/></td>
			<tr>
			<td>Password:</td>
			<td><input type="password" name="password" /></td>
			<tr>
			<td>Confirm Password:</td>
			<td><input type="password" name="confirm_password" /></td>
			<tr>
			<td>First Name:</td>
			<td><input type="text" name="first_name" value="<%=first_name%>"/></td>
			<tr>
			<td>Last Name:</td>
			<td><input type="text" name="last_name"  value="<%=last_name%>"/></td>
			<tr>
			<td>Date of Birth:</td>
			<td><input type="text" name="dob"  value="<%=dob%>"/></td>
			<tr>
			<td /><td>dd/mm/yyyy<td>
			<tr>
			<td colspan=2 align="center"><input type="submit" value="Register" class="simple_button"/></td>
			</table>
		</form>
	</body>
</html>