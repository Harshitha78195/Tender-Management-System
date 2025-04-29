## Tender Management System

##  Overview
The **Online Tender System** is a web-based platform built using JSP and PostgreSQL that enables users to view, bid on, and manage tenders. It also provides administrators with tools to post tenders and manage bids. The goal is to streamline the public tendering process, increase transparency, and promote participation.

---

## Version Information

- **IDE:** Apache NetBeans 22  
- **Server:** Apache Tomcat 11.0.0  
- **Java:** JDK 20  
- **Database Connector:** PostgreSQL JDBC Driver 42.7.4  

---

##  Features

### User Login & Role-Based Access
- Secure login for registered users.
- Role-based redirection to `dashboard.jsp` for both users and admins.

### Tender Viewing and Bidding
- View available tenders on `viewTenders.jsp`.
- Detailed tender information: description, deadline, and requirements.
- Place bids through `placeBid.jsp`.

### Admin Tender & Bid Management
- Admins can add new tenders via `addTender.jsp`.
- Bids are monitored and managed through `manageBids.jsp`.

### Inbox and Navigation
- Notifications and bid updates available in user dashboards.
- Seamless navigation between `viewTenders.jsp`, `placeBid.jsp`, and `dashboard.jsp`.

---

## Technology Stack

| Layer       | Technology                     |
|-------------|-------------------------------|
| Frontend    | HTML, CSS                     |
| Backend     | JSP (JavaServer Pages)         |
| Database    | PostgreSQL                     |
| Server      | Apache Tomcat 11               |
| IDE         | Apache NetBeans 22             |

---

## Project Structure

### JSP Pages
- `index.jsp` – Landing page  
- `login.jsp` – User authentication  
- `register.jsp` – New user registration  
- `viewTenders.jsp` – List of tenders  
- `placeBid.jsp` – Submit a bid  
- `dashboard.jsp` – Role-based dashboard  
- `addTender.jsp` – Admin tender management  
- `manageBids.jsp` – Admin bid management  
- `error.jsp` – Error display

### 🔌 Database Connection
- A dedicated `DatabaseConnection.java` (or similar) class handles all PostgreSQL interactions including secure connections, queries, and transactions.

---

##  User Flow

1. **Login**
   - Users authenticate via `login.jsp`.
   - Redirected to `dashboard.jsp` upon successful login.

2. **Tender Interaction**
   - View tenders → `viewTenders.jsp`
   - Place bids → `placeBid.jsp`

3. **Admin Workflow**
   - Add tenders → `addTender.jsp`
   - Manage bids → `manageBids.jsp`

4. **Shared Dashboard**
   - `dashboard.jsp` renders different content for users and admins based on role.

---

##  Database Setup

Ensure PostgreSQL is installed and create necessary tables:
- `users` – Stores user details and roles.
- `tenders` – Stores tender information.
- `bids` – Tracks bids submitted by users.

Example connection configuration:
```java
String url = "jdbc:postgresql://localhost:5432/tenderdb";
String user = "your_username";
String password = "your_password";
