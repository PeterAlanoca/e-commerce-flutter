import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/domain/repositories/product_repository.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;

  ProductState({this.products = const [], this.isLoading = false});
}

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductRepository repository;

  ProductNotifier(this.repository) : super(ProductState());

  Future<void> preload(List<Product> initialProducts) async {
    state = ProductState(isLoading: true);
    await repository.preloadProducts(initialProducts);
    state = ProductState(products: repository.getAll(), isLoading: false);
  }

  void load() {
    state = ProductState(products: repository.getAll(), isLoading: false);
  }

  Future<void> addProduct(Product product) async {
    state = ProductState(isLoading: true);
    await repository.addProduct(product);
    state = ProductState(products: repository.getAll(), isLoading: false);
  }

  Future<void> deleteProduct(int id) async {
    await repository.deleteProduct(id);
    state = ProductState(products: repository.getAll(), isLoading: false);
  }
}

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(ProductRepository());
});