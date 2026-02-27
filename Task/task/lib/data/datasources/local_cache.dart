import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/data/models/app_user_model.dart';
import 'package:task/domain/entities/app_user.dart';

class UserLocalCache {
  static const _boxName = 'user_box';
  static const _key = 'app_user';

  Future<void> init() async {
    await Hive.initFlutter();
    // Storing as Map<String, dynamic> — no adapter needed
    await Hive.openBox(_boxName);
  }

  Future<void> put(AppUser user) async {
    final box = Hive.box(_boxName);
    await box.put(_key, user.toMap());
  }

  AppUser? get() {
    final box = Hive.box(_boxName);
    final data = box.get(_key);
    if (data is Map) {
      final map = Map<String,dynamic>.from(data);
      final uid = map['uid'] as String ;
      return AppUserModel.fromMap(uid , map);
    }
    return null;
  }

  Future<void> clear() async {
    final box = Hive.box(_boxName);
    await box.delete(_key);
  }
}
