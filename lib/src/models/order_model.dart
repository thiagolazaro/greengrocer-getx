import 'package:greengrocer/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  double total;
  List<CartItemModel> items;
  String status;
  String copyAndPast;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPast,
    required this.total,
  });
}
