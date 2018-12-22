<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
        <title>Online Test</title>
    </head>
    <body bgcolor="sky blue">
    <%@ include file="companybanner.html" %>
    <br>
    <br>
    <br>
    <center><h1><font size="6.8" color="navy">Welcome</font></h1></center>
    <br>
    
    <center>
        <table width="500px" border="1" bgcolor="sky blue" cellspacing="15" cellpadding="1" >
            <tr>
                <td>
                    <center><font size="5" color="black"><b>Login as:</b></font></center>
                </td>
            </tr>
                        <tr>
                            <td><center><a href="Adminlogin.jsp" ><font size="4" color="black"><b>Administrator</b></font></a></center></td>
            </tr>
            <tr>
                <td><center><a href="Userlogin.jsp"><font size="4" color="black"><b>User</b></font></a></center></td>
            </tr>
        </table>
    </center>
    <br>
    <br>
    <center><font size="5"><b>Not a member yet!</b></font></center>
    <br>
    <center><a href="signup.jsp"><font size="4" color="purple"><b>Sign up now</b></font></a></center>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
    
    <%@ include file="companycpyright.html" %>
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
