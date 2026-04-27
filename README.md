# 🎂 Cake Bakery Store — ASP.NET Web Application

A full-stack **e-commerce web application** for an online cake and bakery shop, built with **ASP.NET Web Forms** and **SQL Server**. Features a complete customer-facing storefront and a separate admin panel for store management.

---

## 📸 Screenshots

> *(Add screenshots of Homepage, Products, Cart, Admin Dashboard, and Order Management here)*

---

## ✨ Features

### 👤 Customer Side
- **Home Page** — Attractive landing page showcasing bakery products
- **User Registration & Login** — Secure sign-up and login with session management
- **Product Listing** — Browse all available bakery items
- **Shopping Cart** — Add products to cart and manage quantities
- **My Orders** — View order history and status
- **Contact Us** — Submit inquiries directly to the admin

### 🛠️ Admin Panel
- **Admin Login** — Separate secure admin authentication
- **Admin Dashboard** — Overview of store operations
- **Product Management** — Add, update, and remove bakery products
- **Category Management** — Organize products by category
- **Order Management** — View and manage customer orders
- **Contact Inquiries** — Review and respond to customer messages
- **User Management** — View registered customers

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | C# |
| Framework | ASP.NET Web Forms |
| Frontend | HTML, CSS, Bootstrap, JavaScript |
| Database | SQL Server (SSMS) |
| Authentication | ASP.NET Session & Cookies |
| IDE | Visual Studio |

---

## ⚙️ Prerequisites

- Windows OS
- [Visual Studio 2019 / 2022](https://visualstudio.microsoft.com/) (with ASP.NET and web development workload)
- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) + SQL Server Management Studio (SSMS)
- IIS Express (included with Visual Studio)

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/dharmik-siddhpura/Cake-Bakery.git
cd Cake-Bakery
```

### 2. Set Up the Database

1. Open **SQL Server Management Studio (SSMS)**
2. Create a new database named `DB_BakeryShop` (or as defined in your connection string)
3. Run the SQL scripts from the `Database/` folder to create tables and seed data

### 3. Configure the Connection String

Open `Bakery Shop_Final/Web.config` and update the connection string:

```xml
<connectionStrings>
  <add name="cnStr"
       connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=DB_BakeryShop;Integrated Security=True"
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

> Replace `YOUR_SERVER_NAME` with your SQL Server instance name (visible in SSMS login dialog).

### 4. Open & Run the Project

1. Open the solution file (`.sln`) in Visual Studio
2. Right-click the project → **Set as Startup Project**
3. Press `F5` or click the **IIS Express** run button
4. The application will open in your default browser

---

## 🔑 Login Credentials

### Customer Login
> Register a new account via the **Sign Up** page

### Admin Login
Navigate to `/Admin/Frm_Login.aspx`

| Field | Value |
|---|---|
| Username | *(as configured in the database)* |
| Password | *(as configured in the database)* |

---

## 📁 Project Structure

```
Cake-Bakery/
├── Documents/
│   ├── admin side ss/               # Admin panel screenshots
│   ├── client side ss/              # Client side screenshots
│   └── Diagrams/                    # Project design diagrams
└── Bakery Shop_Final/
    ├── Admin/                       # Admin panel pages
    │   ├── Frm_Login.aspx           # Admin login
    │   ├── Homepage.aspx            # Admin dashboard
    │   ├── Frm_Product.aspx         # Product management
    │   ├── Frm_Category.aspx        # Category management
    │   ├── Frm_Order.aspx           # Order management
    │   ├── Frm_ContectUs_inquiry.aspx  # Contact inquiries
    │   └── Frm_Signup.aspx          # User management
    ├── HomePage.aspx                # Customer homepage
    ├── Frm_Login.aspx               # Customer login
    ├── Frm_Signup.aspx              # Customer registration
    ├── Frm_Product.aspx             # Product listing
    ├── Frm_Cart.aspx                # Shopping cart
    ├── Frm_MyOrder.aspx             # Order history
    ├── Style_Js/                    # CSS & JavaScript files
    ├── Product_Img/                 # Product images
    └── Web.config                   # App configuration & connection string
```

---

## 👨‍💻 Developer

**Dharmik Siddhpura**
- GitHub: [@dharmik-siddhpura](https://github.com/dharmik-siddhpura)
- LinkedIn: [dharmik-siddhpura](https://www.linkedin.com/in/dharmik-siddhpura/)
- Email: dharmiksiddhpura02@gmail.com
