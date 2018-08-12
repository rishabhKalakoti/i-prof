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
						<a href="photoelectric_effect.asp" class="list1" id="list1_active">Photoelectric Effect</a>
					</div><!--sidebar-main-->
					
					<div id="sidebar-bottom"></div><!--sidebar-bottom-->
				</div><!--sidebar-->
				
				<div id="main_content">
					<h1 class="heading2">Photoelectric Effect</h1>
					<p>It was discovered by Hertz in 1887. He found that when the negative plate of an electric discharge tube was illuminated with ultra-violet light, the electric discharge took place more readily. Further experiments carried out by Hallwachs confirmed that certain negatively charged particles are emitted, when a Zn plate is illuminated with ultra-violet light. These particles were later identified as electrons.</p>
					<p>The phenomenon of emission of electrons from the surface of certain substances, when suitable radiations are incidentupon it is called <b>photoelectric effect</b>.</p>
					<h1 class="heading2">Explanation of Photoelectric Effect</h1>
					<h3 class="heading3">On the basis of wave theory:</h2>
					<p>According to wave theory, light is an electromagnetic radiation consisting of oscillating electric field vectors and magnetic field vectors. When electromagnetic radiations are incident on a metal surface absorb energy from the radiation. This occurs by the oscillations of electron under the action of electric field vector of electromagnetic radiation. When an electron acquires sufficiently high energy so that it can overcome its binding energy, it comes out from the metal.</p>
					<h3 class="heading3">On the basis of photon theory:</h2>
					<p>In 1905, the same year that he introduced the special theory of relativity. Einstein made a bold extension of the quantum idea by proposing a new theory of light. Plank's work had suggested that the vibrational energy of molecules in a radiating object is quantized with energy <i>E=nhf</i>, where n is an integer and <i>f</i> is the frequency of molecular vibration. Einstein argued that when light is emitted by a molecular oscillator, the molecule's vibrational energy of <i>nhf</i> must decrease by an amount <i>hf</i> or it's integral multiple. Then to conserve energy, the light ought to be emitted in packets, or <i>quanta</i>, each with an energy<br /><span style="padding-left:30px;">E = <i>hf</i></span><br />whwew <i>f</i> is the frequency of emitted light.</p>
					<p>Again <i>h</i> is the Plank's constant. Since alll light ultimately comes from a radiating source, this suggests that perhaps <i>light is transmitted as tiny particles</i>, or <b>photons</b>, as they are now called, in addtion to the waves predicted by Maxwell's electromagnetic theory. The photon theory of light was also a radical departure from classical ideas. Einstein proposed a test of quantum theory of light: quantitative measurements on the photoelectric effect.</p>
					<h1 class="heading2">Experimental Study of Photoelectric Effect</h3>
					<img src="images/courses/photoelectric_effect/main.gif">
					<p>When light of frequency <i>f</i> and intensity <i>I</i> falls on the cathode, electrons are emitted from it. The electrons are collected by the anode and current flows in the circuit. This current is called photoelectric current. This experiment is used to study the variation of photoelectric current with different factors like intensity, frequency and the potential difference between the anode and the cathode.</p>
					<h3 class="heading3">Variation of photoelectric current with potential difference:</h3>
					<p>With the help of above experimental setup, a graph is obtained between current and potential difference. A potential difference is varied with the help of a potential divider.</p>
					<p>The main points of observation are:</p>
					<ol type="a" style="margin-left:40px;">
						<li>At zero anode potential, a current exists. It means that electrons are emitted from cathode with some kinetic energy.</li>
						<li>As anode potential is increased, current increases. This implies that different electrons are emitted with different kinetic energies.</li>
						<li>After a certain anode potential, current acquires a constant value called saturation current.Current acquires a saturation value because the number of electrons emitted per second from the cathode are fixed.</li>
						<li>At a certain negative potential, the photoelectric cueent becomes zero. This is called <b>stopping potential</b>(V<sub>0</sub>). Stopping potential is a measure of maximum kinetic energy of the emittedd electrons. Let KE<sub>max</sub> be the maximum kinetic energy of an emitted electron, then KE<sub>max</sub> = eV<sub>0</sub>.
					</ol>
					<h3 class="heading3">Variation of current with intensity</h3>
					<p>The photoelectric current is found to be directly proportional to intensity of incident radiation.</p>
					<h3 class="heading3">Effect of intensity on saturation current and stopping potential</h3>
					<ol type="a" style="margin-left:40px;">
						<li>Saturation current increases with increase in intensity</li>
						<li>Stopping potential (and therefore maximum kinetic energy) is independent of intensity.</li>
					</ol>
					<h3 class="heading3">Effect of frequency:</h3>
					<ol type="a" style="margin-left:40px;">
						<li>Stopping potential is found to vary with frequency of incident light linearly. Greater the frequency of incident light, greater the stopping potential.</li>
						<li>There exists a certain minimum frequency <i>f</i><sub>0</sub> below which no stopping potential is required as no emission of electrons takes place. This frequency is called threshold frequency. For photoelectric emission to take place, <i>f > f<sub>0</sub></i>.
					</ol>
					<h1 class="heading2">Laws of Photoelectric Effect</h1>
					<p>From the above observetions, following conclusions are drawn.</p>
					<ol type="i" style="margin-left:40px;">
						<li>Photoelectric emission is an instantaneous process. The time lag between incidence of light and emission of electrons is of the order 10<sup>-9</sup>s.</li>
						<li>Photoelectric current is directly proportional to intensity of incident light, for a given frequency.</li>
						<li>The stopping potential and maximum kinetic energy depend upon frequency of incident radiation and is independent of its intensity.</li>
						<li>There exists a certain minimum frequency (called <b>threshold frequency</b>) below which emission of electrons stops. Corresponding to threshold frequency is threshold wavelength. If frequency of incident radiation is greater than threshold frequency or its wavelength is less than threshold wavelength, photoelectric emission takes place.</li>
						<li>The photoelectrons are emitte with kinetic energies varying between zero to a certain maximum value.</li>
						<li>Efficiency of photoelectric emission is very small. Every photon incident on a metal surface may not be successful in ejecting an electron.</li>
					</ol>
					<h1 class="heading2">Photon Theory of Light</h1>
					<ol type="i" style="margin-left:40px;">
						<li>A photon is a particle of light moving with a velocity of 3 * 10<sup>8</sup> m/s in vaccum.</li>
						<li>The speed of a photon is independent of frame of reference. This is a basic postulate of theory of relativity.</li>
						<li>The rest mass of a photon is zero i.e. photons do not exist at rest.</li>
						<li>The moving mass of a photon is E/c<sup>2</sup>, where E is energy.</li>
						<li>A photon possess momentum and carries energy.</li>
						<ol type="a" style="margin-left:40px;">
							<li>Energy of a photon is E = hc/&#955; = hf, where <i>f</i> si the frequency.</li>
							<li>Momentum of a photon is p = E/c</li>
						</ol>
						<li>In photon concept intensity of light is defined as <i>I = nhf</i><br />where n is the number of photons crossing per second per unit area.</li>
						<li>A photon can collide with material particles like the electron. During these collisions, the total energy and total momentum remains constant.</li>
						<li>Photons are electrically neutral. They are not deviated by electric or magnetic field.</li>
					</ol>
					<h1 class="heading2">Einstein's Photoelectric equation</h3>
					<p>According to Einstein the energy of photon <i>hf</i> is transferred to thee elecctron is used in two ways. Out of this, &#632; is the energy needed to escape. The remaining energy appears as kinetic energy of the electron.</p>
					<span style="padding-left:30px;"><i>hf</i> = &#632; + KE<sub>max</sub></span><br />
					Now KE<sub>max</sub> = eV<sub>0</sub>(where V<sub>0</sub>is stopping potential)<br />
					<span style="padding-left:30px;"><i>hf</i> = &#632; + eV<sub>0</sub><br />
					<span style="padding-left:30px;">V<sub>0</sub> = (h/e)f - &#632;/e<br />
					<p>Thus the stopping potential varies linearly with the frequency of incident radiation. Slope of the graph obtained is h/e. This graph helps in determination of Plank's constant.</p>
				</div><!--main_content-->
			
			</div><!--big_wrapper-->
			
		</div><!--page-->
		
	</body>
</html>