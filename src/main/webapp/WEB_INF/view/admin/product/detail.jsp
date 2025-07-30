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
    <title>User Detail - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(() => {
            const orgImage = "${productDetail.image}";
            if (orgImage) {
                const urlImage = "/images/product/" + orgImage;
                $("#imagePreview").attr("src", urlImage);
                $("#imagePreview").css({ "display": "block" });
            }
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
                <h1 class="mt-4">User Detail</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/product">Products</a></li>
                    <li class="breadcrumb-item active">Product Detail</li>
                </ol>
                <div class="mt-5">
                    <div class="col-xl-12 mx-auto">
                        <div class="d-flex justify-content-center">
                            <h3>Product Detail</h3>
                        </div>
                        <div class="d-flex justify-content-center mt-3">
                            <div class="card" style="width: 60%;">
                                <div class="card-header">
                                    Product Information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">ID: ${productDetail.id}</li>
                                    <li class="list-group-item">Name: ${productDetail.name}</li>
                                    <li class="list-group-item">Price: ${productDetail.price}</li>
                                    <li class="list-group-item">Detail Description: ${productDetail.detailDesc}</li>
                                    <li class="list-group-item">Short Description: ${productDetail.shortDesc}</li>
                                    <li class="list-group-item">Quantity: ${productDetail.quantity}</li>
                                    <li class="list-group-item">Sold: ${productDetail.sold}</li>
                                    <li class="list-group-item">Factory: ${productDetail.factory}</li>
                                    <li class="list-group-item">Target: ${productDetail.target}</li>
                                    <li class="list-group-item"><img style="max-height: 250px; display: none;" alt="image preview" id="imagePreview"></li>
                                </ul>
                            </div>
                        </div>
                        <div class="mt-3 d-flex justify-content-center">
                            <a href="/admin/product" class="btn btn-success">Back</a>
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

