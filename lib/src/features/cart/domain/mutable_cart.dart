import 'package:soko/src/features/cart/domain/cart.dart';
import 'package:soko/src/features/cart/domain/item.dart';
import 'package:soko/src/features/product/domain/product.dart';

extension MutableCart on Cart {
  /// add an item to cart by overriding the quantity if it already exists
  Cart setItem(Item item) {
    final copy = Map<ProductID, int>.from(items);
    copy[item.productId] = item.quantity;
    return Cart(copy);
  }

  /// add an item to cart by updating the quantity if item already exists
  Cart addItem(Item item) {
    final copy = Map<ProductID, int>.from(items);
    copy.update(
      item.productId,
      (value) => item.quantity + value,
      ifAbsent: () => item.quantity,
    );
    return Cart(copy);
  }

  /// add a list of items to cart by updating the quantities of those that
  /// already exist in the cart
  Cart addItems(List<Item> itemsToAdd) {
    final copy = Map<ProductID, int>.from(items);
    for (var item in itemsToAdd) {
      copy.update(
        item.productId,
        (value) => item.quantity + value,
        ifAbsent: () => item.quantity,
      );
    }
    return Cart(copy);
  }

  /// find a product if and remove it if found
  Cart removeItemById(ProductID id) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(id);
    return Cart(copy);
  }
}
