<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--thư viện để format giá tiền--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manager Orders</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Orders</li>
                </ol>
                <div class="mt-5">
                    <div class="col-xl-12 mx-auto">
                        <div class="d-flex justify-content-between">
                            <h3>Table Orders</h3>
                        </div>
                        <hr/>
                        <table class="table table-hover">
                            <thead>
                            <tr class="row">
                                <th scope="col" class="col">Id</th>
                                <th scope="col" class="col">Total Price</th>
                                <th scope="col" class="col">User</th>
                                <th scope="col" class="col">Status</th>
                                <th scope="col" class="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr class="row">
                                    <th scope="row" class="col">${order.id}</th>
                                    <td class="col">
                                        <fmt:formatNumber type="number" value="${order.totalPrice}"/> đ
                                    </td>
                                    <td class="col">${order.user.fullname}</td>
                                    <td class="col">${order.status}</td>
                                    <td class="col">
                                        <a type="button" class="btn btn-success" href="/admin/order/${order.id}">View</a>
                                        <a type="button" class="btn btn-warning" href="/admin/order/update/${order.id}">Update</a>
                                        <a type="button" class="btn btn-danger" href="/admin/order/delete/${order.id}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>
</html>
