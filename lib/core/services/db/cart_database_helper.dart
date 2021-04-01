import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class CartDatabaseHelper {
  // Singleton Design Pattern
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = p.join(await getDatabasesPath(), 'CartProduct.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $tableCartProduct (
          $columnProductId TEXT NOT NULL PRIMARY KEY, 
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnPrice TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL
        );
        ''');
      },
    );
  }

  insert(CartProductModel cartProductModel) async {
    var dbClient = await database;

    await dbClient.insert(
      tableCartProduct,
      cartProductModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartProductModel>> getAllProducts() async {
    var dbClient = await database;

    List<Map> map = await dbClient.query(tableCartProduct);
    List<CartProductModel> list = map.isNotEmpty
        ? map.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  updateProduct(CartProductModel cartProductModel) async {
    var dbClient = await database;
    return await dbClient.update(
      tableCartProduct,
      cartProductModel.toJson(),
      where: '$columnProductId =?',
      whereArgs: [cartProductModel.productId],
    );
  }
}
