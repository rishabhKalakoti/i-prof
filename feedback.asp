<!--#include file="connection.inc.asp"-->

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
					<a class="account_menu" href="settings.asp">Settings</a>
					<%else%>
					<%show_url= "" & Request.ServerVariables("URL") & "?container=show"%>
					<a class="account_menu" href="<%=show_url%>">Login</a>
					<%end if%>
				
				</div><!--account-->
				
				<div id="navigation">
					<a class="nav nav_left" href="index.asp">Home</a>
					<a class="nav nav_left" href="courses.asp">Courses</a>
					<a class="nav nav_right" href="feedback.asp" id="nav_active">Feedback</a>
					<a class="nav nav_right" href="contact.asp">Contact</a>
				</div><!--navigation-->
				
			</div><!--header-->
			
			
			<div id="blue_strip">
			</div><!--blue_strip-->
		
			
			<div id="big_wrapper">
			
				<div id="sidebar">
					<div id="sidebar-top">
						<h2 class="sidebar-top-heading">Recent Feedbacks</h1>
					</div><!--sidebar-top-->
					
					<div id="sidebar-main">
						<%
							set record=server.createobject("adodb.recordset")
							record.open "feedback", conn2, 2
							
							record.movelast
							num=0
							while num<5 and not record.bof 
								response.write("<p style='font-size:15px;'>" + record("_feedback") + "<br />" + "<font size='-1' color='#2f74a3' style='margin-left:15px;'>" + "-" + record("_name") + "</font>" + "</p>")
								record.moveprevious
								num=num+1
							wend
						%>
					</div><!--sidebar-main-->
					
					<div id="sidebar-bottom"></div><!--sidebar-bottom-->
				</div><!--sidebar-->
				
				<%
					set record1=server.createobject("adodb.recordset")
					record1.open "users", conn1, 2, 2
					while not record1.eof
						'checking the username and password
						if record1("id") = session("id") then
							first_name=record1("first_name")
							last_name=record1("last_name")
						end if
						record1.movenext
					wend
					record1.close
				%>
				
				<div id="main_content">					
					<%if session("logged_in")=true then%>
					<br />
					<h1 class="heading2">Feedback Form</h1>
					<br />
					<%="<p style='color:#2f74a3'>" + request.querystring("q") + "</p>"%>
					<form name="feedback_form" method="post" action="submit_feedback.asp">
						Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" class="textbox" onfocus="blur()" value="<%response.write(first_name + " " + last_name)%>">
						<br /><br />
						<textarea rows=5 cols=50 class="textbox" style="width:255px;" name="feedback" onfocus="document.feedback_form.feedback.value=''">write the feedback here...</textarea>
						<br /><br />
						<input type="submit" value="Submit Feedback" class="simple_button">
					</form>
					<%else%>
					<div class="heading4">You need to log in to submit your feedback</div>
					<%end if%>
				</div><!--main_content-->
			
			</div><!--big_wrapper-->
			
		</div><!--page-->
		
	</body>
</html>