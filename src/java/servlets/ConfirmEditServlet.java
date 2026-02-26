/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import business.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Heather Ward
 */
@WebServlet(name = "ConfirmEditServlet", urlPatterns = {"/ConfirmEdit"})
public class ConfirmEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        //get parameters for book and store
        String bookCode = request.getParameter("bookCode").trim();
        String storeIDParameter = request.getParameter("storeid").trim();  //parameter stored as string for now
        
        if (bookCode == null || storeIDParameter == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
            return;
        }
        
        int storeID;   //now parameter will be parsed to int
        try {
            storeID = Integer.parseInt(storeIDParameter);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Store ID");
            return;
        }
        
        //call helper methods
        Book book = getBookByCode(bookCode, storeID);
        Store store = getStoreById(storeID);
        
        if (book == null || store == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Book or Store not found");
            return;
        }
        
        //set results of query as request attributes to forward to jsp
        request.setAttribute("book", book);
        request.setAttribute("store", store);        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("ConfirmEdit.jsp");
        dispatcher.forward(request,response);
    }
        /*===================
        private helper methods for querying database
        ===================*/
    
        private Book getBookByCode(String bookCode, int storeID) {
            //setup db connection & query db for book info/onhand in this store
            //see also: invdetailsservlet logic
            Book book = null;
            
            String sql = """
                         SELECT bl.bookID, bl.title, bl.author, bl.price, bi.OnHand
                         FROM booklist bl
                         JOIN bookinv bi ON bl.bookID = bi.bookID
                         WHERE bl.bookID = ? AND bi.storeID = ?
                         """;
            
            ConnectionPool pool = null;
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                pool = ConnectionPool.getInstance();
                conn = pool.getConnection();
                
                ps = conn.prepareStatement(sql);
                ps.setString(1, bookCode);
                ps.setInt(2, storeID);
                
                rs = ps.executeQuery();
                
                //below: why not while?
                if (rs.next()) {
                    book = new Book(
                        rs.getString("bookID"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDouble("price"),
                        rs.getInt("OnHand")
                    );
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
            
            return book;
            
        }
        private Store getStoreById(int storeID) {
            // use existing getStoreById method
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
        
}
