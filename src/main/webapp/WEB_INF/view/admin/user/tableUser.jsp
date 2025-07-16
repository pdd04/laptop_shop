<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
    <div class="container mt-5">
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
                        <button type="button" class="btn btn-warning">Update</button>
                        <button type="button" class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>