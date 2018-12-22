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
    <body>

    <h1>JSP Page</h1>
    <%
    try
            {
            Connection con=(Connection)session.getAttribute("conn");
            out.println("con:  "+con);
            Statement s=con.createStatement();
            ResultSet res1=s.executeQuery("select aes_decrypt(quest,'12345') as quest,aes_decrypt(optn1,'12345') as optn1,aes_decrypt(optn2,'12345') as optn2,aes_decrypt(optn3,'12345') as optn3,aes_decrypt(optn4,'12345') as optn4,aes_decrypt(answer,'12345') as answer from add_quest");
            session.setAttribute("rslt1",res1);
            out.println("Result  "+res1);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
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
    
    </body>
</html>
