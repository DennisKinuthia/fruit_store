import 'package:soko/src/features/cart/domain/item.dart';
import 'package:soko/src/features/product/domain/product.dart';

class Cart {
  const Cart([this.items = const {}]);

  final Map<ProductID, int> items;
}

extension CartItems on Cart {
  List<Item> toItemsList() {
    return items.entries.map((entry) {
      return Item(
        productId: entry.key,
        quantity: entry.value,
      );
    }).toList();
  }
}
