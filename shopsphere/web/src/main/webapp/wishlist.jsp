<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitle" value="My Wishlist" scope="request" />
<jsp:include page="/fragments/header.jsp" />
<jsp:include page="/fragments/navbar.jsp" />

<main class="container py-4 flex-grow-1">
    <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
        <div>
            <h2 class="fw-bold mb-1">My Saved Wishlist</h2>
            <p class="text-muted small mb-0">Items you marked to purchase later</p>
        </div>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-secondary btn-sm rounded-pill">
            Explore More Products
        </a>
    </div>

    <c:choose>
        <c:when test="${not empty wishlist}">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                <c:forEach var="w" items="${wishlist}">
                    <div class="col">
                        <div class="card h-100 product-card shadow-sm border-0 position-relative">
                            <form action="${pageContext.request.contextPath}/wishlist" method="post" class="position-absolute top-0 end-0 m-2" style="z-index: 2;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productId" value="${w.productId}">
                                <button type="submit" class="btn btn-light btn-sm rounded-circle shadow-sm" title="Remove from wishlist">
                                    <i class="bi bi-x text-danger fw-bold"></i>
                                </button>
                            </form>

                            <a href="${pageContext.request.contextPath}/product-details?id=${w.productId}" class="text-decoration-none">
                                <div class="product-img-wrapper">
                                    <img src="${w.product.imageUrl}" class="card-img-top product-img" alt="${w.product.name}" 
                                         onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&auto=format&fit=crop&q=80';">
                                </div>
                            </a>

                            <div class="card-body d-flex flex-column p-3">
                                <span class="text-muted text-uppercase fw-semibold" style="font-size: 0.75rem;">${w.product.brand}</span>
                                <h6 class="card-title fw-bold mb-2 text-truncate-2">
                                    <a href="${pageContext.request.contextPath}/product-details?id=${w.productId}" class="text-dark text-decoration-none">
                                        ${w.product.name}
                                    </a>
                                </h6>

                                <div class="mt-auto pt-2">
                                    <div class="d-flex align-items-baseline gap-2 mb-3">
                                        <span class="fs-5 fw-bold text-primary">₹${w.product.discountedPrice}</span>
                                        <c:if test="${w.product.discount > 0}">
                                            <span class="text-muted text-decoration-line-through small">₹${w.product.price}</span>
                                        </c:if>
                                    </div>

                                    <form action="${pageContext.request.contextPath}/cart" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="productId" value="${w.productId}">
                                        <input type="hidden" name="quantity" value="1">
                                        <button type="submit" class="btn btn-primary btn-sm rounded-pill w-100 fw-bold">
                                            <i class="bi bi-cart-plus me-1"></i> Move to Cart
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="card border-0 shadow-sm rounded-4 p-5 text-center bg-white my-4">
                <div class="fs-1 text-muted mb-3"><i class="bi bi-heart"></i></div>
                <h4 class="fw-bold mb-2">Your Wishlist is Empty</h4>
                <p class="text-muted mb-4">Save products you love so you can easily purchase them in the future.</p>
                <div>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary rounded-pill px-4 py-2 fw-semibold">
                        Discover Catalog
                    </a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<jsp:include page="/fragments/footer.jsp" />
