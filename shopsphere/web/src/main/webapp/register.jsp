<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitle" value="Create Account" scope="request" />
<jsp:include page="/fragments/header.jsp" />
<jsp:include page="/fragments/navbar.jsp" />

<main class="container py-5 flex-grow-1 d-flex align-items-center justify-content-center">
    <div class="col-12 col-md-8 col-lg-6">
        <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5 bg-white">
            <div class="text-center mb-4">
                <div class="brand-icon d-inline-flex align-items-center justify-content-center rounded-3 bg-gradient-primary mb-3">
                    <i class="bi bi-person-plus text-white fs-4"></i>
                </div>
                <h2 class="fw-bold text-dark">Create Your Account</h2>
                <p class="text-muted small">Join ShopSphere to access member deals & order tracking</p>
            </div>

            <!-- Error Alerts -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show small py-2 mb-3" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-1"></i> ${errorMessage}
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label for="name" class="form-label small fw-semibold text-muted">Full Name</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-person text-muted"></i></span>
                        <input type="text" id="name" name="name" class="form-control border-start-0" 
                               value="${nameVal != null ? nameVal : ''}" placeholder="e.g. Rahul Sharma" required>
                    </div>
                </div>

                <div class="row g-2 mb-3">
                    <div class="col-md-7">
                        <label for="email" class="form-label small fw-semibold text-muted">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-envelope text-muted"></i></span>
                            <input type="email" id="email" name="email" class="form-control border-start-0" 
                                   value="${emailVal != null ? emailVal : ''}" placeholder="name@domain.com" required>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label for="mobile" class="form-label small fw-semibold text-muted">Phone Number</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-telephone text-muted"></i></span>
                            <input type="tel" id="mobile" name="mobile" class="form-control border-start-0" 
                                   value="${mobileVal != null ? mobileVal : ''}" placeholder="9812345678">
                        </div>
                    </div>
                </div>

                <div class="row g-2 mb-4">
                    <div class="col-md-6">
                        <label for="password" class="form-label small fw-semibold text-muted">Password</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-lock text-muted"></i></span>
                            <input type="password" id="password" name="password" class="form-control border-start-0" 
                                   placeholder="Min 6 characters" minlength="6" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="confirmPassword" class="form-label small fw-semibold text-muted">Confirm Password</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-lock-fill text-muted"></i></span>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control border-start-0" 
                                   placeholder="Repeat password" minlength="6" required>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100 rounded-pill py-2 fw-bold shadow-sm">
                    Complete Registration
                </button>
            </form>

            <div class="mt-4 text-center">
                <span class="text-muted small">Already registered?</span>
                <a href="${pageContext.request.contextPath}/login" class="text-primary fw-semibold text-decoration-none small ms-1">
                    Sign In
                </a>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/fragments/footer.jsp" />
