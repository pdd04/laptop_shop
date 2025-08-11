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
                <h1 class="mt-4">Orders</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/order">Orders</a></li>
                    <li class="breadcrumb-item active">Orders Detail</li>
                </ol>
                <div class="mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1>Update a order</h1>
                            <hr>
                            <%--@elvariable id="order" type=""--%>
                            <form:form class="row" method="POST" action="/admin/order/update" enctype="multipart/form-data"
                                       modelAttribute="order">
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label class="form-label">Id</label>
                                    <form:input path="id" type="text" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6" style="display: none">
                                    <label class="form-label">Id</label>
                                    <form:input path="id" type="text" class="form-control"/>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label class="form-label">Price</label>
                                    <form:input path="totalPrice" type="number" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label class="form-label">User</label>
                                    <form:input path="user.role.name" type="text" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label for="status" class="form-label">Status</label>
                                    <form:select class="form-select" path="status">
                                        <form:option value="PENDING">PENDING</form:option>
                                        <form:option value="SHIPPING">SHIPPING</form:option>
                                        <form:option value="COMPLETE">COMPLETE</form:option>
                                        <form:option value="CANCEL">CANCEL</form:option>
                                    </form:select>
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
        <div class="mt-3 d-flex justify-content-center">
            <a href="/admin/order" class="btn btn-success">Back</a>
        </div>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>
</html>
