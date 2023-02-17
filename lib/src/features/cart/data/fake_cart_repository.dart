import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/features/cart/domain/cart.dart';
import 'package:soko/src/utils/in_memory_store.dart';

class FakeCartRepository {
  final _cart = InMemory<Cart>(const Cart());

  Future<Cart> fetchCart() => Future.value(_cart.value);

  Stream<Cart> watchCart() => _cart.stream;

  Future<void> setCart(Cart cart) async {
    await Future.delayed(const Duration(seconds: 2));
    _cart.value = cart;
  }
}

final cartRepositoryProvider = Provider<FakeCartRepository>((ref) {
  return FakeCartRepository();
});
