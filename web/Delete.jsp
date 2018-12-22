<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.awt.*" %>
<%@ page import="java.applet.*" %>
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
    <body bgcolor="sky blue">
    <%@ include file="companybanner.html" %>
     <br>
    <center><h1>Delete Question</h1></center>
    <br>
    <%
            Connection conn=(Connection)session.getAttribute("conn");
            Statement s=conn.createStatement();
            ResultSet rslt=s.executeQuery("select aes_decrypt(quest,'12345') as quest from add_quest");
            %>
            <center><table width="550px" height="50px" border="1" bgcolor="sky blue" cellspacing="13" cellpadding="6">
                <tr>
                    <td>
                        <form method="post" action="">
                            <tr><td><b><font size="4">Enter Question:</font></b></td>
                            <td width="100%"><input type=text name="question" width="100%" bgcolor="yellow"></input></td>    
                               </tr>
                               <tr>
                                        <td width="50%"><input type="submit" name="Browse" value="Browse"></input>
                                    </td>
                                        <td><center><input type=submit name="Delete" value="Delete"></input></center></td>   
                                    </tr>
                                    </form>
                                    </td>
                             </tr>
                             </table>
                             </center>
                             <%
                                 try
                                 {
                                 String submit=request.getParameter("Browse");
                                 String delete=request.getParameter("Delete");
                                 String question=request.getParameter("question");
                                 boolean exists=false;
                                 if(submit!=null)
                                 {
                                    response.sendRedirect("View.jsp");
                                    }
                          
                        if(question!=null)
                        {       
                               exists=false;
                               ResultSet res=s.executeQuery("select aes_decrypt(quest,'12345') as quest,aes_decrypt(optn1,'12345') as optn1,aes_decrypt(optn2,'12345') as optn2,aes_decrypt(optn3,'12345') as optn3,aes_decrypt(optn4,'12345') as optn4,aes_decrypt(answer,'12345') as answer from add_quest");
                               String quest;
                               
                               while(res.next())
                                   {
                                       quest=res.getString("quest");
                                       if(question.equals(quest))
                                           {
                                                exists=true;
                                                
                                                break;
                                           }
                                           }
                                  // if(exists)
                                     //  {
                                        //    optn1.
                                        //    optn2.setParameter(res.getString("optn2"));
                                          //  optn3.setParameter(res.getString("optn3"));
                                           // optn4.setParameter(res.getString("optn4"));
                                    //   }
                                       }
                                      
                             if(exists)
                                 {
                                    
                                    if(delete!=null)
                                        {
                                            s.executeUpdate("delete from add_quest where quest=aes_encrypt('"+question+"','12345')");
                                        }
                                        }
                                        else
                                            {
                                                if(question!=null)
                                                    {
                                            %>
                                            <script>
                                     alert("Question does not exist. Browse again!");
                                     </script>
                                   <%
                                   }
                                                }
                                 }
                                   catch(Exception ex)
                                   {
                                      ex.printStackTrace();
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
