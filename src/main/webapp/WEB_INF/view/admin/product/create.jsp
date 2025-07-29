<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Create Product - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#imageFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#imagePreview").attr("src", imgURL);
                $("#imagePreview").css({ "display": "block" });
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
                    <li class="breadcrumb-item active"><a href="/admin/product">Product</a></li>
                    <li class="breadcrumb-item active">Create product</li>
                </ol>
                <div class="mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1>Create a product</h1>
                            <hr>
                            <%--@elvariable id="newProduct" type=""--%>
                            <form:form class="row" method="post" action="/admin/product/create" enctype="multipart/form-data"
                            modelAttribute="newProduct">
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <c:set var="errorName">
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Name</label>
                                    <form:input path="name" type="text" class="form-control ${not empty errorName ? 'is-invalid' : ''}"/>
                                    ${errorName}
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <c:set var="errorPrice">
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Price</label>
                                    <form:input path="price" type="number"
                                                class="form-control ${not empty errorPrice ? 'is-invalid' : ''}" step="0.01"/>
                                    ${errorPrice}
                                </div>
                                <div class="form-group mb-3">
                                    <c:set var="errorDetailDesc">
                                        <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Detail description</label>
                                    <form:textarea path="detailDesc"
                                                   class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}" rows="3"></form:textarea>
                                    ${errorDetailDesc}
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label class="form-label">Short description</label>
                                    <form:input path="shortDesc" type="text" class="form-control"/>
                                </div>
                                <div class="form-group mb-3">
                                    <c:set var="errorQuantity">
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Quantity</label>
                                    <form:input path="quantity" type="number"
                                                class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"/>
                                    ${errorQuantity}
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label for="factory" class="form-label">Factory</label>
                                    <form:select class="form-select" path="factory">
                                        <form:option value="Apple">Apple</form:option>
                                        <form:option value="Samsung">Samsung</form:option>
                                        <form:option value="Acer">Acer</form:option>
                                    </form:select>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <label for="target" class="form-label">Target</label>
                                    <form:select class="form-select" path="target">
                                        <form:option value="Gaming">Gaming</form:option>
                                        <form:option value="IT">IT</form:option>
                                    </form:select>
                                </div>
                                <div class="form-group mb-3 col-12 col-md-6">
                                    <c:set var="errorImage">
                                        <form:errors path="image" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="imageFile" class="form-label">Image</label>
                                    <input class="form-control
                                                    ${not empty errorImage ? 'is-invalid' : ''}" type="file" id="imageFile"
                                                    accept=".pnf, .jpg, .jpeg" name="imageFile" />
                                    ${errorImage}
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none;" alt="image preview" id="imagePreview">
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
