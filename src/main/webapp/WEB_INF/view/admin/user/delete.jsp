<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User delete ${userId}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
<div class="container mt-5">
    <div class="col-xl-12 mx-auto">
        <div class="d-flex justify-content-center">
            <h3>User Delete</h3>
        </div>
        <hr/>
        <div class="alert alert-danger" role="alert">
            Are you sure to delete this user?
        </div>
        <%--@elvariable id="userdelete" type=""--%>
        <form:form method="post" action="/admin/user/delete" modelAttribute="userdelete">
            <div class="form-group mb-3" style="display: none">
                <label class="form-label">ID</label>
                <form:input value="${userId}" path="id" type="text" class="form-control"/>
            </div>
            <button class="btn btn-danger">DELETE</button>
        </form:form>

    </div>
</div>
</body>
</html>