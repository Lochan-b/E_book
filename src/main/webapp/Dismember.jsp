<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dismember</title>
</head>
<body>
<%@ include file="userHome.jsp" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod()))
{
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Book","root","root");
		
		PreparedStatement stmt=con.prepareStatement("update user set Status ? where userName=?");
		
		String uname=request.getParameter("uname");
		String option=request.getParameter("s1");
	
		if(option.equals("d")){
			stmt.setInt(1,1);
		}
		else{
			stmt.setString(2,uname);
			stmt.executeUpdate();
			out.println("Status Updated");
		}
	}
	catch(Exception e){
			System.out.println(e);
			}
}
else {
	%>
 	<center><h1>e-BOOK</h1></center>
 	<hr>
 	<form class="city" name="form4" action="Dismember.jsp" method="post">
	<label>userName :</label>
	<input type="text" name="u1"  placeholder="enter uname" ><br><br>
	
	<lable for="s1">permition :</lable>
	<select name="s1">
 		<option value="e">Enable</option>
 		<option value="d">Disable</option>
   </select>
	<br><br>
	<input type="submit" value="Activate">
	<input type="reset" value="cancel">
	</form>
<%
}
%>	
</body>
</html>