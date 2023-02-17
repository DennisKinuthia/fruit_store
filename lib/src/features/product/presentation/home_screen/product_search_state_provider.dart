import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/features/product/data/fake_product_repository.dart';
import 'package:soko/src/features/product/domain/product.dart';

final productSearchQueryStateProvider = StateProvider<String>((ref) {
  return '';
});

final productSearchResultsProvider =
    FutureProvider.autoDispose<List<Product>>((ref) {
  final searchQuery = ref.watch(productSearchQueryStateProvider);
  return ref.watch(productListSearchProvider(searchQuery).future);
});
