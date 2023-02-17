import 'package:flutter/material.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/cart/presentation/cart_total/cart_total_text.dart';

class CartTotalWithCTA extends StatelessWidget {
  const CartTotalWithCTA({super.key, required this.ctaBuilder});
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CartTotalText(),
        gapH8,
        ctaBuilder(context),
        gapH8,
      ],
    );
  }
}
