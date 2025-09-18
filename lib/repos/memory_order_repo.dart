import 'package:ahwa_manager/models/order.dart';
import 'package:ahwa_manager/repos/order_repo.dart';

class InMemoryOrderRepository implements OrderRepository {
  final List<OrderModel> _orders = [];

  @override
  void addOrder(OrderModel order) => _orders.add(order);

  @override
  List<OrderModel> getAllOrders() => List.unmodifiable(_orders);
}