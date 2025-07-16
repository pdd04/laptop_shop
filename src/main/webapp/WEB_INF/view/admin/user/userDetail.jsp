<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User detail ${userId}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
<div class="container mt-5">
    <div class="col-xl-12 mx-auto">
        <div class="d-flex justify-content-center">
            <h3>User Detail</h3>
        </div>
        <hr/>
        <div class="d-flex justify-content-center">
            <div class="card" style="width: 60%;">
                <div class="card-header">
                    User Information
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">ID: ${userDetail.id}</li>
                    <li class="list-group-item">Email: ${userDetail.email}</li>
                    <li class="list-group-item">Full Name: ${userDetail.fullname}</li>
                    <li class="list-group-item">Phone: ${userDetail.phone}</li>
                    <li class="list-group-item">Address: ${userDetail.address}</li>
                </ul>
            </div>
        </div>
        <div class="mt-3 d-flex justify-content-center">
            <a href="/admin/user" class="btn btn-success">Back</a>
        </div>


    </div>
</div>
</body>
</html>