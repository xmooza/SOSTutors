<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tutoring Sessions</title>
<style>
table {
    width:100%;
}
table, th, td {
    border: 2px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
table#TeachersList tr:nth-child(even) {
    background-color: #eee;
}
table#TeachersList tr:nth-child(odd) {
   background-color:#fff;
}
table#TeachersList th	{
    background-color: #0000cc;
    color: white;
}

select#Subjects {
 
}
</style>
</head>

<body>
<center>
 <h1>Tutoring Sessions</h1>
</center>

</body>


<body>
Subjects: 
<select id="Subjects">
  <option value="English"> All </option>
  <option value="English"> English </option>
  <option value="Math"> Math </option>
  <option value="Science "> Science </option>
  <option value="History"> History </option>
  <option value="geography"> geography </option>
  <option value="French"> French </option>

</select><br><br>



<table id="TeachersList">

  <tr>
 
    <th> <center>Tutor Name </center></th>
    <th><center>Level Of Education</center></th>
    <th><center>Price /hr</center></th>		
    <th><center>Select</center></th>
   
  </tr>
  <tr>
    <td>Teacher 1</td>
    <td>Grade 12 Graduate</td>
    <td>$10</td>		
    <td>  
    <center>  	 
   		<form name="f1" action="http://localhost:8080/SOSTutors/Teacher.jsp" >
        	 <input id="book" type="submit" name="book" value="Book">
       </form>
    </center> 
    </td>     
  </tr>
  <tr>
    <td>Teacher 2</td>
    <td>Bachelors Of Arts</td>
    <td>$12</td>		
    <td> <center>  	 
   		<form name="f1" action="#" >
        	 <input id="book" type="submit" name="book" value="Book">
       </form>
       </center>
    </td>
  </tr>
  <tr>
    <td>John</td>
    <td>Bachelors Of Arts</td>
    <td>$15</td>		
    <td>  
    <center>  	 
   		<form name="f1" action="#" >
        	 <input id="book" type="submit" name="book" value="Book">
       </form>
    </center> 
    </td>
  </tr>
</table>

</body>
</html>