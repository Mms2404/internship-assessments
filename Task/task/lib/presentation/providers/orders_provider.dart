import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task/data/models/order-model.dart';

class OrdersProvider extends ChangeNotifier {
  final List<OrderModel> _orders = [];
  final db = FirebaseFirestore.instance;

  List<OrderModel> get orders => _orders;

  Future<void> addOrder(OrderModel order) async {
    
    DocumentReference docRef = await db.collection("orders").add(order.toMap());

    final newOrder = OrderModel(
      id: docRef.id,
      customerId: order.customerId,
      food: order.food,
      hotel: order.hotel,
    );

    _orders.add(newOrder);
    notifyListeners();
  }

  
  Future<void> removeOrder(String id) async {
    await db.collection("orders").doc(id).delete();
    _orders.removeWhere((order) => order.id == id);
    notifyListeners();
  }

  
}
