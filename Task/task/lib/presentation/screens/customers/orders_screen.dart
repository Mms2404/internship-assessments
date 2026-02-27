import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/presentation/providers/auth_provider.dart';
import 'package:task/presentation/providers/orders_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppAuthProvider>().user;

    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .where("customerId", isEqualTo: user!.uid) 
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Appcolors.spice,));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No orders yet"));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final data = orders[index].data();
              return Card(
                child: ListTile(
                  title: Text(data["food"]),
                  subtitle: Text(data["hotel"]),
                  trailing: IconButton(
                    onPressed: (){

                    }, 
                    icon: IconButton(
                      icon: Icon(IconlyBold.delete , color: Appcolors.spice,),
                      onPressed: (){
                        context.read<OrdersProvider>().removeOrder(orders[index].id);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Order deleted")),
                       );
                      },
                    )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
