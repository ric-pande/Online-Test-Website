
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
        <title>Enter Question</title>
    </head>
    <body bgcolor="sky blue">
    <%@ include file="companybanner.html" %>
    <br>
   
    <h1><center><font color="black">Enter Questions</font></center></h1>
   <center> <table width="550px" height="450px" border="0" bgcolor="sky blue" cellspacing="13" cellpadding="2">
                <tr><td width=100%><form method="post" action="" onsubmit="">
                            
                            <tr><td><font size="4"><b>Enter Question:</b></font></td>
                                <td><input type="text" name="quest" size="50"></input>
                                </td>
                            </tr>
                            
                            <tr><td><font size="4"><b>Enter Option1:</b></font></td>
                                <td><input type="text" name="opt1" size="50"></input>
                            </tr>
                            <tr><td><font size="4"><b>Enter Option2:</b></font></td>
                                <td><input type="text" name="opt2" size="50"></input>
                            </tr>
                            <tr><td><font size="4"><b>Enter Option3:</b></font></td>
                                <td><input type="text" name="opt3" size="50"></input>
                            </tr>
                            <tr><td><font size="4"><b>Enter Option4:</b></font></td>
                                <td><input type="text" name="opt4" size="50"></input>
                            </tr>
                            <tr><td><font size="4"><b>Enter Correct Answer:</b></font></td>
                                <td><input type="text" name="ans" size="50"></input>
                            </tr>
                            <tr><td width=33%><input type="submit" name="submit" value="Submit" width="20"></input></td>
                            <td width="33%"><input type="reset" name="reset" value="Reset" width="20"></input></td> 
                                    <td><input type="submit" name="end" value="End" align="center"></input></td></tr>
                          
                </td></tr>
                </form>
                </td>
            </tr>

    </table></center>
    <% 
        System.out.println("Submit  "+request.getParameter("submit"));
        System.out.println("Reset  "+request.getParameter("reset"));
        System.out.println("End  "+request.getParameter("end"));
        String submit=request.getParameter("submit");
        String reset=request.getParameter("reset");
        String end=request.getParameter("end");
        if(submit!=null)
                {
                System.out.println("Hello");       
        String question=request.getParameter("quest");
        String opt1=request.getParameter("opt1");
        String opt2=request.getParameter("opt2");
        String opt3=request.getParameter("opt3");
        String opt4=request.getParameter("opt4");
        String ans=request.getParameter("ans");
        System.out.println("Question:  "+ question);
        System.out.println("Option1   "+ opt1);
        if((question!="")&&(opt1!="")&&(opt2!="")&&(opt3!="")&&(opt4!="")&&(ans!=""))
            {
                if(ans.equals(opt1)||ans.equals(opt2)||ans.equals(opt3)||ans.equals(opt4))
                    {
        Connection con=(Connection)session.getAttribute("conn");
        Statement s=con.createStatement();
        s.executeUpdate("insert into add_quest(quest,optn1,optn2,optn3,optn4,answer) values (aes_encrypt('"+question+"','12345'),aes_encrypt('"+opt1+"','12345'),aes_encrypt('"+opt2+"','12345'),aes_encrypt('"+opt3+"','12345'),aes_encrypt('"+opt4+"','12345'),aes_encrypt('"+ans+"','12345'))");
        }
                else
                    {
                        %>
                        <script>
                        alert("Incorrect value of answer.Must match any one option.");
                        </script>
                        <%
                        }
                    }
        else
            {%>
            <script>
                alert("Missing Data!");
            </script>
            <%}
        }
        else
            {
            if(end!=null)
                {
                    %>
                    
                   <%@include file="choices.jsp"%>
                <% }
            }
            Connection conn=session.getAttribute("conn").toString();
            Statement stmt=conn.createStatement();
            Resultset rs=stmt.executeQuery("Select * from add_quest");
            session.setAttribute("res",rs);
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
    <%@ include file="companycpyright.html" %>
    </body>
</html>
