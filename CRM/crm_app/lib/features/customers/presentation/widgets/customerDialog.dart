import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/constants/notify.dart';
import 'package:crm_app/features/customers/domain/customer.dart';
import 'package:crm_app/features/customers/domain/order.dart';
import 'package:crm_app/features/customers/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDialog extends StatefulWidget {
  final Customer customer;
  const CustomerDialog({super.key, required this.customer});

  @override
  State<CustomerDialog> createState() => _CustomerDialogState();
}

class _CustomerDialogState extends State<CustomerDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _companyController;

  late AppFirestoreService firestoreService;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    firestoreService = context.read<AppFirestoreService>();
    _nameController = TextEditingController(text: widget.customer.name);
    _emailController = TextEditingController(text: widget.customer.email);
    _phoneController = TextEditingController(text: widget.customer.phone);
    _companyController = TextEditingController(text: widget.customer.company);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isEditing ? "Edit Customer" : "Customer Details"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Customer Info
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                readOnly: !isEditing,
                validator: (val) => val!.isEmpty ? "Enter name" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                readOnly: !isEditing,
                validator: (val) => val!.isEmpty ? "Enter email" : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: "Phone"),
                readOnly: !isEditing,
                validator: (val) => val!.isEmpty ? "Enter phone" : null,
              ),
              TextFormField(
                controller: _companyController,
                decoration: InputDecoration(labelText: "Company"),
                readOnly: !isEditing,
                validator: (val) => val!.isEmpty ? "Enter company" : null,
              ),
              const SizedBox(height: 20),

              // Orders Section
              if (!isEditing) ...[
                Text("Orders", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                StreamBuilder<List<AppOrder>>(
                  stream: firestoreService.getOrdersForCustomer(widget.customer.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text("Error fetching orders");
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator( color: Appcolors.milkyGreen,),
                      );
                    }
                    final orders = snapshot.data!;
                    if (orders.isEmpty) {
                      return Text("No orders placed yet.");
                    }
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          final order = orders[index];
                          return ListTile(
                            title: Text(order.orderTitle),
                            subtitle: Text("Amount: ₹${order.orderAmount}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(order.orderDate.toLocal().toString().split(" ")[0]),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () async {
                                   try{
                                    await firestoreService.deleteOrder(order.id , (msg){
                                    Notify.show(context, msg);
                                    });
                                   }
                                   catch(e){
                                    print(e.toString());
                                    Notify.show(context, "Failed to delete order");
                                   }
                                  },
                                ),
                                // add order funtionality
                              ],
                           ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        if (!isEditing) ...[
          TextButton(
            onPressed: () async {
              await firestoreService.deleteCustomer(widget.customer.id , (msg){
                                      Notify.show(context, msg);
                                    });
              Navigator.pop(context);
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isEditing = true;
              });
            },
            child: Text("Edit"),
          ),
        ] else ...[
          TextButton(
            onPressed: () => setState(() => isEditing = false),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final updatedCustomer = widget.customer.copyWith(
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  company: _companyController.text,
                  createdAt: widget.customer.createdAt,
                );
                await firestoreService.updateCustomer(updatedCustomer , (msg){
                                      Notify.show(context, msg);
                                    });
                Navigator.pop(context);
              }
            },
            style: AppButtonStyles.commonButton,
            child: Text("Save"),
          ),
        ],
      ],
    );
  }
}
