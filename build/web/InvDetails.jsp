<%-- 
    Document   : InvDetails
    Created on : Nov 6, 2025, 3:34:51 PM
    Author     : Heather Ward
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Store Inventory Details</title>
    </head>
    <body>
        <!-- Should receive a store identifier, query the db
             for all books in that store, and return HTML to
             be displayed on ViewInventory via AJAX. -->
        <c:if test="${param.complete == 'true'}">
            <p style="color: green; font-weight: bold;">Inventory updated successfully!</p>
        </c:if>
        <c:if test="${isAdmin}">
            <form action="ConfirmEdit" method="get">
                <input type="hidden" name="storeid" value="${store.storeID}">
                <label><strong>Book Code:</strong></label>
                <input type="text" name="bookCode" required>
                <input type="submit" value="Edit Record">
            </form>
        </c:if>
            <!-- Above sends request: ConfirmEdit.jsp?storeid=___&bookCode=____ -->
        
        <table border="1">
            <thead>
                <tr>
                    <th><strong>Store</strong></th>
                    <th><strong>Book Code</strong></th>
                    <th><strong>Title</strong></th>
                    <th><strong>Retail Price</strong></th>
                    <th><strong>Quantity</strong></th>
                </tr>
            </thead>

            <c:forEach var="b" items="${inventory}">
                <tr>
                    <td>${store.storeID}</td>
                    <td>${b.bookID}</td>
                    <td>${b.title}</td>
                    <td>$${b.price}</td>
                    <td>${b.onHand}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
