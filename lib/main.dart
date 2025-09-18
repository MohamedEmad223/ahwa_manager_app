import 'package:ahwa_manager/presentation/screens/dasboard_screen.dart';
import 'package:ahwa_manager/repos/memory_order_repo.dart';
import 'package:ahwa_manager/services/order_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SmartAhwaApp());
}

class SmartAhwaApp extends StatelessWidget {
  final OrderManager orderManager =
      OrderManager(InMemoryOrderRepository());

  SmartAhwaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Ahwa Manager',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: DashboardScreen(orderManager: orderManager),
    );
  }
}