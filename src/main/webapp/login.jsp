<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>e-book</title>
<style>
.city {
  background-color: tomato;
  color: white;
  border: 2px solid black;
  margin-top: 100px;
  margin-left:400px; 
  padding: 20px;
  width:25%;
  height:100px;
}
p {
 margin-top:70px;
 margin-left:500px;
}
body {
  background-image: url("book.jpg");
  background-repeat: no-repeat;
   background-attachment: fixed;
  background-size: cover;
}
</style>


<script>
function validateForm() {
	  let x = document.forms["form1"]["username"].value;
	  let y = document.forms["form1"]["password"].value;
	  if (x == "" || y=="") {
	    alert("UserName and pass must be filled out");
	    return false;
	  }
	}


</script>
</head>
<body>
<%
if ("POST".equalsIgnoreCase(request.getMethod()))
{
    // Form was submitted and write code for evaluation of form.
    out.println("<H3>login processing</H3>");
    String uname=request.getParameter("username");
    String pass=request.getParameter("password");	
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Book","root","root");
		PreparedStatement stmt=con.prepareStatement("select * from user where userName=? and password=? and Status=1");
		stmt.setString(1,uname);
		stmt.setString(2,pass);
		ResultSet rst=stmt.executeQuery();
		if(rst.next())
		{
		//	out.println("login successfully");
			//out.println("user name is:"+rst.getString("userName"));
			//out.println("user Type is:"+rst.getInt("userType"));
			session.setAttribute("um",uname);
			session.setAttribute("ut",rst.getInt("userType"));
			
			response.sendRedirect("userHome.jsp");
			
		}
		else{
			out.println("invalid data");
		}
    }
		catch(Exception e){
    	System.out.println(e);
        } 
    
}
else {
	%>
	<center><h1>e-BOOK</h1></center>
 	<form class="city" name="form1" action="login.jsp"  onSubmit="return validateForm()" method="post">
	<label>userName :</label>
	<input type="text" name="username"  placeholder="enter uname" ><br><br>
	
	<label>Password :</label>
	<input type="password" name="password" ><br><br>
	
	
	<input type="submit" value="login">
	<input type="reset" value="cancel">
	</form>
<%
}
%>
</body>
</html>