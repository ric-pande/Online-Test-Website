<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="skyblue">

    <h1> </h1>
   
     
<% //ResultSet rslt=(ResultSet)session.getAttribute("res");
       //System.out.println("res is: "+rslt);
       Connection conn=(Connection)session.getAttribute("conn");
       Statement stmt=conn.createStatement();
       ResultSet rslt=stmt.executeQuery("Select * from add_quest");
       String s[]=new String[500];
       int i=0;
      // String id=(String)session.getAttribute("id");
      // System.out.println("id is: " +id);
       try
                {
                if(rslt.next())
        {
        %>
         <br>
<br/>
<center>

<table border="1" width="500px" bgcolor="pink" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">

<form name="form1" method=post action="" onsubmit="onsubmitAction()">

 <h2 align="center"><font color="red">Online Quiz</font></h2>

<b>Select Correct Answer</b>
        <table border="0" width="500px" cellspacing="2" cellpadding="4">
 <tr>

<td width="50%"> Question:</td>
<%--<input type="hidden" name="correctAns" value="<%=rslt.getString(6)%>" />--%>
<tr>
<td><%= rslt.getString("quest") %></td></tr>
<tr>
<td>

1: <input type="radio" name="a" value="A" /></td>
    <td><%= rslt.getString("optn1") %></td></tr> 
<tr>
<td>
2: <input type="radio" name="a" value="B" /></td>
<td><%= rslt.getString("optn2") %></td></tr>

<tr>
<td>
3: <input type="radio" name="a" value="C" /></td>
<td><%= rslt.getString("optn3") %> </td></tr>

<tr>
<td>
4: <input type="radio" name="a" value="D" /> </td>
<td><%= rslt.getString("optn4") %> </td></tr>

<tr>
<td>
<center>
    <input type="submit" value="submit" name="submit"></center></td></tr>
</table>
   
  

</form>
 </td>
  </tr>
</table>
</center> 
        <%
        s[i] = request.getParameter("a").toString();
        System.out.println("answers are: " +s[i]);
        Statement st=conn.createStatement();
       // String query="insert into candidate_response values('"id"','"s[i]"', ";
      i=i+1;
        }
        else{
                        out.println("Completed!!");
                        %>
                        
                        <a href="third.jsp">Next Page</a>
                    <% }
                    }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    
    
    
    System.out.println("values are: " + s[0] + s[1] + s[2] + s[3] + s[4] + s[5]);
    %>
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
    
</html>
