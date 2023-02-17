import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/features/cart/application/cart_service.dart';
import 'package:soko/src/features/cart/domain/item.dart';
import 'package:soko/src/features/product/domain/product.dart';

class ShoppingCartScreenController extends StateNotifier<AsyncValue<void>> {
  ShoppingCartScreenController({required this.cartService})
      : super(const AsyncData(null));

  final CartService cartService;

  Future<void> updateQuantity(ProductID productId, int quantity) async {
    state = const AsyncLoading();
    final updatedItem = Item(productId: productId, quantity: quantity);
    state = await AsyncValue.guard(() => cartService.setItem(updatedItem));
  }

  Future<void> removeItem(ProductID productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.removeItemById(productId));
  }
}

final shoppingCartScreenControllerProvider =
    StateNotifierProvider<ShoppingCartScreenController, AsyncValue<void>>(
        (ref) {
  return ShoppingCartScreenController(
    cartService: ref.watch(cartServiceProvider),
  );
});
