<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>wages</title>
</head>
<body>
<table>
<tr>
<td><b>First Name</b></td>
<td><b>salary</b></td>
</tr>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/wage";
    con = DriverManager.getConnection(url, "root", "");
    stmt = con.createStatement();
}
catch(Exception e){System.out.print("Failed to initialise DB Connection");}
try
{					
	rs= stmt.executeQuery("select * from employees");
	while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("fname") %></td>
		<td><%=rs.getString("salary") %></td>
		</tr>
		<%
	}
}
catch(Exception e1){e1.printStackTrace();}
%>
</table>
</body>
</html>