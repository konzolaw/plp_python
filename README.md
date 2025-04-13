# 📚 BookStore_DB

A relational database project for managing a bookstore system, built using MySQL. It includes 15 interconnected tables that handle books, authors, publishers, customers, orders, addresses, shipping, and more.

---

## 📌 Features

- Manage books, authors, and publishers
- Track book languages and publication details
- Customer management with multiple addresses
- Place and track orders with shipping methods
- Maintain order history and statuses
- Support for multiple countries and address types

---

## 🧱 Database Structure

### 15 Tables:

1. `book` – List of all books
2. `author` – Author details
3. `book_author` – Many-to-many relationship between books and authors
4. `publisher` – Book publishers
5. `book_language` – Languages books are available in
6. `customer` – Customers of the bookstore
7. `customer_address` – Addresses linked to customers
8. `address` – Detailed address records
9. `address_status` – Type of address (e.g., current, billing)
10. `country` – Countries used in address records
11. `cust_order` – Orders placed by customers
12. `order_line` – Specific books in an order
13. `order_status` – Status of each order (e.g., pending, shipped)
14. `order_history` – Order status change tracking
15. `shipping_method` – Options for delivering orders

---

## 🛠️ Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/konzolaw/bookstore_db.git
