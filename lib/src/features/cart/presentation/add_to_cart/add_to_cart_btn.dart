import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/common_widgets/quantity_selector.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/cart/presentation/add_to_cart/add_to_cart_btn_controller.dart';
import 'package:soko/src/features/product/domain/product.dart';
import 'package:soko/src/localization/string_hardcoded.dart';
import 'package:soko/src/utils/currency_formatter.dart';

class AddToCartButton extends ConsumerWidget {
  const AddToCartButton({
    super.key,
    required this.color,
    required this.product,
  });

  final Color color;
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final priceFormatted =
        ref.watch(kCurrencyFormatterProvider).format(product.price);
    final state = ref.watch(addToCartControllerProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              priceFormatted,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: Sizes.p24),
            ),
            QuantitySelector(
              quantity: state.value!,
              onChanged: state.isLoading
                  ? null
                  : (quantity) => ref
                      .read(addToCartControllerProvider.notifier)
                      .updateQuantity(quantity),
            ),
          ],
        ),
        gapH32,
        Container(
          width: size.width * .75,
          height: size.height * .075,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Sizes.p20),
            // boxShadow: const [kBoxShadow],
          ),
          child: TextButton(
            onPressed: () => ref
                .read(addToCartControllerProvider.notifier)
                .addItem(product.productId),
            style: TextButton.styleFrom(
                elevation: 1, shadowColor: Colors.white.withOpacity(.1)),
            child: Text(
              'Add to cart'.hardcoded,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ],
    );
  }
}
