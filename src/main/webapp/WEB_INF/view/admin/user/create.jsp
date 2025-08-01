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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Create User - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({ "display": "block" });
            });
        });
    </script>

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
                            <form:form method="POST" action="/admin/user/create" modelAttribute= "newUser" class="row"
                            enctype="multipart/form-data">
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Email address</label>
                                    <form:input path="email" type="email"
                                                class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"/>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    ${errorEmail}
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Password</label>
                                    <form:input path="password" type="password"
                                                class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"/>
                                    ${errorPassword}
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label class="form-label">Phone</label>
                                    <form:input path="phone" type="number" class="form-control"/>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <c:set var="errorName">
                                        <form:errors path="fullname" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Full name</label>
                                    <form:input path="fullname" type="text"
                                                class="form-control ${not empty errorName ? 'is-invalid' : ''}"/>
                                    ${errorName}
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
                                    <label for="avatarFile" class="form-label">Avatar</label>
                                    <input class="form-control" type="file" id="avatarFile"
                                    accept=".pnf, .jpg, .jpeg" name="avatarFile"/>
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview">
                                </div>
                                <div class="col-12 mb-5">
                                <button type="submit" class="btn btn-primary mb-3">Submit</button>
                                </div>

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
