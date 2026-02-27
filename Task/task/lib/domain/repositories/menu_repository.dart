import 'package:task/data/models/menu_model.dart';

abstract class MenuRepository {
  Stream<List<MenuModel>> getMenu();
}