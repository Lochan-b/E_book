<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>change password</title>

<script>
function validateForm() {
	  let x = document.forms["form4"]["p1"].value;
	  let y = document.forms["form4"]["p2"].value;
	  if (!x.equals(y)) {
	    alert("New value dose not match");
	    return false;
	  }
	}
</script>

</head>
<body>
<%@ include file="userHome.jsp" %>
<%
if ("POST".equalsIgnoreCase(request.getMethod()))
{
	String oldpass=request.getParameter("p1");
	String newpass=request.getParameter("p2");
	String confirmpass=request.getParameter("p3");
	
	String unaam=session.getAttribute("um").toString();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Book","root","root");
	
		PreparedStatement stmt=con.prepareStatement("");
	}
	catch(Exception e){
			System.out.println(e);
			}
}
else {
%>
<center><h1>e-BOOK</h1></center>
 	<hr>
 	<h3 style="background-color:greem; align="center">change password.<h3>
 	<form class="city" name="form4" action="Dismember.jsp" method="post" onSubmit()=return validateForm()>
	<label>Old Password :</label>
	<input type="password" name="p1" ><br><br>	
	
	<label>New Password :</label>
	<input type="password" name="p2" ><br><br>	
	
	<label>Confirm Password :</label>
	<input type="password" name="p3" ><br><br>	
	
	<input type="submit" value="Reset">
	<input type="reset" value="cancel">
	</form>
<%
}
%>

</body>
</html>