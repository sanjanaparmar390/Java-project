<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<c:set var="pageTitle" value="Products" scope="request" />
<jsp:include page="/fragments/header.jsp" />
<jsp:include page="/fragments/navbar.jsp" />

<main class="container py-4 flex-grow-1">
    <!-- Breadcrumb & Header -->
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4 pb-2 border-bottom">
        <div>
            <h2 class="fw-bold mb-1">Catalog & Products</h2>
            <p class="text-muted small mb-0">
                Showing <strong>${products.size()}</strong> of <strong>${totalProducts}</strong> available items
                <c:if test="${not empty searchQuery}">
                    for query "<strong><c:out value="${searchQuery}"/></strong>"
                </c:if>
            </p>
        </div>

        <!-- Sort Control -->
        <form action="${pageContext.request.contextPath}/products" method="get" class="d-flex align-items-center gap-2">
            <c:if test="${not empty searchQuery}">
                <input type="hidden" name="search" value="${searchQuery}">
            </c:if>
            <c:if test="${not empty selectedCategory}">
                <input type="hidden" name="category" value="${selectedCategory}">
            </c:if>
            <label for="sortSelect" class="text-nowrap small text-muted fw-semibold">Sort By:</label>
            <select id="sortSelect" name="sort" class="form-select form-select-sm rounded-pill" onchange="this.form.submit()">
                <option value="" ${empty currentSort ? 'selected' : ''}>Newest First</option>
                <option value="price_asc" ${currentSort == 'price_asc' ? 'selected' : ''}>Price: Low to High</option>
                <option value="price_desc" ${currentSort == 'price_desc' ? 'selected' : ''}>Price: High to Low</option>
                <option value="discount" ${currentSort == 'discount' ? 'selected' : ''}>Highest Discount</option>
            </select>
        </form>
    </div>

    <div class="row g-4">
        <!-- Sidebar Filters -->
        <div class="col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-3 mb-4">
                <h6 class="fw-bold text-uppercase mb-3" style="font-size: 0.85rem; letter-spacing: 0.5px;">Categories</h6>
                <div class="list-group list-group-flush small">
                    <a href="${pageContext.request.contextPath}/products" 
                       class="list-group-item list-group-item-action d-flex justify-content-between align-items-center rounded-3 ${empty selectedCategory ? 'active bg-primary text-white' : ''}">
                        All Categories
                    </a>
                    <c:forEach var="c" items="${categories}">
                        <c:url var="catUrl" value="/products">
                            <c:param name="category" value="${c.categoryId}" />
                            <c:if test="${not empty searchQuery}">
                                <c:param name="search" value="${searchQuery}" />
                            </c:if>
                        </c:url>
                        <a href="${catUrl}" 
                           class="list-group-item list-group-item-action d-flex justify-content-between align-items-center rounded-3 ${selectedCategory == c.categoryId ? 'active bg-primary text-white' : ''}">
                            ${c.name}
                        </a>
                    </c:forEach>
                </div>

                <c:if test="${not empty selectedCategory || not empty searchQuery}">
                    <div class="mt-4 pt-3 border-top">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-secondary btn-sm w-100 rounded-pill">
                            <i class="bi bi-x-circle me-1"></i> Reset Filters
                        </a>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Product Grid -->
        <div class="col-lg-9">
            <c:choose>
                <c:when test="${not empty products}">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                        <c:forEach var="p" items="${products}">
                            <tag:productCard product="${p}" />
                        </c:forEach>
                    </div>

                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <nav class="mt-5 d-flex justify-content-center">
                            <ul class="pagination pagination-sm gap-1">
                                <c:url var="prevPageUrl" value="/products">
                                    <c:param name="page" value="${currentPage - 1}" />
                                    <c:if test="${not empty selectedCategory}"><c:param name="category" value="${selectedCategory}" /></c:if>
                                    <c:if test="${not empty searchQuery}"><c:param name="search" value="${searchQuery}" /></c:if>
                                    <c:if test="${not empty currentSort}"><c:param name="sort" value="${currentSort}" /></c:if>
                                </c:url>
                                <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                    <a class="page-link rounded-circle" href="${prevPageUrl}">
                                        <i class="bi bi-chevron-left"></i>
                                    </a>
                                </li>
                                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                    <c:url var="pageNumUrl" value="/products">
                                        <c:param name="page" value="${pageNum}" />
                                        <c:if test="${not empty selectedCategory}"><c:param name="category" value="${selectedCategory}" /></c:if>
                                        <c:if test="${not empty searchQuery}"><c:param name="search" value="${searchQuery}" /></c:if>
                                        <c:if test="${not empty currentSort}"><c:param name="sort" value="${currentSort}" /></c:if>
                                    </c:url>
                                    <li class="page-item ${currentPage == pageNum ? 'active' : ''}">
                                        <a class="page-link rounded-circle" href="${pageNumUrl}">
                                            ${pageNum}
                                        </a>
                                    </li>
                                </c:forEach>
                                <c:url var="nextPageUrl" value="/products">
                                    <c:param name="page" value="${currentPage + 1}" />
                                    <c:if test="${not empty selectedCategory}"><c:param name="category" value="${selectedCategory}" /></c:if>
                                    <c:if test="${not empty searchQuery}"><c:param name="search" value="${searchQuery}" /></c:if>
                                    <c:if test="${not empty currentSort}"><c:param name="sort" value="${currentSort}" /></c:if>
                                </c:url>
                                <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                    <a class="page-link rounded-circle" href="${nextPageUrl}">
                                        <i class="bi bi-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <div class="text-center py-5 bg-white rounded-4 shadow-sm p-4">
                        <div class="fs-1 text-muted mb-3"><i class="bi bi-search"></i></div>
                        <h4 class="fw-bold">No Products Found</h4>
                        <p class="text-muted">We couldn't find any items matching your active filter criteria.</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary rounded-pill px-4 mt-2">
                            View All Products
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

<jsp:include page="/fragments/footer.jsp" />
