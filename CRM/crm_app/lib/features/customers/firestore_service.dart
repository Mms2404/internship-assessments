import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crm_app/core/storage/localDatabase.dart';
import 'package:crm_app/features/customers/domain/customer.dart';
import 'package:crm_app/features/customers/domain/order.dart';

class AppFirestoreService {
  final _db = FirebaseFirestore.instance;

  /// -------------------- CONNECTIVITY CHECK --------------------
  Future<bool> isOnline() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  /// -------------------- CUSTOMERS --------------------

  Future<void> addCustomer(Customer customer, Function(String) notify) async {
    try {
      if (await isOnline()) {
        final docRef = _db.collection("customers").doc();
        customer.id = docRef.id;
        await docRef.set(customer.toMap());
        notify("Customer added online.");
      } else {
        await LocalDatabase.insertCustomer(customer.toMap());
        notify("No internet: Customer saved locally.");
      }
    } catch (e) {
      notify("Failed to add customer: $e");
    }
  }

  Stream<List<Customer>> getCustomers() {
    return _db.collection("customers").snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Customer.fromDoc(doc)).toList(),
        );
  }

  Future<void> updateCustomer(Customer customer, Function(String) notify) async {
    try {
      if (await isOnline()) {
        await _db.collection("customers").doc(customer.id).update({
          "name": customer.name,
          "email": customer.email,
          "phone": customer.phone,
          "company": customer.company,
        });
        notify("Customer updated online.");
      } else {
        await LocalDatabase.updateCustomer(int.parse(customer.id), customer.toMap());
        notify("No internet: Customer update saved locally.");
      }
    } catch (e) {
      notify("Failed to update customer: $e");
    }
  }

  Future<void> deleteCustomer(String id, Function(String) notify) async {
    try {
      if (await isOnline()) {
        await _db.collection("customers").doc(id).delete();
        notify("Customer deleted online.");
      } else {
        await LocalDatabase.deleteCustomer(int.parse(id));
        notify("No internet: Customer delete saved locally.");
      }
    } catch (e) {
      notify("Failed to delete customer: $e");
    }
  }

  /// -------------------- ORDERS --------------------

  // Future<void> addOrder(String customerId, AppOrder order, Function(String) notify) async {
  //   try {
  //     if (await isOnline()) {
  //       final docRef = _db.collection("orders").doc();
  //       final customerRef = _db.collection("customers").doc(customerId);
  //       await docRef.set({
  //         "id": docRef.id,
  //         "customer_id": customerRef,
  //         "order_title": order.orderTitle,
  //         "order_amount": order.orderAmount,
  //         "order_date": Timestamp.fromDate(order.orderDate),
  //       });
  //       notify("Order added online.");
  //     } else {
  //       await LocalDatabase.insertOrder(order.toMap());
  //       notify("No internet: Order saved locally.");
  //     }
  //   } catch (e) {
  //     notify("Failed to add order: $e");
  //   }
  // }

  Stream<List<AppOrder>> getOrdersForCustomer(String customerId) {
    final customerRef = _db.collection("customers").doc(customerId);
    return _db
        .collection("orders")
        .where("customer_id", isEqualTo: customerRef)
        .orderBy("order_date", descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => AppOrder.fromDoc(doc)).toList(),
        );
  }

  Future<void> deleteOrder(String orderId, Function(String) notify) async {
    try {
      if (await isOnline()) {
        await _db.collection("orders").doc(orderId).delete();
        notify("Order deleted online.");
      } else {
        await LocalDatabase.deleteOrder(int.parse(orderId));
        notify("No internet: Order delete saved locally.");
      }
    } catch (e) {
      notify("Failed to delete order: $e");
    }
  }

  /// -------------------- SYNC FUNCTION --------------------
  /// Pushes local changes to Firestore when online
  Future<void> syncLocalToFirestore(Function(String) notify) async {
    if (!await isOnline()) return;

    // Sync Customers
    final localCustomers = await LocalDatabase.getCustomers();
    for (var cust in localCustomers) {
      final customer = Customer(
        id: cust['id'].toString(),
        name: cust['name'],
        email: cust['email'],
        phone: cust['phone'],
        company: cust['company'],
        createdAt: DateTime.parse(cust['created_at']),
      );
      await addCustomer(customer, notify);
      await LocalDatabase.deleteCustomer(int.parse(cust['id']));  // removing after sync
    }

    // --- Sync Orders deletions ---
  final localOrdersToDelete = await LocalDatabase.getOrders(); // contains only deleted orders
  for (var ord in localOrdersToDelete) {
    await deleteOrder(ord['id'].toString(), notify);
    await LocalDatabase.deleteOrder(ord['id']); // remove after sync
  }

  notify("Deleted orders synced with Firestore.");

  notify("Local database synced with Firestore.");
}
}
