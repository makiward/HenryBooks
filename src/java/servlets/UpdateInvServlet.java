
package servlets;

import business.ConnectionPool;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author Heather Ward
 */

/*=============
Receives Post data from ConfirmEdit JSP, updates DB, and
redirects to InvDetails for that store.
==============*/

@WebServlet(name = "UpdateInvServlet", urlPatterns = {"/UpdateInv"})
public class UpdateInvServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //get parameters from form
        String bookCode = request.getParameter("bookCode");
        String storeIdParam = request.getParameter("storeid");
        String onHandParam = request.getParameter("onHand");
        
        //check Strings first
        if (bookCode == null || storeIdParam == null || onHandParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
            return;
        }
        
        int storeID;
        int onHand;
        
        //NOW parse to int
        try {
            storeID = Integer.parseInt(storeIdParam);
            onHand = Integer.parseInt(onHandParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric values");
            return;
        }
        
        //update DB
        boolean complete = updateBookInDB(bookCode, storeID, onHand);
        
        if (!complete) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update book");
        }
        
        //send user back to invdetails
        response.sendRedirect("InvDetails?storeid=" + storeID 
        + "&complete=true");    //redirect with success message
    }
    
    private boolean updateBookInDB (String bookCode, int storeID, int onHand) {
        String updateInventorySQL = "UPDATE bookinv SET OnHand = ? WHERE bookID = ? AND storeID = ?";
        
        ConnectionPool pool = null;
        Connection conn = null;
        PreparedStatement psBook = null;
        PreparedStatement psInventory = null;

        try {
            pool = ConnectionPool.getInstance();
            conn = pool.getConnection();

            // Update inventory info for the specific store
            psInventory = conn.prepareStatement(updateInventorySQL);
            psInventory.setInt(1, onHand);
            psInventory.setString(2, bookCode);
            psInventory.setInt(3, storeID);
            psInventory.executeUpdate();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (psInventory != null) psInventory.close(); } catch (SQLException ignored) {}
            if (conn != null && pool != null) pool.freeConnection(conn);
        }
    }
}
