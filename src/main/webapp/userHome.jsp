<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>userHome</title>
</head>
<body>
<h3>Welcome</h3>
<%
	String uname=session.getAttribute("um").toString();
	String userType=session.getAttribute("ut").toString();

	int ut=Integer.parseInt(userType);
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Book","root","root");
		
		PreparedStatement stmt=con.prepareStatement("select * from usermenu where userRoll="+ut);
	
		ResultSet rst= stmt.executeQuery();
		
		while(rst.next()){
			out.println("<a href="+rst.getString("url")+">"+rst.getString("menuItem")+"</a>&nbsp;nbsp;nbsp;");
		}
	}
	catch(Exception e){
			System.out.println(e);
	}
%>
</body>
</html>