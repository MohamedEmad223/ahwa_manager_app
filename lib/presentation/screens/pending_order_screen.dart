import 'package:ahwa_manager/services/order_manager.dart';
import 'package:flutter/material.dart';

class PendingOrdersScreen extends StatefulWidget {
  final OrderManager orderManager;
  const PendingOrdersScreen({super.key, required this.orderManager});

  @override
  State<PendingOrdersScreen> createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<PendingOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final pendingOrders = widget.orderManager.getPendingOrders();
    return ListView.builder(
      itemCount: pendingOrders.length,
      itemBuilder: (context, index) {
        final order = pendingOrders[index];
        return ListTile(
          title: Text("${order.customerName} - ${order.drink.name}"),
          subtitle: Text(order.instructions),
          trailing: IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: () {
              setState(() => widget.orderManager.completeOrder(order));
            },
          ),
        );
      },
    );
  }
}