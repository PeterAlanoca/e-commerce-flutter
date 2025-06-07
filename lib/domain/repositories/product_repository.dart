import 'package:hive/hive.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';

class ProductRepository {
  final Box box = Hive.box('products');

  Future<void> preloadProducts(List<Product> products) async {
    if (box.isEmpty) {
      for (var product in products) {
        await box.put(product.id.toString(), product.toMap());
      }
    }
  }

  List<Product> getAll() {
  return box.values
      .map((e) => Product.fromMap(Map<String, dynamic>.from(e)))
      .toList()
      .reversed
      .toList();
  }

  Future<void> addProduct(Product product) async {
    await box.put(product.id.toString(), product.toMap());
  }

  Future<void> deleteProduct(int id) async {
    await box.delete(id.toString());
  }

}