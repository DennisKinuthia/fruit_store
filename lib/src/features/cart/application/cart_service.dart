import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/features/cart/data/fake_cart_repository.dart';
import 'package:soko/src/features/cart/domain/cart.dart';
import 'package:soko/src/features/cart/domain/item.dart';
import 'package:soko/src/features/cart/domain/mutable_cart.dart';
import 'package:soko/src/features/product/data/fake_product_repository.dart';
import 'package:soko/src/features/product/domain/product.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;

  Future<Cart> _fetchCart() {
    return ref.read(cartRepositoryProvider).fetchCart();
  }

  Future<void> _setCart(Cart cart) async {
    await ref.read(cartRepositoryProvider).setCart(cart);
  }

  Future<void> setItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.setItem(item);
    await _setCart(updated);
  }

  Future<void> addItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.addItem(item);
    await _setCart(updated);
  }

  Future<void> removeItemById(ProductID productId) async {
    final cart = await _fetchCart();
    final updated = cart.removeItemById(productId);
    await _setCart(updated);
  }
}

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(ref);
});

final cartProvider = StreamProvider<Cart>((ref) {
  return ref.watch(cartRepositoryProvider).watchCart();
});

// provides the number of item in the cart for the badge on the cart icon
final cartItemsCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.items.length,
        orElse: () => 0,
      );
});

// provides the total amount for all products in the cart
final cartTotalProvider = Provider.autoDispose<double>((ref) {
  // fetch cart if no cart create empty cart
  final cart = ref.watch(cartProvider).value ?? const Cart();
  //fetch products from data source
  final productList = ref.watch(productListStreamProvider).value ?? [];
  if (cart.items.isNotEmpty && productList.isNotEmpty) {
    var total = 0.0;
    for (final item in cart.items.entries) {
      final product =
          productList.firstWhere((product) => product.productId == item.key);
      total += product.price * item.value;
    }
    return total;
  } else {
    return 0.0;
  }
});
