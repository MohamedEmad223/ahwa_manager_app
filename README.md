# ☕ Smart Ahwa Manager

## Overview
The **Smart Ahwa Manager** is a Dart-based console application designed for a traditional **ahwa owner in Cairo** to streamline daily operations.  
It allows the owner to:
- Add customer orders (with name, drink type, and special instructions).
- Mark orders as completed.
- View pending orders.
- Generate reports for **top-selling drinks** and **total orders served**.

This project demonstrates **Object-Oriented Programming (OOP)** concepts and applies at least **three SOLID principles**.

---

## 🏗 Applied OOP Concepts

1. **Encapsulation**  
   - Order details (`_customerName`, `_drink`, `_instructions`, `_isCompleted`) are private, exposed only via getters.  
   - This ensures controlled access and validation.

2. **Inheritance**  
   - Different drinks (`Shai`, `TurkishCoffee`, `HibiscusTea`) extend from the abstract class `Drink`.  
   - Makes the system easily extensible when adding new drinks.

3. **Polymorphism**  
   - `Drink` subclasses are treated as `Drink` objects, enabling flexible order creation regardless of drink type.  

---

## 🧩 Applied SOLID Principles

1. **Single Responsibility Principle (SRP)**  
   - `Order` handles only order data.  
   - `OrderManager` handles business logic for managing orders.  
   - `ReportGenerator` focuses only on generating reports.  
   - Clear separation makes the system modular and testable.

2. **Open/Closed Principle (OCP)**  
   - Adding a new drink (e.g., `Espresso`) does not require modifying existing code — just extend `Drink`.  
   - The system is open for extension, closed for modification.

3. **Dependency Inversion Principle (DIP)**  
   - `OrderManager` depends on the `OrderRepository` abstraction, not a concrete implementation.  
   - This allows switching from `InMemoryOrderRepository` to, for example, a `DatabaseOrderRepository` without changing core logic.

---

## 📂 Project Structure

lib/
├── models/
│ ├── drink.dart
│ └── order.dart
├── repos/
│ └── order_repo.dart
├── services/
│ ├── order_manager.dart
│ └── report_generator.dart

## 📌 ScreenShots

<img width="1344" height="2992" alt="Screenshot_1758220702" src="https://github.com/user-attachments/assets/8314daee-eef7-4787-a615-f14a18926863" />
<img width="1344" height="2992" alt="Screenshot_1758220701" src="https://github.com/user-attachments/assets/22d95340-df67-41a0-91ee-f2c330401a31" />
<img width="1344" height="2992" alt="Screenshot_1758220699" src="https://github.com/user-attachments/assets/db85cdc3-5a9a-4677-82b7-7ab2a1f7cf82" />
<img width="1344" height="2992" alt="Screenshot_1758220696" src="https://github.com/user-attachments/assets/9b9f7fe5-cd81-44ab-ace4-a97bed035986" />




## to run app

```dart
# dart run lib/main.dart

---

## 🚀 Example Usage

```dart
void main() {
  final repo = InMemoryOrderRepository();
  final manager = OrderManager(repo);

  // Add some orders
  manager.addOrder("Mohamed", const Shai(), "Extra mint, ya rais");
  manager.addOrder("eslam", const TurkishCoffee(), "high sugar");
  manager.addOrder("Hassan", const HibiscusTea(), "Less sugar");

  // Complete one order
  final pending = manager.getPendingOrders();
  manager.completeOrder(pending.first);

  // Generate report
  final report = ReportGenerator(manager.allOrders);
  log("Top Selling Drinks: ${report.getTopSellingDrinks()}");
  log("Total Orders Served: ${report.getTotalOrdersServed()}");
}


