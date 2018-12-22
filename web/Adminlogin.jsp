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
        <title>Adminlogin</title>
        <script>
            
          function Verify(theForm)
            {
            if (theForm.uname.value=="")
                {
                    alert("Enter id");
                    theForm.uname.focus();
                    return false;
                }
                else
                {
                    if(theForm.pswd.value=="")
                    {
                        alert("Enter password");
                        theForm.pswd.focus();
                        return false;
                        }
                 }
              
                    
                               return true;
           }
            </script>
    </head>
    <body bgcolor="sky blue">
    <%@ include file="companybanner.html" %>
    <br>
    <br>
    <br>
    <h1><center><b>ADMIN LOGIN</b></center></h1>
    
    <table width="500px" border="1" cellspacing="9" cellpadding="2" align="center" bgcolor="sky blue">
        <tr><td>
            <form method="post" onSubmit="return Verify(this);" action="">
                <tr>
                <td>
                <center><font size="4"><b>Enter Id:</b></font></td></center><td><center><input name="uname" type=text width=40 align="center"></input></center></td>
                <br>
                <br>
                    
                    <tr>
                        
                    <td><center><font size="4"><b>Enter Password:</b></font></td></center><td><center><input name="pswd" type=password width=40 align="center"></center</input></center></td>
                    <tr>
                        <td><center><input type="submit" name="submit" value="Submit" align="center"></input></center></td>
                        <td><center><input type="reset" name="reset" value="Reset" align="center"></input></center></td>
                    </tr>
                </form>
            </td>
        </tr>
    </table>
    <br>
    <br>
    
    <% 
        try
                {
                
                
        String username=request.getParameter("uname").toString();
        String password=request.getParameter("pswd").toString();
        if(username.equalsIgnoreCase("admin"))
            {
                if(password.equals("admin123"))
                    {
                        response.sendRedirect("Enterquest.jsp");
                    }
            
            else
                %>
                <script>
                    alert("Incorrect password");
                </script>
            <%
            }
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
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <%@ include file="companycpyright.html" %>
    </body>
</html>
