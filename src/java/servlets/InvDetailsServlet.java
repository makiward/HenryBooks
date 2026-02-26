/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import business.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Heather Ward
 */


public class InvDetailsServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String storeIdParam = request.getParameter("storeid");
        if (storeIdParam == null || storeIdParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Store ID not specified");
            return;
        }

        int storeID;
        try {
            storeID = Integer.parseInt(storeIdParam.trim());
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Store ID");
            return;
        }

        // Fetch the Store object
        Store store = getStoreById(storeID);
        if (store == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Store not found");
            return;
        }
        request.setAttribute("store", store);

        // Fetch inventory
        ArrayList<Book> inventory = new ArrayList<>();
        ConnectionPool pool = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            pool = ConnectionPool.getInstance();
            conn = pool.getConnection();

            String sql = """
                  SELECT bl.bookID, bl.title, bl.author, bl.price, bi.OnHand
                  FROM booklist bl
                  JOIN bookinv bi ON bl.bookID = bi.bookID
                  WHERE bi.storeID = ?
            """;

            ps = conn.prepareStatement(sql);
            ps.setInt(1, storeID);
            rs = ps.executeQuery();

            while (rs.next()) {
                inventory.add(new Book(
                        rs.getString("bookID"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDouble("price"),
                        rs.getInt("OnHand")
                ));
            }

            request.setAttribute("inventory", inventory);

        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (ps != null) ps.close(); } catch (SQLException ignored) {}
            if (conn != null && pool != null) pool.freeConnection(conn);
        }

        // Forward to JSP that makes table
        RequestDispatcher dispatcher = request.getRequestDispatcher("InvDetails.jsp");
        dispatcher.forward(request, response);
    }

    private Store getStoreById(int storeID) {
        Store store = null;

        String sql = "SELECT storeID, storeName, storeAddr FROM stores WHERE storeID = ?";

        ConnectionPool pool = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            pool = ConnectionPool.getInstance();
            conn = pool.getConnection();

            ps = conn.prepareStatement(sql);
            ps.setInt(1, storeID);
            rs = ps.executeQuery();

            if (rs.next()) {
                store = new Store();
                store.setStoreID(rs.getInt("storeID"));
                store.setStoreName(rs.getString("storeName"));
                store.setStoreAddress(rs.getString("storeAddr"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (ps != null) ps.close(); } catch (SQLException ignored) {}
            if (conn != null && pool != null) {
                pool.freeConnection(conn);
            }
        }

        return store;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            doGet(request, response);
        }
}
