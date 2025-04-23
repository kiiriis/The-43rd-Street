# 🏙️ The 43rd Street

A full-stack e-commerce web application built using **Spring Boot (Java)**, following the **MVC architecture**, with separate **User and Admin portals**, email integration, and smart handling of edge cases. Designed to simulate a real-world online retail experience with backend-driven features and a clean UI.

---

## 🛠️ Tech Stack

- 🧠 **Backend**: Spring Boot (Java)
- 🧱 **Architecture**: MVC Pattern
- 🌐 **Frontend**: HTML, CSS, JavaScript, JSP
- 📨 **Email Integration**: JavaMailSender for verification & billing
- 🛒 **Database**: MySQL
- 🌍 **Deployment**: Tomcat / Any Spring-compatible host

---

## ✨ Key Features

### 👥 User Portal
- 🔐 Register/Login with email verification
- 🛍️ Browse items, manage cart, place orders
- 📩 Receive **order confirmation and billing emails**
- ❌ Handles **out-of-stock edge cases**
- 📦 Order history and tracking

### 🛠️ Admin Portal
- 📊 Dashboard to manage products, stock, orders
- ✉️ Admin notifications and alert systems
- 🧾 Manual email resend support

### 💡 General Highlights
- 🧪 Robust input validation and exception handling
- 🔄 Smart state transitions (e.g., cart → checkout → billing)
- 📦 Built-in pagination and search support for large product lists
- 📄 Clean controller-service-repository layering

---

## 🚀 Getting Started

### 🔧 Prerequisites

Make sure you have the following installed:

- [Java JDK 17+](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
- [Maven](https://maven.apache.org/install.html)
- [MySQL Server](https://dev.mysql.com/downloads/installer/)

---

### 📥 Clone the Project

```bash
git clone https://github.com/kiiriis/The-43rd-Street.git
cd The-43rd-Street
