<%-- 
    Document   : ConfirmEdit
    Created on : Nov 14, 2025, 12:10:47 PM
    Author     : Heather Ward
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="business.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Edit</title>
    </head>
    <body>
        <p>
            User: ${u.userID} - ${u.userName}, ${u.adminLevel} permissions
        </p>
        <br>
        
        Branch Number: <strong>${store.storeID}</strong>
        <br>
        Branch Name: <strong>${store.storeName}</strong>
        <br>
        Branch Location: <strong>${store.storeAddress}</strong>
        <br><br>
        Book Code: <strong>${book.bookID}</strong>
        <br>
        Book Title: <strong>${book.title}</strong>
        <br>
        Author: <strong>${book.author}</strong>
        <br><br>
        Inventory on hand in branch:
        <form action="UpdateInv" method="post">
            <input type="hidden" name="bookCode" value="${book.bookID}">
            <input type="hidden" name="storeid" value="${store.storeID}">
            <input type="number" id="onHand" name="onHand" min="0" required>
            <input type="submit" value="Update Inventory">
        </form>
            <br>
        <!-- Button that says "cancel", returns to prev page -->
        <a href="ViewInventory.jsp?storeid=${store.storeID}">
            <button type="button">
                Cancel
            </button>
        </a>
    </body>
</html>
