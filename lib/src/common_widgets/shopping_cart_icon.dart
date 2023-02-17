import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/cart/application/cart_service.dart';
import 'package:soko/src/routing/app_router.dart';

class ShoppingCartIcon extends ConsumerWidget {
  const ShoppingCartIcon({super.key});

  // * Keys for testing using find.byKey()
  static const shoppingCartIconKey = Key('shopping-cart');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsCount = ref.watch(cartItemsCountProvider);
    return Stack(
      children: <Widget>[
        Center(
          child: IconButton(
            onPressed: () => context.pushNamed(AppRoutes.cart.name),
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.black,
            ),
          ),
        ),
        if (cartItemsCount > 0)
          Positioned(
            top: Sizes.p4,
            right: Sizes.p4,
            child: ShoppingCartIconBadge(itemsCount: cartItemsCount),
          ),
      ],
    );
  }
}

class ShoppingCartIconBadge extends StatelessWidget {
  const ShoppingCartIconBadge({
    super.key,
    required this.itemsCount,
  });

  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.p16,
      height: Sizes.p16,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$itemsCount',
          textAlign: TextAlign.center,
          // * Force textScaleFactor to remain 1.0 regardless of the
          // * space available on various devices' screen sized
          textScaleFactor: 1.0,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
