<%-- 
    Document   : ViewInventory
    Created on : Oct 31, 2025, 11:13:49 PM
    Author     : Heather Ward
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="business.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<%
    User u = (User) session.getAttribute("u");
    if (u == null) {
        response.sendRedirect("HBLogon.jsp");
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Henry Books Inventory System</title>
    </head>
    <body>
        <h1>Inventory View/Update</h1>
        <p>
            User: ${u.userID} - ${u.userName}, ${u.adminLevel} permissions
        </p>
        Store: 
        <form action="InvDetails" method="post">
            <select id="storeid" name="storeid">
                <c:forEach var="st" items="${storeList}">
                    <option value="${st.storeID}"
                        <c:if test="${st.storeID == u.storeID}">selected</c:if>>
                        ${st.storeName}
                    </option>
                </c:forEach>
            </select>
            <button type="button" id="loadButton">View/Edit Inventory</button>
        </form>
        <br><br>
        <div id="inventoryTable">
            <!-- JSP content loaded via AJAX goes here -->
        </div>
        
        <script>
            const storeSelect = document.getElementById("storeid");
            const invTable = document.getElementById("inventoryTable");
            const loadButton = document.getElementById("loadButton");
            
            function loadInvTable(storeId) {
                fetch('InvDetails?storeid=' + storeId)
                    .then(response => {
                        if (!response.ok) throw new Error("Network response was not ok");
                        return response.text();
                })
                    .then(html => {
                        invTable.innerHTML = html;
                
                })
                    .catch(error => {
                        invTable.innerHTML = '<p><strong>Error loading table: ' + error + '</strong></p>';
                });
            }
            
            loadButton.addEventListener('click', () => {
                const storeId = storeSelect.value;
                if (storeId) {
                    loadInvTable(storeId);
                } else {
                    invTable.innerHTML = '<p><strong>Please select a store</strong></p>';
                };
            });
        </script>
    </body>
</html>
