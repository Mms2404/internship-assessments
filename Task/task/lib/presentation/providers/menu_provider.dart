import 'package:flutter/material.dart';
import 'package:task/data/models/menu_model.dart';
import 'package:task/data/repositories/menu_repository_impl.dart';

class MenuProvider with ChangeNotifier{
  final MenuRepositoryImpl repo ;

  MenuProvider(this.repo){
    listenMenu();
  }

  List<MenuModel> menuItems = [];

  void listenMenu(){
    repo.getMenu().listen((items){
      menuItems = items;
      notifyListeners();
    });
  }
}