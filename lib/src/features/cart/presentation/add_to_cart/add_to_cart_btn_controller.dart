import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/features/cart/application/cart_service.dart';
import 'package:soko/src/features/cart/domain/item.dart';
import 'package:soko/src/features/product/domain/product.dart';

class AddToCartBtnController extends StateNotifier<AsyncValue<int>> {
  AddToCartBtnController({required this.cartService})
      : super(const AsyncData(1));

  final CartService cartService;

  void updateQuantity(int quantity) {
    state = AsyncData(quantity);
  }

  Future<void> addItem(ProductID productId) async {
    final item = Item(productId: productId, quantity: state.value!);
    state = const AsyncLoading<int>().copyWithPrevious(state);
    final value = await AsyncValue.guard(() => cartService.addItem(item));
    if (value.hasError) {
      state = AsyncError<int>(value.error!, StackTrace.current)
          .copyWithPrevious(state);
    } else {
      state = const AsyncData(1);
    }
  }
}

final addToCartControllerProvider =
    StateNotifierProvider.autoDispose<AddToCartBtnController, AsyncValue<int>>(
        (ref) {
  return AddToCartBtnController(
    cartService: ref.watch(cartServiceProvider),
  );
});
