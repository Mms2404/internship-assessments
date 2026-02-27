import 'package:cloud_firestore/cloud_firestore.dart';

class AppOrder {
  String id;
  DocumentReference customerId; // FK reference
  String orderTitle;
  String orderAmount;
  DateTime orderDate;

  AppOrder({
    required this.id,
    required this.customerId,
    required this.orderTitle,
    required this.orderAmount,
    required this.orderDate,
  });

  factory AppOrder.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AppOrder(
      id: doc.id,
      customerId: data['customer_id'] as DocumentReference,
      orderTitle: data['order_title'] ?? '',
      orderAmount: data['order_amount'] ?? '',
      orderDate: (data['order_date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "customer_id": customerId,
      "order_title": orderTitle,
      "order_amount": orderAmount,
      "order_date": Timestamp.fromDate(orderDate),
    };
  }
}