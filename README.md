# ☕ Java Lab Repository (`java-lab`)

A curated collection of Java laboratory assignments, socket programming, enterprise web applications, and database-driven software projects.

---

## 📂 Repository Structure

```
java-lab/
├── calculator/            # MVC-based GUI Calculator using Java Swing
├── student-registration/  # Student Registration System with JDBC & MySQL
├── serverclient/          # Client-Server Socket Communication (TCP Networking)
├── servlet/               # Jakarta / Java EE Servlet & JSP Web Application
└── shopsphere/            # Full-Stack E-Commerce System (Swing, Web, RMI, Sockets)
```

---

## 🚀 Projects Overview

### 1. 🧮 Calculator (`calculator/`)
- **Description:** A desktop calculator built using the **Model-View-Controller (MVC)** architectural pattern in Java Swing.
- **Key Components:**
  - `modelscalculator.java` — Core mathematical logic and state handling.
  - `viewcalculator.java` — Swing user interface with buttons and display.
  - `controllercalculator.java` — Action listener and event dispatcher binding View to Model.
  - `runcalculator.java` — Application bootstrap entry point.
- **How to Run:**
  ```bash
  cd calculator
  javac *.java
  java runcalculator
  ```

---

### 2. 📝 Student Registration System (`student-registration/`)
- **Description:** A database-backed CRUD application that allows registering students, validating input fields, and storing records into a MySQL database.
- **Technologies:** Java Swing/AWT, JDBC (Java Database Connectivity), MySQL (`mysql-connector-j-9.7.0.jar`).
- **How to Run:**
  ```bash
  cd student-registration
  javac -cp ".;mysql-connector-j-9.7.0.jar" StudentRegistration.java
  java -cp ".;mysql-connector-j-9.7.0.jar" StudentRegistration
  ```

---

### 3. 🌐 Server-Client Networking (`serverclient/`)
- **Description:** Real-time bidirectional socket communication between a TCP server and client using Java Networking (`java.net.Socket`, `java.net.ServerSocket`).
- **Key Components:**
  - `server.java` — TCP Server listening on a specified port.
  - `client.java` — TCP Client connecting to the server for data exchange.
- **How to Run:**
  - *Terminal 1 (Start Server):*
    ```bash
    cd serverclient
    javac server.java
    java server
    ```
  - *Terminal 2 (Start Client):*
    ```bash
    cd serverclient
    javac client.java
    java client
    ```

---

### 4. ⚡ Java Servlet Application (`servlet/`)
- **Description:** Dynamic server-side web application leveraging Java Servlets, JSP, and Apache Maven for build lifecycle management.
- **Technologies:** Java Servlets, Jakarta EE / Java EE, Maven, Apache Tomcat.
- **How to Run:**
  ```bash
  cd servlet
  mvn clean package
  ```
  Deploy the generated `.war` file to your Apache Tomcat `webapps/` directory.

---

### 5. 🛒 ShopSphere (`shopsphere/`)
- **Description:** A comprehensive enterprise-grade e-commerce application integrating multiple Java architectures:
  - **Swing Admin Panel:** Desktop backoffice for inventory and order management.
  - **Web Storefront:** Servlet/JSP web interface for customer browsing and checkout.
  - **RMI (Remote Method Invocation):** Distributed business logic.
  - **Network Sockets:** Live notification/chat service.
  - **Database:** Full MySQL schema with relational constraints.
- **How to Run:**
  Refer to [`shopsphere/README.md`](shopsphere/README.md) for full setup instructions and database migration script (`database/shopsphere.sql`).

---

## 🛠️ Prerequisites

- **Java Development Kit (JDK):** JDK 17 or higher recommended.
- **Apache Maven:** 3.8+ (for `servlet` and `shopsphere` modules).
- **MySQL Server:** 8.0+ (for `student-registration` and `shopsphere`).
- **Apache Tomcat:** 9.x or 10.x (for servlet web deployment).
- **Git:** For version control.

---

## 👨‍💻 Author

- **Name:** Shubham Nagpal
- **Email:** shubham27806@gmail.com
