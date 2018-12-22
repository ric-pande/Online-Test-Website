<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
        <title>View Questions</title>
    </head>
    <body bgcolor="green">

            <center><h1><font color="yellow"><u>Questions:</u></font></h1></center>
            <center><table width="100%" height="50px" border="1" bgcolor="sea blue">
                    
                    <th width="50%" height="10%"><font size="4.5"><u><b>Question:</b></u></font></th>    
                    <th width="10%" height="10%"><font size="4"><u><b>Option1:</b></u></font></th>
                    <th width="10%" height="10%"><font size="4"><u><b>Option2:</b></u></font></th>
                    <th width="10%" height="10%"><font size="4"><u><b>Option3:</b></u></font></th>
                    <th width="10%" height="10%"><font size="4"><u><b>Option4:</b></u.</font></th>
                    <th width="10%" height="10%"><font size="4"><u><b>Correct answer:</b></u></font></th>
            </table></center>
            <% Connection con=(Connection)session.getAttribute("conn");
            Statement s=con.createStatement();
            ResultSet res=s.executeQuery("select aes_decrypt(quest,'12345') as quest,aes_decrypt(optn1,'12345') as optn1,aes_decrypt(optn2,'12345') as optn2,aes_decrypt(optn3,'12345') as optn3,aes_decrypt(optn4,'12345') as optn4,aes_decrypt(answer,'12345') as answer from add_quest");
            while(res.next())
            {
            %>
            
            
            <center><table width="100%" height="50px" bgcolor="sea blue" border="1">
            <tr>
                
                
                <%--<input type="hidden" name="correctAns" value="<%=rslt.getString(6)%>" />--%>
                <td width="50%" ><%= res.getString("quest") %></td>
                <td width="10%" ><%= res.getString("optn1") %></td>
                <td width="10%" height="10%"><%= res.getString("optn2") %></td>
                <td width="10%" height="10%"><%= res.getString("optn3") %></td>
                <td width="10%" height="10%"><%= res.getString("optn4") %></td>
                <td width="10%" height="10%"><%= res.getString("answer") %></td>
            </tr>
          
       
<%
        }
        %>
         </table>
    </center> 
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
