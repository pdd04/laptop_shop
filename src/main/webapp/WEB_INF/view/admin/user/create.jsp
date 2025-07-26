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
    <title>Create User - SB Admin</title>
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
                <h1 class="mt-4">Create User</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/user">Users</a></li>
                    <li class="breadcrumb-item active">Create user</li>
                </ol>
                <div class="mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1>Create a user</h1>
                            <hr>
                            <%--@elvariable id="newUser" type=""--%>
                            <form:form method="POST" action="/admin/user/create/success" modelAttribute= "newUser">
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
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

</body>
</html>
