<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="userHome.jsp" %>
<%
if ("POST".equalsIgnoreCase(request.getMethod()))
{
	 out.println("<H6>loading...</H6>");
	    String TITLE=request.getParameter("title");
	    String AUTHOR=request.getParameter("author");
	    String EDITION=request.getParameter("edition");
	    int PRICE=Integer.parseInt(request.getParameter("price"));
	    String PUBLICATION=request.getParameter("publication");
	    
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Book","root","root");
			PreparedStatement stmt=con.prepareStatement("insert into books(Title,Author,Edition,Price,Publication)values(?,?,?,?,?)");
			stmt.setString(1,TITLE);
			stmt.setString(2,AUTHOR);
			stmt.setString(3,EDITION);
			stmt.setInt(4,PRICE);
			stmt.setString(5,PUBLICATION);
			
			stmt.executeUpdate();
			
			out.println("Added Book successfully.");
			
			
			
		}
		catch(Exception e){
	    	System.out.println(e);
	        } 

}
else {
	%>
	<center><h1>e-BOOK</h1></center>
		<hr>
	<h3 style="background-color:red; align="center">add Books.<h3>
 	<form class="city" name="form3" action="Addbook.jsp" method="post">
	
	<label>Book Title :</label>
	<input type="text" name="title"  placeholder="enter book uname" ><br><br>
	
	<label>Author name:</label>
	<input type="text" name="author" ><br><br>
	
	<label>Publication :</label>
	<input type="text" name="publication"  placeholder="-----------" ><br><br>
	
	<label>Edition :</label>
	<input type="text" name="edition" ><br><br>
	
	<label>Price :</label>
	<input type="text" name="price" ><br><br>
	
	<input type="submit" value="login">
	<input type="reset" value="cancel">
	</form>

	<%
	}
	%>

</body>
</html>