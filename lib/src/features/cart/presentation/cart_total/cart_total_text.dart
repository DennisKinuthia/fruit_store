import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/cart/application/cart_service.dart';
import 'package:soko/src/utils/currency_formatter.dart';

class CartTotalText extends ConsumerWidget {
  const CartTotalText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartTotal = ref.watch(cartTotalProvider);
    final totalFormatted =
        ref.watch(kCurrencyFormatterProvider).format(cartTotal);
    return Text(
      'Total: $totalFormatted',
      style:
          Theme.of(context).textTheme.headline6!.copyWith(fontSize: Sizes.p20),
      textAlign: TextAlign.center,
    );
  }
}
