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
        <div class="row">
        <div class="col-md-6 col-12 mx-auto">
        <h1>Create a user</h1>
        <hr>
        <%--@elvariable id="newUser" type=""--%>
        <form:form method="POST" action="/admin/user/create" modelAttribute= "newUser">
            <div class="form-group mb-3">
                <label class="form-label">Email address</label>
                <form:input path="email" type="email" class="form-control"/>
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group mb-3">
                <label class="form-label">Password</label>
                <form:input path="password" type="password" class="form-control"/>
            </div>
            <div class="form-group mb-3">
                <label class="form-label">Phone</label>
                <form:input path="phone" type="number" class="form-control"/>
            </div>
            <div class="form-group mb-3">
                <label class="form-label">Full name</label>
                <form:input path="fullname" type="text" class="form-control"/>
            </div>
            <div class="form-group mb-3">
                <label class="form-label">Address</label>
                <form:input path="address" type="text" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary mb-3">Submit</button>
        </form:form>
        </div>
        </div>
    </div>
</body>
</html>