<%-- 
    Document   : Manage
    Created on : Jul 15, 2021, 1:43:12 AM
    Author     : DELL
--%>

<%@page import="model.Order"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Manage Page</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <jsp:include page="header.jsp"></jsp:include>
    <%
        Account account = (Account) session.getAttribute("account");
        ArrayList<Account> listA = (ArrayList<Account>) request.getAttribute("listA");
        ArrayList<Category> listC = (ArrayList<Category>) request.getAttribute("listC");
        ArrayList<Order> listO = (ArrayList<Order>) request.getAttribute("listO");
        ArrayList<Product> listP = (ArrayList<Product>) request.getAttribute("listP");
        if (account == null || account.isIsAdmin() == false) {
    %>
    <h2>You must be admin to access this</h2>
    <% } else { %>
    <body class="masthead">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Management </div>
                        <ul class="list-group category_block">
                            <li class="list-group-item text-white " > <a class="tablinks"  onclick="openObject(event, 'Product')" style="text-decoration: none; color: black;"> Product Management </a></li>
                            <li class="list-group-item text-white " > <a class="tablinks"  onclick="openObject(event, 'Account')" style="text-decoration: none; color: black;"> Account Management </a></li>
                        </ul>
                    </div>
                </div>
                <%
                    Object mess = request.getAttribute("mess");
                    if (mess == null) {
                        mess = "";
                    }
                %>

                <!-- Form addP -->
                <div class="col-sm-6" id="AddP" name="tabcontent" style=" background-color: white; margin: 0 1%;border-radius: 2px;display: none;" >
                    <div id="content" class="row">
                        <h6 style="color: red" style="font-size: small" ><%= mess%></h6>
                        <form action="admin" method="get">
                            <div>
                                <label style="color: black;">ProductID:</label> <br>
                                <input name="pid" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">ProductName:</label><br>
                                <input name="pname" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Link image:</label><br>
                                <input name="image" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Price:</label><br>
                                <input name="price" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Quantity:</label><br>
                                <input name="quantity" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Title:</label><br>
                                <input name="title" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Description:</label><br>
                                <input name="description" type="text" required>
                            </div>

                            <div>
                                <select name="cid" aria-label="Default select example">
                                    <%
                                        for (Category c : listC) {

                                    %>
                                    <option value="<%= c.getCid()%>"> <%= c.getCname()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div>
                                <input type="submit" class="btn btn-success" value="Add Product">
                                <input type="hidden" name="service" value="addP">
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Product -->
                <div class="col-sm-6" id="Product" name="tabcontent" style=" background-color: white; margin: 0 1%;border-radius: 2px;display: block;" >
                    <div id="content" class="row">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2 style="color: black;"> Features </h2>
                                    <h3 style="color: red;" style="font-size: small" >${mess}</h3>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <!--<a  class="btn btn-success" data-toggle="modal" href="#addEmployeeModal" ><span>Add New Product</span></a>-->
                                    <a onclick="openObject(event, 'AddP')"  class="btn btn-success"  data-toggle="modal"><span>Add New Product</span></a>					
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Product</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Product p : listP) {

                                %>
                                <tr>
                                    <td><%= p.getPid()%></td>
                                    <td><%= p.getName()%></td>
                                    <td>
                                        <img width="300" height="370" class="img-fluid" src="<%= p.getImg()%>">
                                    </td>
                                    <td><%= p.getPrice()%>đ</td>
                                    <td><%= p.getQuantity()%> left</td>
                                    <td>
                                        <button class="btn btn-danger"><a style="text-decoration: none;color: black;" href="admin?service=deleteP&pid=<%= p.getPid()%>">Delete</a></button>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Account -->
                <div class="col-sm-6" id="Account" name="tabcontent" style=" background-color: white; margin: 0 1%;border-radius: 2px;display: none;" >
                    <div id="content" class="row">
                        <h6 style="color: red" style="font-size: small" ><%= mess%></h6>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Account a : listA) {

                                %>
                                <tr>
                                    <td><%= a.getUsername()%></td>
                                    <td><%= a.getPassword()%></td><td>
                                        <button class="btn btn-danger"><a style="text-decoration: none;color: black;" href="admin?service=deleteA&username=<%= a.getUsername()%>">Delete</a></button>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-6" id="Account" name="tabcontent" style=" background-color: white; margin: 0 1%;border-radius: 2px;display: none;" >
                    <div id="content" class="row">
                        <h6 style="color: red" style="font-size: small" ><%= mess%></h6>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Account a : listA) {

                                %>
                                <tr>
                                    <td><%= a.getUsername()%></td>
                                    <td><%= a.getPassword()%></td><td>
                                        <button class="btn btn-danger"><a style="text-decoration: none;color: black;" href="admin?service=deleteA&username=<%= a.getUsername()%>">Delete</a></button>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="background-color: white; box-sizing: border-box; border-radius: 2px;" class="col-sm-3">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>OrderID</th>
                                <th>Username</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Order o : listO) {

                            %>
                            <tr>
                                <td><a href ="order?oid=<%= o.getOrderid() %>"><%= o.getOrderid() %></a>
                                </td>
                                <td><%= o.getUsername() %></td>
                                <td><%= o.getTotal() %> vnđ</td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="add" method="get">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCC}" var="o">
                                            <option value="${o.cid}">${o.cname}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </body>
    <% }%>

    <script>
        function openObject(evt, Object) {
            // Declare all variables
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }

            // Show the current tab, and add an "active" class to the link that opened the tab
            document.getElementById(Object).style.display = "block";
            evt.currentTarget.className += " active";
        }
    </script>
</html>
