import 'package:ahwa_manager/presentation/screens/add_order_screen.dart';
import 'package:ahwa_manager/presentation/screens/pending_order_screen.dart';
import 'package:ahwa_manager/presentation/screens/report_screen.dart';
import 'package:ahwa_manager/services/order_manager.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final OrderManager orderManager;

  const DashboardScreen({super.key, required this.orderManager});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      AddOrderScreen(orderManager: widget.orderManager),
      PendingOrdersScreen(orderManager: widget.orderManager),
      ReportScreen(orderManager: widget.orderManager),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Smart Ahwa Manager")),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Order"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pending"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Reports"),
        ],
      ),
    );
  }
}