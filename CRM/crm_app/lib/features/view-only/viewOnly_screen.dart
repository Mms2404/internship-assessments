import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/constants/notify.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/features/customers/domain/customer.dart';
import 'package:crm_app/features/customers/firestore_service.dart';
import 'package:crm_app/features/view-only/dummyApi_model.dart';
import 'package:crm_app/features/view-only/dummy_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomCompany extends StatefulWidget {
  @override
  _RandomCompanyState createState() => _RandomCompanyState();
}

class _RandomCompanyState extends State<RandomCompany> {

  Company? company;
  bool isLoading = false;

  void getCompany() async {
    setState(() => isLoading = true);
    final fetchedCompany = await CompanyDatasource.fetchRandomCompany();
    setState(() {
      company = fetchedCompany;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Company'),
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, AppRoutes.signIn);
          },
           icon: Icon(Icons.arrow_back_ios_new_sharp)),),
           
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(color: Appcolors.night,)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   ElevatedButton(
                    style: AppButtonStyles.topButton,
                    onPressed: getCompany,
                    child: Text('Fetch Random Company'),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: AppButtonStyles.topButton,
                      onPressed: company != null
                      ? () async {
                        final firestoreService = context.read<AppFirestoreService>();
                        try{
                          final customer = Customer(
                            id: '', 
                            name: company!.name,
                            email: company!.email,
                            phone: company!.phone,
                            company: company!.name, 
                            createdAt: DateTime.now()
                          );

                          await firestoreService.addCustomer(customer, (msg){
                            Notify.show(context, msg);
                          });
                          
                        }
                        catch(e){
                          print(e.toString());
                          Notify.show(context, "Failed to add customer");
                        }
                      }
                      : null,
                      child: Text('Add as Customer'),
                    ),
                    SizedBox(height: 20,),
                  if (company != null) ...[
                    Text('Name: ${company!.name}'),
                    Text('Email: ${company!.email}'),
                    Text('Phone: ${company!.phone}'),
                    Text('VAT: ${company!.vat}'),
                    Text('Country: ${company!.country}'),
                    SizedBox(height: 10),
                    SizedBox(height: 30,),
                    
                  ]
                ],
              ),
      ),
    );
  }
}
