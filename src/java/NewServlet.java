/*
 * NewServlet.java
 *
 * Created on 7 June, 2010, 8:45 PM
 */

import java.io.*;
import java.net.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author SANKALP
 * @version
 */
public class NewServlet extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
   /* protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet NewServlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet NewServlet at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
       // out.close();
    //}
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        doPost(request,response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       // processRequest(request, response);
        Connection conn=null;
        String username="root";
        String password="root123";
        String url="jdbc:mysql://localhost:3306/onlinetest_db";
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn=DriverManager.getConnection(url,username,password);
            PrintWriter out=response.getWriter();
            out.println("conxn: "+conn);
            HttpSession session=request.getSession(true);
            session.setAttribute("conn",conn);
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    /** Returns a short description of the servlet.
     */
   // public String getServletInfo() {
      //  return "Short description";
   // }
    // </editor-fold>
}
