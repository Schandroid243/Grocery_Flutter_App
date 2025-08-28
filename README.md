# Grocery Flutter App

A **cross-platform Flutter mobile app** for a grocery e-commerce platform.  
Built with **Provider state management**, a clean modular architecture, and full integration with the [Grocery Node.js API](https://github.com/Schandroid243/Grocery_NodeJs_Api).  

---

## 🚀 Problem Solved
This app demonstrates how to build a **scalable and maintainable Flutter client** for an e-commerce system.  
It consumes a RESTful API, manages authentication and cart state, and provides a clean shopping experience with reusable components.  
Ideal as a **portfolio project** to showcase mobile development skills.

---

## ✨ Features
- 📦 **State Management with Provider**
  - Global providers for cart, products, and authentication
- 🌐 **API Integration**
  - Connects with the Grocery Node.js backend (products, users, cart, orders)
- 🛒 **Core E-Commerce Features**
  - Browse grocery items
  - View product details
  - Manage shopping cart
  - Handle user login/register
- 🧩 **Modular Architecture**
  - `api/` → REST API services  
  - `application/` → App logic layer  
  - `models/` → Dart data models  
  - `providers/` → State management with Provider  
  - `pages/` → Screens (login, home, product, cart, etc.)  
  - `widgets/` → Reusable UI components  
  - `components/` → Shared UI building blocks  
  - `utils/` → Helper utilities (formatting, constants)  
  - `config.dart` → Centralized app configuration  
  - `main.dart` → Entry point
- 🎨 **UI/UX**
  - Clean, responsive design
  - Reusable custom widgets
- ⚙️ **Extensible Setup**
  - Easy to plug into other APIs or extend with new pages

---

## 🛠 Tech Stack
- **Flutter** (Dart)
- **Provider** (state management)
- **Dio / http** (API requests)
- **Shared Preferences / Secure Storage** (auth persistence)
- **Material Design** (UI components)

---

## 🏃 How to Run Locally

1. **Clone the repository**
   ```bash
   git clone https://github.com/Schandroid243/Grocery_Flutter_App.git
   cd Grocery_Flutter_App
   git checkout dev
2. **Install dependencies**
   ```bash
   flutter pub get
3. **Set up config**
   - Open lib/config.dart
   - Add your API base URL (from Grocery_NodeJs_Api): `const String apiBaseUrl = "http://localhost:3000/api";`
4. **Run the app**
   ```bash
   flutter run

## 🔮 Future Improvements

- Add payment integration (Stripe, PayPal, etc.)
- Offline mode with local caching
- Push notifications for offers/orders
- Dark mode support
