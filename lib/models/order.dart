import 'package:ahwa_manager/models/drink.dart';

class OrderModel {
  final String _customerName;
  final DrinkModel _drink;
  final String _instructions;
  bool _isCompleted = false;

  OrderModel(this._customerName, this._drink, this._instructions);

  String get customerName => _customerName;
  DrinkModel get drink => _drink;
  String get instructions => _instructions;
  bool get isCompleted => _isCompleted;

  void markCompleted() => _isCompleted = true;
}