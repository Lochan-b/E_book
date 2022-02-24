<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import= "java.util.Date"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add member</title>
</head>
<body>
<%@ include file="userHome.jsp" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod()))
{
	 out.println("<H6>loading...</H6>");
	    String uname=request.getParameter("username");
	    String pass=request.getParameter("password");
	    String nam=request.getParameter("uname");
	    String addr=request.getParameter("address");
	    String mail=request.getParameter("email");
	    String mob=request.getParameter("mobile");
	    String gen=request.getParameter("gender");
	    Date date=Date.valueOf(request.getParameter("dob"));
	    
	   // java.sql.Date d1=new java.sql.Date(date.getDate());
	    try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Book","root","root");
			PreparedStatement stmt=con.prepareStatement("select * from user where userName=?");
			
			stmt.setString(1,uname);
			
			ResultSet rst=stmt.executeQuery();
			if(rst.next())
			{
				out.println("user existed");
				out.println("user name is:"+rst.getString("userName"));
	       }
			else{
				PreparedStatement stmt1=con.prepareStatement("insert into user(userName,password,userType,Status)values(?,?,0,?)");
				stmt1.setString(1,uname);
				//stmt1.setString(1,pass);
				
				stmt1.executeUpdate();
				ResultSet rst1=stmt1.executeQuery();
				if(rst1.next())
				{
					int uid =rst.getInt("userid");
					PreparedStatement stmt2=con.prepareStatement("insert into userdetail(userid,Name,Address,Email,Mob,Gender,DOB)values(?,?,?,?,?,?,?)");
					
					stmt2.setInt(1,uid);
					stmt2.setString(2,nam);
					stmt2.setString(3,addr);
					stmt2.setString(4,mail);
					stmt2.setString(5,mob);
					stmt2.setString(6,gen);
					stmt2.setDate(7,date);
					
					ResultSet rst2=stmt2.executeQuery();
					if(rst2.next())
					{
						out.println("data from user.");
						out.println("user id is:"+rst2.getInt("userid"));
						out.println("user name is:"+rst2.getString("Name"));
						out.println("user ADDRESS is:"+rst2.getString("Address"));
						out.println("user mail id is:"+rst2.getString("Email"));
						out.println("user mob is:"+rst2.getLong("Mob"));
						out.println("user ngender is:"+rst2.getString("Gender"));
						out.println("om=n Date:"+rst2.getDate("DOB"));
					
				   }
			  }
	      }
	    }
	   

	    catch(Exception e)
	    {
    	System.out.println(e);
        } 
    
}else{
%>
<center><h1>e-BOOK</h1></center>
	<hr>
	<h3 style="background-color:DodgerBlue align="center">Add member detail.<h3>
 	<form class="city" name="form2" action="Addmember.jsp" method="post">
	
	<label>userName :</label>
	<input type="text" name="username"  placeholder="enter uname" ><br><br>
	
	<label>Password :</label>
	<input type="password" name="passward" ><br><br>
	
	<label>Name :</label>
	<input type="text" name="uname"  placeholder="enter name" ><br><br>
	
	<label>Address :</label>
	<Textarea name="address" row="5" col="10"></textarea><br><br>
	
	<label>Email :</label>
	<input type="text" name="email"  placeholder="enter e-mail" ><br><br>
	
	<label>Contact no :</label>
	<input type="number" name="mobile"  placeholder="mobile" ><br><br>
	
	<label>Select Gender :</label><br>
   <input type="radio"  name="gender" value="male">
   <label for="ml">Male</label><br>
   <input type="radio"  name="gender" value="female">
   <label for="fe">Female</label><br><br>

   <label>Date :</label>
   <input type="date" name="dob" value=""><br><br>
   
	<input type="submit" value="login">
	<input type="reset" value="cancel">
	</form>
<%
}
%>
</body>
</html>