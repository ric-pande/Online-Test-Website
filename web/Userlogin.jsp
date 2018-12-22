
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
        <title>Userlogin</title>
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
    <body bgcolor="skyblue">
    <%@ include file="companybanner.html" %>
    <br>
    <br>
    <br>
    <h1><center><b>USER LOGIN</b></center></h1>
    
    <table width="500px" border="1" cellspacing="9" cellpadding="2" align="center" bgcolor="skyblue">
        <tr><td>
            <form method="post" onSubmit="return Verify(this);" action="">
                <tr>
                <td>
                <center><font size="4"><b>Enter User Id:</b></font></td></center><td><center><input name="uname" type=text width=40 align="center"></input></center></td>
                <br>
                <br>
                    
                    <tr>
                        <script>
                       theForm.uname.focus();
                    </script>
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
    <% 
        boolean flag=false;
        try{
            Connection conn=(Connection)session.getAttribute("conn");
        
        System.out.println("In Login\n"+"conn:  "+conn);
        Statement s=conn.createStatement();
        ResultSet res=s.executeQuery("select username_encry,aes_decrypt(password_encry,'12345') as pdecry from login_det");
        String username=request.getParameter("uname").toString();
        String password=request.getParameter("pswd").toString();
        System.out.println("Username: "+username);
        System.out.println("Password: "+password);
        while(res.next())
           {
          String uname=res.getString("username_encry");
          String pswd_decry=res.getString("pdecry");
          System.out.println("User_decry  "+uname);
         System.out.println("Hello");
          if(username.equals(uname))
              {
              System.out.println("Hello" + uname);
              if(password.equals(pswd_decry))
                  {
                        flag=true;
                        response.sendRedirect("Questionscreen.jsp");
                        break;
                  }
              }
           // System.out.println("uencry  "+user_decry);
           }
           System.out.println("Flag  "+flag);
           if(flag==false)
               {
               %>
               <script>
                   alert("Username does not exist");
               </script>
               <%
               }
           
           }
            catch(Exception e)
            {
                    e.printStackTrace();
            }
        %>
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
