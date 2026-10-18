<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitle" value="My Profile" scope="request" />
<jsp:include page="/fragments/header.jsp" />
<jsp:include page="/fragments/navbar.jsp" />

<main class="container py-4 flex-grow-1">
    <div class="mb-4 pb-2 border-bottom">
        <h2 class="fw-bold mb-1">Account & Preferences</h2>
        <p class="text-muted small mb-0">Manage personal credentials, security, and shipping destinations</p>
    </div>

    <div class="row g-4">
        <!-- Profile Card & Quick Stats -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 p-4 text-center bg-white mb-4">
                <div class="avatar-circle bg-primary text-white fw-bold mx-auto mb-3" style="width: 72px; height: 72px; font-size: 1.8rem;">
                    ${sessionScope.user.name.substring(0, 1).toUpperCase()}
                </div>
                <h5 class="fw-bold mb-1">${sessionScope.user.name}</h5>
                <p class="text-muted small mb-3">${sessionScope.user.email}</p>
                <div class="d-flex justify-content-center gap-2 mb-3">
                    <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-1 rounded-pill">${sessionScope.user.role}</span>
                    <span class="badge bg-success bg-opacity-10 text-success px-3 py-1 rounded-pill">Active Account</span>
                </div>
                <div class="border-top pt-3 text-muted small">
                    Member since <fmt:formatDate value="${sessionScope.user.createdAt}" pattern="MMMM yyyy" />
                </div>
            </div>

            <!-- Saved Addresses -->
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-white">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="fw-bold mb-0">Delivery Addresses (${addresses.size()})</h6>
                    <button class="btn btn-outline-primary btn-sm rounded-pill" data-bs-toggle="collapse" data-bs-target="#newAddressCollapse">
                        + Add
                    </button>
                </div>

                <!-- Add Address Collapse Form -->
                <div class="collapse mb-3" id="newAddressCollapse">
                    <form action="${pageContext.request.contextPath}/profile" method="post" class="p-3 bg-light rounded-3">
                        <input type="hidden" name="action" value="addAddress">
                        <div class="mb-2">
                            <input type="text" name="addressLine" class="form-control form-control-sm" placeholder="Street Address" required>
                        </div>
                        <div class="row g-1 mb-2">
                            <div class="col-6">
                                <input type="text" name="city" class="form-control form-control-sm" placeholder="City" required>
                            </div>
                            <div class="col-6">
                                <input type="text" name="pincode" class="form-control form-control-sm" placeholder="PIN" required>
                            </div>
                        </div>
                        <div class="mb-2">
                            <select name="addressType" class="form-select form-select-sm">
                                <option value="HOME">Home</option>
                                <option value="WORK">Work / Office</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm rounded-pill w-100 fw-bold">Save Address</button>
                    </form>
                </div>

                <div class="d-flex flex-column gap-2">
                    <c:forEach var="addr" items="${addresses}">
                        <div class="p-3 border rounded-3 bg-light position-relative">
                            <span class="badge bg-secondary mb-1">${addr.addressType}</span>
                            <div class="small fw-semibold text-dark">${addr.addressLine}</div>
                            <div class="text-muted" style="font-size: 0.75rem;">${addr.city}, ${addr.state} - ${addr.pincode}</div>
                            
                            <form action="${pageContext.request.contextPath}/profile" method="post" class="position-absolute top-0 end-0 m-2">
                                <input type="hidden" name="action" value="deleteAddress">
                                <input type="hidden" name="addressId" value="${addr.addressId}">
                                <button type="submit" class="btn btn-link text-danger p-0" title="Delete address">
                                    <i class="bi bi-x"></i>
                                </button>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Personal Info & Security Tabs -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-white mb-4">
                <h5 class="fw-bold mb-3">Edit Profile Information</h5>
                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <input type="hidden" name="action" value="updateInfo">
                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Full Name</label>
                            <input type="text" name="name" class="form-control" value="${sessionScope.user.name}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Phone Number</label>
                            <input type="tel" name="mobile" class="form-control" value="${sessionScope.user.mobile}">
                        </div>
                        <div class="col-12">
                            <label class="form-label small fw-semibold">Email Address (Read-only)</label>
                            <input type="email" class="form-control bg-light" value="${sessionScope.user.email}" readonly disabled>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary rounded-pill px-4 fw-bold">Update Profile</button>
                </form>
            </div>

            <!-- Change Password -->
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-white">
                <h5 class="fw-bold mb-3">Change Security Password</h5>
                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <input type="hidden" name="action" value="changePassword">
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Current Password</label>
                        <input type="password" name="currentPassword" class="form-control" required>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">New Password</label>
                            <input type="password" name="newPassword" class="form-control" minlength="6" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Confirm New Password</label>
                            <input type="password" name="confirmPassword" class="form-control" minlength="6" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-primary rounded-pill px-4 fw-bold">Save New Password</button>
                </form>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/fragments/footer.jsp" />
