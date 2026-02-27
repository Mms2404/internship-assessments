import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/presentation/providers/auth_provider.dart';
import 'package:task/presentation/providers/menu_provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  final List<String> foodBanners = [
    "assets/carousel/c1.jpeg",
    "assets/carousel/c2.jpeg",
    "assets/carousel/c3.jpeg",
  ];

  String search = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpeg",),
          fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 50.h),
            // search bar 
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                cursorColor: Appcolors.spice,
                decoration: InputDecoration(
                  hintText: "Search menu ...",
                  prefixIcon: Icon(IconlyLight.search , color: Appcolors.spice,),
                  filled: true,
                  fillColor: Appcolors.day,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none
                  )
                ),
                onChanged: (value){
                  setState(() {
                    search = value.toLowerCase();
                  });
                },
              ),
            ),
            SizedBox(height: 20.h),

            // carousel
            CarouselSlider(
              items: foodBanners.map(
                (banner) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  banner,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
               )
              ).toList(),
              options: CarouselOptions(
                height: 150.h,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(seconds: 3),
                viewportFraction: 0.8
              ),
              ),
              SizedBox(height: 40.h),
              Text("   Restaurents near you ..." , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
      
              // list view menu
              Expanded(
                child: Consumer<MenuProvider>(
                  builder: (context , provider , _){
                    final items = provider.menuItems.where((item) =>item.name.toLowerCase().contains(search)).toList();
                    if(items.isEmpty){
                      return Center(
                        child: Text("No menu available"),
                      );
                    }
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context ,index){
                        final item = items[index];
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/menu/${item.image}", 
                              height: 150.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(" ${item.name}" , style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("  ${item.hotel}" , style: TextStyle(color: Appcolors.spice),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(IconlyBold.star),
                                      Text(item.ratings),
                                      IconButton(
                                        onPressed:() async{
                                           final user = context.read<AppAuthProvider>().user;

                                           await FirebaseFirestore.instance.collection("orders").add({
                                            "customerId" :user!.uid,
                                            "food": item.name,
                                            "hotel":item.hotel
                                           });
                                           ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Added to orders"))
                                           );
                                        }, 
                                        icon: Icon(IconlyBold.plus, color: Appcolors.spice,))        
                                    ],
                                  )
                                ],
                                )
                            ],
                          )
                        );
                      });
                  }),
              )
          ],
        )
      ),
    );
  }
}