import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/common_widgets/async_value_widget.dart';
import 'package:soko/src/features/cart/application/cart_service.dart';
import 'package:soko/src/features/cart/domain/cart.dart';
import 'package:soko/src/features/cart/presentation/shopping_cart/shopping_cart_item.dart';
import 'package:soko/src/features/cart/presentation/shopping_cart/shopping_cart_items_builder.dart';
import 'package:soko/src/localization/string_hardcoded.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'.hardcoded),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final cartValue = ref.watch(cartProvider);
          return AsyncValueWidget(
            value: cartValue,
            data: (cart) => ShoppingCartItemsBuilder(
              items: cart.toItemsList(),
              itemBuilder: (_, item, index) => ShoppingCartItem(
                item: item,
                itemIndex: index,
              ),
              ctaBuilder: (_) => ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Checkout'.hardcoded,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
