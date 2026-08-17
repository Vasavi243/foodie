# 🍔 Foodie — Online Food Delivery Web Application

**Foodie** is a full-stack online food delivery web application developed using **Java Servlets, JSP, JDBC, MySQL, HTML, CSS and JavaScript**.

The application provides separate **Customer** and **Admin** modules. Customers can register, log in, browse restaurants and menus, add food items to a cart, checkout, place orders and track order status. Administrators can manage restaurants, menus and customer orders.

---

## 📸 Screenshots

### 🏠 Home Page

![Foodie Home Page](src/main/webapp/https_foodexpress_demo.png)

### 🔐 Login & Registration

> Add your login screenshot here.

```text
screenshots/login.png
```

### 🍽️ Restaurants & Menu

> Add your restaurant/menu screenshot here.

```text
screenshots/restaurants.png
screenshots/menu.png
```

### 🛒 Shopping Cart

> Add your cart screenshot here.

```text
screenshots/cart.png
```

### 💳 Checkout

> Add your checkout screenshot here.

```text
screenshots/checkout.png
```

### 📦 Order Tracking

> Add your order-tracking screenshot here.

```text
screenshots/order-tracking.png
```

### 👨‍💼 Admin Dashboard

> Add your admin dashboard screenshot here.

```text
screenshots/admin-dashboard.png
```

---

## ✨ Features

### 👤 Customer Module

* User registration
* User login and logout
* Session-based authentication
* Browse restaurants
* Search restaurants
* View restaurant details
* Browse food menus
* Filter food using categories
* Add food items to cart
* Update cart quantities
* Remove items from cart
* Checkout and order placement
* Automatic bill calculation
* Delivery charge calculation
* Packaging charge calculation
* GST calculation
* Order confirmation
* Order history
* Order tracking
* User profile
* Contact and help pages

### 👨‍💼 Admin Module

* Admin login
* Admin dashboard
* Restaurant management
* Create restaurant
* Edit restaurant
* Menu management
* Add food items
* Edit food items
* Manage menu items
* View customer orders
* Update order status
* View revenue information
* Admin profile

### 📦 Order Management

The order status can progress through different stages:

```text
PLACED
   ↓
CONFIRMED
   ↓
PREPARING
   ↓
OUT FOR DELIVERY
   ↓
DELIVERED
```

Orders can also be cancelled when applicable.

---

## 🛠️ Technologies Used

| Technology           | Purpose                                 |
| -------------------- | --------------------------------------- |
| **Java**             | Backend programming                     |
| **Servlets**         | Request processing and controller logic |
| **JSP**              | Dynamic web pages                       |
| **JDBC**             | Database connectivity                   |
| **MySQL**            | Database management                     |
| **HTML5**            | Web page structure                      |
| **CSS3**             | Styling and responsive UI               |
| **JavaScript**       | Client-side functionality               |
| **Apache Tomcat 10** | Web application server                  |
| **Eclipse**          | Development IDE                         |
| **Git & GitHub**     | Version control                         |

---

## 🏗️ Architecture

The project follows an **MVC-style architecture combined with the DAO design pattern**.

```text
                    ┌─────────────────────┐
                    │       Browser       │
                    │   HTML / CSS / JS   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       JSP Pages     │
                    │     Presentation     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      Servlets       │
                    │     Controllers     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       DAO Layer     │
                    │ Database Operations │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       MySQL         │
                    │      Database       │
                    └─────────────────────┘
```

### Layer Responsibilities

**JSP / HTML / CSS / JavaScript**

* User interface
* Forms
* Restaurant and menu display
* Cart and checkout pages

**Servlets**

* Receive HTTP requests
* Validate input
* Manage sessions
* Call DAO methods
* Control application flow

**DAO Layer**

* Performs database operations
* Separates SQL/database logic from Servlets
* Handles CRUD operations

**Model Layer**

* Represents application entities such as users, restaurants, menu items and orders.

**MySQL**

* Stores users, restaurants, menus, carts/orders and related application data.

---

## 🔄 Project Flow

### Customer Flow

```text
Register
   ↓
Login
   ↓
Home Page
   ↓
Search / Browse Restaurants
   ↓
Select Restaurant
   ↓
View Menu
   ↓
Add Food to Cart
   ↓
View Cart
   ↓
Checkout
   ↓
Place Order
   ↓
Order Confirmation
   ↓
Track Order
   ↓
Order Delivered
```

### Admin Flow

```text
Admin Login
     ↓
Admin Dashboard
     ↓
 ┌──────────────┬──────────────┬──────────────┐
 │              │              │              │
Restaurant    Menu           Orders        Revenue
Management    Management     Management     Details
 │              │              │
 ▼              ▼              ▼
Create/Edit    Add/Edit       Update
Restaurant     Food Items     Order Status
```

---

## 🗄️ Database

The application uses **MySQL** as the relational database.

### Database

```text
tap_food
```

### Main Tables

| Table        | Purpose                                     |
| ------------ | ------------------------------------------- |
| `user`       | Stores customer/user information            |
| `restuarant` | Stores restaurant information               |
| `menu`       | Stores restaurant food/menu items           |
| `ordertable` | Stores order information                    |
| `orderitem`  | Stores individual items belonging to orders |

### Basic Relationship

```text
USER
 │
 │ places
 ▼
ORDERTABLE
 │
 │ contains
 ▼
ORDERITEM
 │
 │ references
 ▼
MENU
 │
 │ belongs to
 ▼
RESTAURANT
```

The application uses JDBC to communicate between the Java application and MySQL database.

---

## 💰 Checkout Calculation

The checkout page calculates the final amount using:

```text
Item Total
     +
Delivery Charge
     +
Packaging Charge
     +
GST
     =
Final Order Total
```

The application currently uses a **5% GST calculation**, along with delivery and packaging charges configured by the application.

---

## 📁 Project Structure

The project follows the standard Java web application structure:

```text
foodie/
│
├── src/
│   └── main/
│       │
│       ├── java/
│       │   └── com/
│       │       ├── food/
│       │       └── tap/
│       │           ├── dao/
│       │           ├── daoimpl/
│       │           ├── model/
│       │           ├── servlet/
│       │           └── ...
│       │
│       └── webapp/
│           │
│           ├── WEB-INF/
│           ├── images/
│           ├── categories_images/
│           ├── final_images/
│           ├── payements/
│           │
│           ├── login.html
│           ├── register.html
│           ├── menu.jsp
│           ├── cart.jsp
│           ├── checkout.jsp
│           ├── order-history.jsp
│           ├── track-order.jsp
│           │
│           ├── adminLogin.jsp
│           ├── dashboard.jsp
│           ├── adminMenu.jsp
│           ├── adminOrder.jsp
│           ├── addMenu.jsp
│           ├── editMenu.jsp
│           ├── revenue.jsp
│           └── ...
│
├── .classpath
├── .project
└── README.md
```

The repository currently contains the customer-facing JSP pages, admin pages, image assets and other web resources under `src/main/webapp`.

---

## 🚀 How to Run the Project

### 1. Prerequisites

Install the following:

* Java JDK
* Eclipse IDE for Enterprise Java/Web Development
* Apache Tomcat 10
* MySQL Server
* MySQL Workbench
* Git
* MySQL Connector/J

---

### 2. Clone the Repository

```bash
git clone https://github.com/Vasavi243/foodie.git
```

Then open the project in Eclipse.

---

### 3. Configure MySQL

Start MySQL Server and create the database:

```sql
CREATE DATABASE tap_food;
```

Create/import the required tables:

```text
user
restuarant
menu
ordertable
orderitem
```

Make sure the database credentials in your Java database connection class match your local MySQL configuration.

Example:

```java
String url = "jdbc:mysql://localhost:3306/tap_food";
String username = "root";
String password = "your_password";
```

> Replace `your_password` with your local MySQL password.

---

### 4. Add MySQL Connector

Add the **MySQL Connector/J** library to the project.

Make sure the connector JAR is available to the web application, typically under:

```text
WEB-INF/lib
```

---

### 5. Configure Apache Tomcat

In Eclipse:

```text
Servers
   ↓
New Server
   ↓
Apache Tomcat 10
```

Add the Foodie project to the Tomcat server.

---

### 6. Start the Application

Start Tomcat from Eclipse.

Then open the application in your browser:

```text
http://localhost:8080/foodie/
```

The exact URL may vary depending on the project/context name configured in Eclipse.

---

## 🔑 Application Modules

### Customer

```text
Registration
     ↓
Login
     ↓
Restaurant Search
     ↓
Menu
     ↓
Cart
     ↓
Checkout
     ↓
Order
     ↓
Track Order
```

### Admin

```text
Admin Login
     ↓
Dashboard
     ├── Restaurant Management
     ├── Menu Management
     ├── Order Management
     ├── Revenue
     └── Profile
```

---

## 🔐 Security

The project includes authentication and session management for customer/admin functionality.

Password handling uses **BCrypt hashing** rather than storing plain-text passwords.

Important security practices for production deployment include:

* Never commit database passwords to GitHub.
* Store credentials in environment variables/configuration outside source control.
* Validate user input.
* Use prepared statements for database queries.
* Configure secure session handling.
* Use HTTPS in production.

---

## 🎯 Learning Outcomes

Through this project, I worked with:

* Core Java
* Object-Oriented Programming
* Java Servlets
* JSP
* JDBC
* MySQL
* MVC architecture
* DAO design pattern
* CRUD operations
* Session management
* Authentication
* Shopping cart implementation
* Order management
* Database relationships
* HTML/CSS/JavaScript
* Apache Tomcat
* Git and GitHub

---

## 🧪 Testing the Application

A basic end-to-end test can be performed using the following flow:

```text
✓ Register a new customer
✓ Login
✓ Search for a restaurant
✓ Open restaurant menu
✓ Add food item to cart
✓ Change quantity
✓ Remove item
✓ Proceed to checkout
✓ Place order
✓ View order history
✓ Track order
✓ Login as admin
✓ View orders
✓ Update order status
```

---

## 📌 Future Enhancements

Possible future improvements include:

* Online payment gateway integration
* Email/SMS order notifications
* Restaurant ratings and reviews
* Wishlist functionality
* Advanced restaurant filtering
* Real-time order tracking
* REST API integration
* Spring Boot migration
* React frontend
* Docker deployment
* Cloud deployment
* Automated testing
* Improved responsive design

---

## 👩‍💻 Developer

**Vasavi Bhoomireddy**

Java Full Stack Developer | Java | Servlets | JSP | JDBC | MySQL | Spring Boot

### GitHub

[![GitHub](https://img.shields.io/badge/GitHub-Vasavi243-black?style=for-the-badge\&logo=github)](https://github.com/Vasavi243)

### Project Repository

[![Foodie](https://img.shields.io/badge/Foodie-Repository-blue?style=for-the-badge\&logo=github)](https://github.com/Vasavi243/foodie)

---

## ⭐ If You Like This Project

If you find this project useful, consider giving the repository a ⭐.

---

## 📄 License

This project was developed for educational and portfolio purposes.
