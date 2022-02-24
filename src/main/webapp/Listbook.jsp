<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookList</title>
</head>
<body>
<%@ include file="userHome.jsp" %>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Book","root","root");
	PreparedStatement stmt=con.prepareStatement("select * from books");
	
	ResultSet rst=stmt.executeQuery();
	out.println("<table  border='1'><tr><th>bookid</th><th>_Title</th><th>_Author</th><th>_Edition</th><th>_Publication</th><th>_Price</th>");
	while(rst.next())
	{
	out.println("<tr><td>"+rst.getInt("bookid")+"</td><td>"+rst.getString("Title")+"</td><td>"+rst.getString("Author")+"</td>");
	out.println("<td>"+rst.getString("Edition")+"</td><td>"+rst.getInt("Price")+"</td><td>"+rst.getString("Publication")+"</td></tr>");
	
   }
	out.println("</table>");
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>