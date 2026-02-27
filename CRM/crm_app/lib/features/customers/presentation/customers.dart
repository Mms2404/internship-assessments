import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/constants/notify.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/features/customers/firestore_service.dart';
import 'package:crm_app/features/customers/presentation/widgets/customerDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Customers extends StatelessWidget {
  Customers({super.key });

  @override
  Widget build(BuildContext context) {
    final firestoreService = context.read<AppFirestoreService>();
    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.milkyGreen,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.signIn);
          }, 
          icon: Icon(Icons.arrow_back_ios_new_sharp)),
          title: Text("CUSTOMERS"),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, AppRoutes.addCustomer);
            }, icon: Icon(Icons.add))
          ],
      ),
      body: StreamBuilder(
        stream: firestoreService.getCustomers(), 
        builder: (context , snapshot){

          if(snapshot.hasError){
            print(snapshot.error);
            return Center(
              child: Text("ERROR FETCHING CUSTOMERS"),
            );
          }

          if (!snapshot.hasData){
            return Center(child: CircularProgressIndicator(color: Appcolors.night,),);
          }

          final customers = snapshot.data!;
          if(customers.isEmpty){
            return Center(
              child: Text("NO CUSTOMERS YET !"),
            );
          }

          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context , index){
              final customer = customers[index];
              return Card(
                color: Appcolors.day,
                elevation: 3,
                child: ListTile(
                  title: Text(customer.name),
                  subtitle: Text("Phone No.: ${customer.phone}"),
                  trailing:IconButton(
                    onPressed: ()async {
                      try{
                        await firestoreService.deleteCustomer(customer.id , (msg){
                        Notify.show(context, msg);
                        });
                      }
                      catch(e){
                        print(e.toString());
                        Notify.show(context, "Failed to delete order");
                      }
                    },
                    icon: Icon(Icons.delete_forever_sharp , color: Colors.red,)),
                  onTap: (){
                    showDialog(
                      context: context, 
                      builder: (_) => CustomerDialog(customer: customer));
                  },
                ),
              );
            });
        })

    );
  }
}