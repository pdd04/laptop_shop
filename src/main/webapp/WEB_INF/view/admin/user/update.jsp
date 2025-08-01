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
    <title>Update User - SB Admin</title>
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
                <h1 class="mt-4">Update Users</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/user">Users</a></li>
                    <li class="breadcrumb-item active">Update User</li>
                </ol>
                <div class="mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1>User Update</h1>
                            <hr>
                            <%--@elvariable id="newUser" type=""--%>
                            <form:form method="POST" action="/admin/user/update" modelAttribute= "newUser" enctype="multipart/form-data">
                                <div class="form-group mb-3" style="display: none">
                                    <label class="form-label">ID</label>
                                    <form:input path="id" type="text" class="form-control"/>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">Email address</label>
                                    <form:input path="email" type="email" class="form-control" disabled="true"/>
                                    <small id="emailHelp" class="form-text text-muted" >We'll never share your email with anyone else.</small>
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
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label for="role" class="form-label">Role</label>
                                    <form:select class="form-select" path="role.name">
                                        <form:option value="ADMIN">Admin</form:option>
                                        <form:option value="USER">User</form:option>
                                    </form:select>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label for="avatarFileUpdate" class="form-label">Avatar</label>
                                    <input class="form-control" type="file" id="avatarFileUpdate"
                                           accept=".pnf, .jpg, .jpeg" name="avatarFileUpdate"/>
                                </div>
                                <button type="submit" class="btn btn-warning mb-3">Update</button>
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

