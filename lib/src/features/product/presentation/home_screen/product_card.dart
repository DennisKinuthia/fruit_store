import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/constants/box_shadow.dart';
import 'package:soko/src/features/cart/presentation/add_to_cart/add_to_cart_btn_controller.dart';
import 'package:soko/src/features/product/domain/product.dart';
import 'package:soko/src/utils/currency_formatter.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product, this.onPressed});

  final Product product;
  final VoidCallback? onPressed;

  // * keys for testing using find.byKey()
  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addToCartControllerProvider);
    final priceFormatter =
        ref.watch(kCurrencyFormatterProvider).format(product.price);
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: InkWell(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [kBoxShadow],
            color: product.color.withOpacity(.1),
            borderRadius: BorderRadius.circular(Sizes.p32),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: const Offset(0, Sizes.p16),
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      height: 100.0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: Sizes.p16),
                      ),
                      gapH8,
                      Text(
                        '$priceFormatter each',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Sizes.p16),
                      bottomRight: Radius.circular(Sizes.p32),
                    ),
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: IconButton(
                    onPressed: state.isLoading
                        ? null
                        : () => ref
                            .read(addToCartControllerProvider.notifier)
                            .addItem(product.productId),
                    icon: const Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
