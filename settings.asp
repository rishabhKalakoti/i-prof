<%
	if not session("logged_in")=true then
		response.redirect "index.asp"
	end if
%>

<!--#include file="connection.inc.asp"-->

<%
	set record=server.createobject("adodb.recordset")
	record.open "users", conn1, 2, 2
	
	flag=0
	do until record("id")=session("id") or record.eof
		record.movenext
	loop
%>

<%
	change_password=request.form("change_password")
	if change_password="on" then
		if len(request.form("current_password"))=0 or len(request.form("new_password"))=0 or len(request.form("confirm_password"))=0 then
			change_password_query="Please fill all the fields"
		elseif request.form("current_password")<>record("password") then
			change_password_query="Incorrect Password"
		elseif request.form("new_password")<>request.form("confirm_password") then
			change_password_query="Passwords do not match"
		else
			record("password")=request.form("new_password")
			record.update
			change_password_query="Password Changed"
		end if
	end if
	
	edit_info=request.form("edit_info")
	if edit_info="on" then
		if len(request.form("first_name"))=0 or len(request.form("last_name"))=0 or len(request.form("dob"))=0 then
			edit_info_query="Plese fill all the fields"
		elseif not isdate(request.form("dob")) then
			edit_info_query="Incorrect date"
		else
			record("first_name")=request.form("first_name")
			record("last_name")=request.form("last_name")
			record("dob")=request.form("dob")
			record.update
			edit_info_query="Information Updated"
		end if
	end if
%>

<html>
	<head>
	
		<title>i-Prof</title>
		
		<!--linking external css-->
		<style>
			@import url("layout.css");
		</style>
		
	</head>
	
	<body>
		
		<%
			if request.querystring("container")="show" then
				container_state="visible"
			else
				container_state="hidden"
			end if
		%>
		<style>
			#container{visibility:<%=container_state%>;}
			#big_box{visibility:<%=container_state%>;}
		</style>
		
		<div id="page">
		
		<div id="big_box">
			<%hide_url= "" & Request.ServerVariables("URL") & "?container=hidden"%>
			<a href="<%=hide_url%>"><img src="images/cross.png" name="cross_btn" id="cross_btn" /></a>
		</div><!--big_box-->
		
		<div id="container">
			<div id="login_box"><!-- #include file="login.inc.asp" --></div><!--login_box-->
			<div id="register_box"><!-- #include file="register.inc.asp" --></div><!--register_box-->
		</div><!--container-->
		
			<div id="header">
				<img src="images/logo.png" id="logo">
				
				<div id="account">
					<%if session("logged_in")=true then%>
					<a class="account_menu" href="<%="logout.asp?url=" & Request.ServerVariables("URL")%>">Logout</a>
					<a class="account_menu" id="account_menu_active">Settings</a>
					<%else%>
					<%show_url= "" & Request.ServerVariables("URL") & "?container=show"%>
					<a class="account_menu" href="<%=show_url%>">Login</a>
					<%end if%>
				
				</div><!--account-->
				
				<div id="navigation">
					<a class="nav nav_left" href="index.asp">Home</a>
					<a class="nav nav_left" href="courses.asp">Courses</a>
					<a class="nav nav_right" href="feedback.asp">Feedback</a>
					<a class="nav nav_right" href="contact.asp">Contact</a>
				</div><!--navigation-->
				
			</div><!--header-->
			
			
			<div id="blue_strip">
			</div><!--blue_strip-->
		
			
			<div id="big_wrapper">
			
				<div id="sidebar">
					<div id="sidebar-top">
						<h2 class="sidebar-top-heading">Account Settings</h1>
					</div><!--sidebar-top-->
					
					<div id="sidebar-main">
						<%response.write("Username: " + record("username") + "<br />" + "Name: " + record("first_name") + " " + record("last_name"))%>
					</div><!--sidebar-main-->
					
					<div id="sidebar-bottom"></div><!--sidebar-bottom-->
				</div><!--sidebar-->
				
				<div id="main_content">
					<h1 class="heading2">Change Password</h1>
						<br />
						<form name="change_password" action="settings.asp" method="post">
							<input type="hidden" value="on" name="change_password">
							<%response.write("<p style='color:#2f74a3'>" + change_password_query + "</p>")%>
							<table>
								<tr>
								<td>Current Password:</td>
								<td><input type="password" name="current_password" class="textbox"></td>
								<tr>
								<td>New Password:</td>
								<td><input type="password" name="new_password" class="textbox"></td>
								<tr>
								<td>Confirm Password:</td>
								<td><input type="password" name="confirm_password" class="textbox"></td>
								<tr>
								<td colspan=2 align="center"><input type="submit" value="Save Changes" class="simple_button"></td>
							</table>
						</form>
						<br />
					<h1 class="heading2">Edit Information</h1>
						<br />
						<form name="edit_info" action="settings.asp" method="post">
							<input type="hidden" value="on" name="edit_info">
							<%response.write("<p style='color:#2f74a3'>" + edit_info_query + "</p>")%>
							<table>
								<tr>
								<td>First Name:</td>
								<td><input type="text" name="first_name" value='<%=record("first_name")%>' class="textbox"></td>
								<tr>
								<td>Last Name:</td>
								<td><input type="text" name="last_name" value='<%=record("last_name")%>' class="textbox"></td>
								<tr>
								<td>Date of Birth:</td>
								<td><input type="text" name="dob" value='<%=record("dob")%>' class="textbox"></td>
								<tr>
								<td colspan=2 align="center"><input type="submit" value="Save Changes" class="simple_button"></td>
							</table>
						</form>
						<br />
				</div><!--main_content-->
			
			</div><!--big_wrapper-->
			
		</div><!--page-->
		
	</body>
</html>