import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/common_widgets/async_value_widget.dart';
import 'package:soko/src/common_widgets/quantity_selector.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/cart/domain/item.dart';
import 'package:soko/src/features/cart/presentation/shopping_cart/shopping_cart_screen_controller.dart';
import 'package:soko/src/features/product/data/fake_product_repository.dart';
import 'package:soko/src/features/product/domain/product.dart';
import 'package:soko/src/utils/currency_formatter.dart';

class ShoppingCartItem extends ConsumerWidget {
  const ShoppingCartItem(
      {super.key, required this.item, required this.itemIndex});
  final Item item;
  final int itemIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productProvider(item.productId));
    return AsyncValueWidget(
      value: productValue,
      data: (product) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p4),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p8),
            child: ShoppingCartItemContents(
              product: product!,
              item: item,
              itemIndex: itemIndex,
            ),
          ),
        ),
      ),
    );
  }
}

class ShoppingCartItemContents extends ConsumerWidget {
  const ShoppingCartItemContents({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
  });
  final Product product;
  final Item item;
  final int itemIndex;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted =
        ref.watch(kCurrencyFormatterProvider).format(product.price);
    return Container(
      decoration: BoxDecoration(color: product.color.withOpacity(.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            product.image,
            width: 70.0,
          ),
          gapW20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: Sizes.p20)),
                gapH8,
                Text(priceFormatted,
                    style: Theme.of(context).textTheme.headline6),
                gapH8,
                EditOrRemoveItemWidget(
                  product: product,
                  item: item,
                  itemIndex: itemIndex,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// custom widget to show the quantity selector and a delete button
class EditOrRemoveItemWidget extends ConsumerWidget {
  const EditOrRemoveItemWidget({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
  });
  final Product product;
  final Item item;
  final int itemIndex;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QuantitySelector(
          quantity: item.quantity,
          maxQuantity: 9,
          itemIndex: itemIndex,
          onChanged: state.isLoading
              ? null
              : (quantity) {
                  ref
                      .read(shoppingCartScreenControllerProvider.notifier)
                      .updateQuantity(item.productId, quantity);
                },
        ),
        IconButton(
          key: deleteKey(itemIndex),
          icon: Icon(Icons.delete, color: Colors.red[700]),
          onPressed: state.isLoading
              ? null
              : () => ref
                  .watch(shoppingCartScreenControllerProvider.notifier)
                  .removeItem(item.productId),
        ),
        const Spacer(),
      ],
    );
  }
}
