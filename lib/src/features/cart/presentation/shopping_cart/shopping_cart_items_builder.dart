import 'package:flutter/material.dart';
import 'package:soko/src/common_widgets/empty_placeholder_widget.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/cart/domain/item.dart';
import 'package:soko/src/features/cart/presentation/cart_total/cart_total_with_cta.dart';
import 'package:soko/src/localization/string_hardcoded.dart';

class ShoppingCartItemsBuilder extends StatelessWidget {
  const ShoppingCartItemsBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.ctaBuilder,
  });
  final List<Item> items;
  final Widget Function(BuildContext, Item, int) itemBuilder;
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (items.isEmpty) {
      return EmptyPlaceholderWidget(
          message: 'Your Shopping cart is empty'.hardcoded);
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(Sizes.p16),
            itemBuilder: (context, index) {
              final item = items[index];
              return itemBuilder(context, item, index);
            },
            itemCount: items.length,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: Sizes.p12),
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.p48)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: CartTotalWithCTA(
              ctaBuilder: ctaBuilder,
            ),
          ),
        ),
      ],
    );
  }
}
