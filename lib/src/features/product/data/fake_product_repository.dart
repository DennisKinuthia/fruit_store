import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/constants/test_products.dart';
import 'package:soko/src/features/product/domain/product.dart';
import 'package:soko/src/utils/in_memory_store.dart';

class FakeProductRepository {
  final _products = InMemory<List<Product>>(List.from(kTestProducts));

  Stream<List<Product>> watchProductsList() {
    return _products.stream;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList().map((products) =>
        products.firstWhere((product) => product.productId == id));
  }

  Future<List<Product>> fetchProductsList() async {
    return Future.value(_products.value);
  }

  Future<List<Product>> searchProduct(String query) async {
    assert(_products.value.length <= 100,
        'Client-side search should only be used for small product database.');
    final productList = await fetchProductsList();
    return productList
        .where((product) => product.name.toLowerCase().contains(query))
        .toList();
  }
}

final productRepositoryProvider = Provider<FakeProductRepository>((ref) {
  return FakeProductRepository();
});

final productListStreamProvider = StreamProvider.autoDispose((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.watchProductsList();
});

final productProvider =
    StreamProvider.autoDispose.family<Product?, String>((ref, id) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.watchProduct(id);
});

final productListSearchProvider = FutureProvider.autoDispose
    .family<List<Product>, String>((ref, query) async {
  final link = ref.keepAlive();
  Timer(const Duration(minutes: 20), () {
    link.close();
  });
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.searchProduct(query);
});
