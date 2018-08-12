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
			<%hide_url= "" &Request.ServerVariables("URL") & "?container=hidden"%>
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
					<a class="nav nav_left" href="courses.asp" id="nav_active">Courses</a>
					<a class="nav nav_right" href="feedback.asp">Feedback</a>
					<a class="nav nav_right" href="contact.asp">Contact</a>
				</div><!--navigation-->
				
			</div><!--header-->
			
			
			<div id="blue_strip">
			</div><!--blue_strip-->
		
			
			<div id="big_wrapper">
			
				<div id="sidebar">
					<div id="sidebar-top">
						<h2 class="sidebar-top-heading">Courses</h1>
					</div><!--sidebar-top-->
					
					<div id="sidebar-main">
						<a href="photoelectric_effect.asp" class="list1">Photoelectric Effect</a>
					</div><!--sidebar-main-->
					
					<div id="sidebar-bottom"></div><!--sidebar-bottom-->
				</div><!--sidebar-->
				
				<div id="main_content">
					<div class="heading4">The website is still under construction.<br /><br />More content coming soon...</div>
				</div><!--main_content-->
			
			</div><!--big_wrapper-->
			
		</div><!--page-->
		
	</body>
</html>