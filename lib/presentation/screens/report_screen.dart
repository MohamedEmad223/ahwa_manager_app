import 'package:ahwa_manager/services/order_manager.dart';
import 'package:ahwa_manager/services/report_manager.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  final OrderManager orderManager;
  const ReportScreen({super.key, required this.orderManager});

  @override
  Widget build(BuildContext context) {
    final report = ReportGenerator(orderManager.allOrders);
    final topSelling = report.getTopSellingDrinks();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Total Orders Served: ${report.getTotalOrdersServed()}",
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          const Text("Top Selling Drinks:", style: TextStyle(fontSize: 18)),
          ...topSelling.entries.map((e) => ListTile(
                title: Text(e.key),
                trailing: Text("${e.value} orders"),
              ))
        ],
      ),
    );
  }
}