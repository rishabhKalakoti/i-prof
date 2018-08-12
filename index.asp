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
					<a class="nav nav_left" href="index.asp" id="nav_active">Home</a>
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
						<h2 class="sidebar-top-heading">What's New</h1>
					</div><!--sidebar-top-->
					
					<div id="sidebar-main">
						<marquee direction="up" style="" onmouseover="stop()" onmouseout="start()" style="border:1px solid #2f74a3; margin:5px; height:100px; width:90%;" scrollamount=3>
						<a class="list2" href="feedback.asp">Now also see the most recent feedbacks.</a><br />
						<a class="list2" href="photoelectric_effect.asp">Make study easier with the help of animation.</a>
						</marquee>
					</div><!--sidebar-main-->
					
					<div id="sidebar-bottom"></div><!--sidebar-bottom-->
				</div><!--sidebar-->
				
				<div id="main_content">
					<h1 class="heading2">What is i-prof?</h1>
					<p>I-prof is an online tutor that gives students all what a good teacher can. It is designed to make studies easier with more reliable and easy to understand information. It covers the topics in which the students haave difficulties and contains a wide variety of animation, images and data analysis</p>
					<h1 class="heading2">Why i-prof?</h1>
					<p>It is better than most other websites on the internet as many of them focus on formulae and mugging up the contents whereas i-Prof is designed to clear the concepts that prove to be difficult for the students otherwise. And based on these concepts, the students learn to apply them and let their imagination go wild.</p>
					<h1 class="heading2">Coming soon...</h1>
					<h3 class="heading3">New search Feature</h2>
					<p>It would now be easy for students to find their favorite topics on the site and would save their precious time that may be wasted on scrounging for precious matter otherwise.</p>
					<h3 class="heading3">More topics</h2>
					<p>The website is still in beta-mode and as soon as we get enough visitors, we will add more content.</p>
				</div><!--main_content-->
			
			</div><!--big_wrapper-->
			
		</div><!--page-->
		
	</body>
</html>