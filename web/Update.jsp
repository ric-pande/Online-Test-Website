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
        <title>Update Database</title>
    </head>
    <body bgcolor="sky blue">
    <%@ include file="companybanner.html" %>
    <br>
    <center><h1>Update Options</h1></center>
    <br>
    <% 
            
            Connection conn=(Connection)session.getAttribute("conn");
            %>
            <center><table width="550px" height="50px" border="1" bgcolor="sky blue" cellspacing="4" cellpadding="6">
                <tr>
                    <td>
                        <form method="post" action="">
                            <tr><td><b><font size="4">Question:</font></b></td><td width=100%><input type=text name="question" width="100%" bgcolor="yellow"></input></td>
                                    
                                </tr>
                                    <tr><td><b><font size="4">Option1:</font></b></td><td width=100%><input type=text name="optn1" width="300" bgcolor="yellow"></input></td>
                                        
                                    </tr>
                                    <tr><td><b><font size="4">Option2:</font></b></td><td width=100%><input type=text name="optn2" width="300" bgcolor="yellow"></input></td>
                                        
                                    </tr>
                                    <tr><td><b><font size="4">Option3:</font></b></td><td width=100%><input type=text name="optn3" width="300" bgcolor="yellow"></input></td>
                                       
                                    </tr>
                                    <tr><td><b><font size="4">Option4:</font></b></td><td width=100%><input type=text name="optn4" width="300" bgcolor="yellow"></input></td>
                                        
                                    </tr>
                                    <tr><td><b><font size="4">Answer:</font></b></td><td width=100%><input type=text name="ans" width="300" bgcolor="yellow"></input></td>
                                        
                                    </tr>
                                    <tr width="100%">
                                        <td><input type="submit" name="Browse" value="Browse"></input>
                                    </td>
                                        <td><center><input type=submit name="Update" value="Update"></input></center></td>   
                                    </tr>
                                    
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
            <% try
                    {
                    
                String submit=request.getParameter("Browse");
                String question=request.getParameter("question");
                String update=request.getParameter("Update");
                String option1=request.getParameter("optn1").toString();
                String option2=request.getParameter("optn2").toString();
                String option3=request.getParameter("optn3").toString();
                String option4=request.getParameter("optn4").toString();
                String answer=request.getParameter("ans").toString();
                Statement s=conn.createStatement();
                boolean exists=false;
                System.out.println("Queston "+question);
                if(submit!=null)
                    {
                        response.sendRedirect("View.jsp");
                    }
                    else
                        {
                        if(update!=null)
                            {
                    if(question!=null)
                        {       
                               System.out.println("Hello");
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
                                       }
                                       }
                             if(exists)
                                 {
                                    if(update!=null && question!="" && option1!="" && option2!="" && option3!="" && option4!="" && answer!="")
                                        {
                                            //System.out.println("Question "+question);
                                              
                                            if(answer.equals(option1)||answer.equals(option2)||answer.equals(option3)||answer.equals(option4))
                                                {
                                            s.executeUpdate("update add_quest set optn1=aes_encrypt('"+option1+"','12345'),optn2=aes_encrypt('"+option2+"','12345'),optn3=aes_encrypt('"+option3+"','12345'),optn4=aes_encrypt('"+option4+"','12345'),answer=aes_encrypt('"+answer+"','12345') where quest=aes_encrypt('"+question+"','12345') ");
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
                                        
                                        System.out.println("Option1 "+option1);
                                         if((option1=="" || option2=="" || option3=="" || option4=="" || answer=="") && (update!=null))                                      
                                             
                                       
                    {
                                         %>
                                         <script>
                                             alert("Missing fields");
                                         </script>
                                        <% }
                                        
                                        }
                                         else
                                     
                                         {
                                         if(update!=null)
                                             {
                                     %>
                                     <script>
                                     alert("Question does not exist. Browse again!");
                                     </script>
                                                             <% }
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
