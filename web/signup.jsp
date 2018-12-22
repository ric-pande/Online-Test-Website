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
        <title>Sign Upe</title>
    </head>
    <body bgcolor="sky blue">
    <%@ include file="companybanner.html" %>
    <% Connection conn=(Connection)session.getAttribute("conn");
        Statement s=conn.createStatement();
        %>
    <br>
    <br>
    <center> <h1><b>Sign Up!</b></h1></center>
    <br>
    <table width="500px" border="1" cellspacing="9" cellpadding="2" align="center" bgcolor="sky blue">
        <tr><td>
            <form method="post" onSubmit="return Verify(this);" action="">
                        <tr>
                            <td>
                            <center><font size="4"><b>Enter User Id:</b></font></td></center><td><center><input name="uname" type=text width=40 align="center"></input></center></td>
                        </tr>
                    
                        <tr>
                        <script>
                       theForm.uname.focus();
                        </script>
                        <td><center><font size="4"><b>Enter Password:</b></font></td></center><td><center><input name="pswd" type=password width=40 align="center"></center</input></center></td>
                    </tr>
                     <tr>
                            <td>
                            <center><font size="4"><b>Retype Password:</b></font></td></center><td><center><input name="vpswd" type=password width=40 align="center"></input></center></td>
                        </tr>
                    
                    <tr>
                        <td><center><input type="submit" name="submit" value="Submit" align="center"></input></center></td>
                        <td><center><input type="reset" name="reset" value="Reset" align="center"></input></center></td>
                    </tr>
                </form>
            </td>
        </tr>
    </table>
    <%
            try{
               
            boolean flag=false;
            String uname=request.getParameter("uname");
            String pswd=request.getParameter("pswd");
            String vpswd=request.getParameter("vpswd");
            ResultSet rslt=s.executeQuery("select * from login_det");
            
            while(rslt.next())
                {
                    String user=rslt.getString("username_encry");
                    System.out.println("User  "+uname);
                    if(uname!="")
                        {
                         if(user.equals(uname))
                             {
                                flag=true;
                             %>
                             <script>
                                 alert("Username already exists");
                             </script>
                <% break;
                         }
                    }
                    }
                    if(flag==false)
                        {
            if(pswd=="" || uname=="" || vpswd=="")
                {
                %>
                <script>
                    alert("Fields cannot be blank");
                </script>
                <%
                }
                else{
                if(pswd.equals(vpswd))
                {
                    s.executeUpdate("insert into login_det values('"+uname+"',aes_encrypt('"+pswd+"','12345'))");
                }
                else
                    {
                     %>
                     <script>
                         alert("Passwords do not match");
                     </script>
                     <%
                    }
                    }
                    }
                    } 
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
                    %>
    <br>
    <br>
    <br>
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
