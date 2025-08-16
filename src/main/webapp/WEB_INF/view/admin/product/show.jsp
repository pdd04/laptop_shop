<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <h1 class="mt-4">Manager Product</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Products</li>
                </ol>
                <div class="mt-5">
                    <div class="col-xl-12 mx-auto">
                        <div class="d-flex justify-content-between">
                            <h3>Table Product</h3>
                            <a type="button" class="btn btn-success" href="/admin/product/create">Create Product</a>
                        </div>
                        <hr/>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Factory</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <th scope="row">${product.id}</th>
                                    <td>${product.name}</td>
                                    <td>${product.price}</td>
                                    <td>${product.factory}</td>
                                    <td>
                                        <a type="button" class="btn btn-success" href="/admin/product/${product.id}">View</a>
                                        <a type="button" class="btn btn-warning" href="/admin/product/update/${product.id}">Update</a>
                                        <a type="button" class="btn btn-danger" href="/admin/product/delete/${product.id}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item" style="${currentPage eq 1 ? "display:none" : ""}">
                                    <a class="page-link" href="/admin/product?page=${currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                <li class="page-item" style="${totalPages eq 1 ? "display:none" : ""}">
                                    <a class="page-link ${currentPage eq (loop.index + 1) ? "active" : ""}" href="/admin/product?page=${loop.index + 1}">
                                        ${loop.index + 1}
                                    </a>
                                </li>
                                </c:forEach>
                                <li class="page-item" style="${currentPage eq totalPages ? "display:none" : ""}">
                                    <a class="page-link" href="/admin/product?page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
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
