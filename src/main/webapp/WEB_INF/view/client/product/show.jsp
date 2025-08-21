<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--set type cua page la html--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--dua thu vien core cua jstl vao jsp--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--thư viện để format giá tiền--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laptop Shop</title>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">

</head>
<body>

<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

<jsp:include page="../layout/header.jsp"/>

<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="row g-4">
                    <div class="col-lg-4">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="mb-3" id="factoryFilter">
                                    <div class="mb-2">
                                        <b>Hãng sản xuất</b>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="DELL" id="factory-1">
                                        <label class="form-check-label" for="factory-1">
                                            DELL
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="ASUS" id="factory-2">
                                        <label class="form-check-label" for="factory-2">
                                            ASUS
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="HP" id="factory-3">
                                        <label class="form-check-label" for="factory-3">
                                            HP
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="MSI" id="factory-4">
                                        <label class="form-check-label" for="factory-4">
                                            MSI
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="LENOVO" id="factory-5">
                                        <label class="form-check-label" for="factory-5">
                                            LENOVO
                                        </label>
                                    </div>
                                </div>
                                <div class="mb-3" id="targetFilter">
                                    <div class="mb-2">
                                        <b>Mục đích sử dụng</b>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Văn phòng" id="target-1">
                                        <label class="form-check-label" for="target-1">
                                            VĂN PHÒNG
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Gaming" id="factory-2">
                                        <label class="form-check-label" for="factory-2">
                                            GAMING
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Thiết kế đồ họa" id="target-3">
                                        <label class="form-check-label" for="target-3">
                                            THIẾT KẾ ĐỒ HỌA
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Học tập" id="target-4">
                                        <label class="form-check-label" for="target-4">
                                            HỌC TẬP
                                        </label>
                                    </div>
                                </div>
                                <div class="mb-2">
                                    <button class="btn border-secondary px-4 py-3 rounded-pill text-primary w-50" type="button" id="btnFilter">
                                        Lọc sản phẩm
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="row g-4 justify-content-center">
                            <c:if test="${totalPages == 0}" >
                                <div>Không tìm thấy sản phẩm</div>
                            </c:if>
                            <c:forEach var="product" items="${products}">
                            <div class="col-md-6 col-lg-6 col-xl-4">
                                <div class="rounded position-relative fruite-item">
                                    <div class="fruite-img">
                                        <img src="/images/product/${product.image}" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Laptop</div>
                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                        <h4 style="font-size: 15px">
                                            <a href="/product/${product.id}">
                                                    ${product.name}
                                            </a>

                                        </h4>
                                        <p style="font-size: 13px">${product.shortDesc}</p>
                                        <div class="d-flex flex-lg-wrap justify-content-center flex-column">
                                            <p class="text-dark fw-bold mb-3"
                                               style="font-size: 15px; text-align: center; width: 100%;">
                                                <fmt:formatNumber type="number" value="${product.price}"/> đ
                                            </p>
                                            <form action="/add-product-to-cart/${product.id}" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                <button class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <div class="col-12">
                                <c:if test="${totalPages > 0}" >
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <li class="page-item rounded" style="${currentPage eq 1 ? "display:none" : ""}">
                                        <a class="page-link" href="/products?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                        <li class="page-item rounded" style="${totalPages eq 1 ? "display:none" : ""}">
                                            <a class="page-link ${currentPage eq (loop.index + 1) ? "active" : ""}" href="/products?page=${loop.index + 1}">
                                                    ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item rounded" style="${currentPage eq totalPages ? "display:none" : ""}">
                                        <a class="page-link" href="/products?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fruits Shop End-->

<jsp:include page="../layout/footer.jsp"/>

<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>
</html>