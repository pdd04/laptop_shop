<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manager Users</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Users</li>
                </ol>
                <div class="mt-5">
                    <div class="col-xl-12 mx-auto">
                        <div class="d-flex justify-content-between">
                            <h3>Table User</h3>
                            <a type="button" class="btn btn-success" href="/admin/user/create">Create User</a>
                        </div>
                        <hr/>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Email</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <th scope="row">${user.id}</th>
                                    <td>${user.email}</td>
                                    <td>${user.fullname}</td>
                                    <td>
                                        <a type="button" class="btn btn-success" href="/admin/user/${user.id}">View</a>
                                        <a type="button" class="btn btn-warning" href="/admin/user/update/${user.id}">Update</a>
                                        <a type="button" class="btn btn-danger" href="/admin/user/delete/${user.id}">Delete</a>
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

</body>
</html>