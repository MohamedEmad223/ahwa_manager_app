import 'package:ahwa_manager/models/order.dart';

abstract class OrderRepository {
  void addOrder(OrderModel order);
  List<OrderModel> getAllOrders();
}
