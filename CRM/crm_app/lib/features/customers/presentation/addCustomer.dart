import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/constants/notify.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/core/widgets/appTextField.dart';
import 'package:crm_app/features/customers/domain/customer.dart';
import 'package:crm_app/features/customers/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.day,
        title: Text("ADD CUSTOMER" , style: TextStyle(fontSize: 30),),
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, AppRoutes.customers);
        },
        icon: Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _nameController,
                labelText: "Name",
                validator: (val) => val!.isEmpty ? "Enter name" : null,
              ),
              AppTextField(
                controller: _emailController,
                labelText: "Email",
                validator: (val) => val!.isEmpty ? "Enter email" : null,
               
              ),
              AppTextField(
                controller: _phoneController,
                labelText: "Phone no.",
                validator: (val) => val!.isEmpty ? "Enter phone no." : null,
                
              ),
              AppTextField(
                controller: _companyController,
                labelText: "Company name",
                validator: (val) => val!.isEmpty ? "Enter company name" : null,
              ),
                
              SizedBox(height: 30),
              ElevatedButton(
                style: AppButtonStyles.commonButton,
                onPressed: () async {
                    final firestoreService = context.read<AppFirestoreService>();
                  
                    final customer = Customer(
                      id:'', // firestore will set it 
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      company: _companyController.text,
                      createdAt: DateTime.now(),
                    );

                    try{
                      await firestoreService.addCustomer(customer, (msg){
                        Notify.show(context, msg);
                      });
                       Navigator.pop(context);
                    }
                    catch (e){
                      print(e.toString());
                      Notify.show(context, "Failed to add customer");
                    }
                   
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
