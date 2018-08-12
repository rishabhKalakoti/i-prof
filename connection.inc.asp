<%	
	'database_url="D:/project/databases/user_data.mdb"
	database1_url=server.mappath("databases/user_data.mdb")
	database2_url=server.mappath("databases/site_data.mdb")
	
	set conn1 = server.createobject("adodb.connection")
	conn1.open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & database1_url
	
	set conn2 = server.createobject("adodb.connection")
	conn2.open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & database2_url
%>