
import 'package:ahwa_manager/models/drink.dart';
import 'package:ahwa_manager/repos/order_repo.dart';

import '../models/order.dart';

class OrderManager {
  final OrderRepository _orderRepository;

  OrderManager(this._orderRepository);

  void addOrder(String name, DrinkModel drink, String instructions) {
    if (name.isEmpty) throw ArgumentError('Name required');
    _orderRepository.addOrder(OrderModel(name, drink, instructions));
  }

  List<OrderModel> getPendingOrders() =>
      _orderRepository.getAllOrders().where((o) => !(o).isCompleted).toList();

  void completeOrder(OrderModel order) => order.markCompleted();

  List<OrderModel> get allOrders => List.unmodifiable(_orderRepository.getAllOrders());
}