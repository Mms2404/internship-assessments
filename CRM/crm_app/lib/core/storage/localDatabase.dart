import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database? _db;

  // Initializing DB
  static Future<Database> init() async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), 'crm_app.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE customers (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            phone TEXT,
            company TEXT,
            created_at TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customer_id INTEGER,
            order_title TEXT,
            order_amount REAL,
            order_date TEXT,
            FOREIGN KEY (customer_id) REFERENCES customers (id)
          )
        ''');
      },
    );
    return _db!;
  }

  // Insert Customer
  static Future<int> insertCustomer(Map<String, dynamic> data) async {
    final db = await init();
    return await db.insert("customers", data);
  }

  // Read Customers
  static Future<List<Map<String, dynamic>>> getCustomers() async {
    final db = await init();
    return await db.query("customers");
  }

  // Update Customer
  static Future<int> updateCustomer(int id, Map<String, dynamic> data) async {
    final db = await init();
    return await db.update("customers", data, where: "id = ?", whereArgs: [id]);
  }

  // Delete Customer
  static Future<int> deleteCustomer(int id) async {
    final db = await init();
    return await db.delete("customers", where: "id = ?", whereArgs: [id]);
  }

  // Delete Order locally
static Future<int> deleteOrder(int id) async {
  final db = await init();
  return await db.delete(
    "orders",
    where: "id = ?",
    whereArgs: [id],
  );
}

// Fetch all locally stored deleted orders
static Future<List<Map<String, dynamic>>> getOrders() async {
  final db = await init();
  return await db.query("orders"); // returns list of deleted orders
}
}
