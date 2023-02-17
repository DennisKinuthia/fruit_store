import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:soko/src/common_widgets/async_value_widget.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/product/domain/product.dart';
import 'package:soko/src/features/product/presentation/home_screen/product_card.dart';
import 'package:soko/src/features/product/presentation/home_screen/product_search_state_provider.dart';
import 'package:soko/src/localization/string_hardcoded.dart';
import 'package:soko/src/routing/app_router.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListValue = ref.watch(productSearchResultsProvider);
    return AsyncValueWidget<List<Product>>(
        value: productListValue,
        data: (products) => products.isEmpty
            ? Center(
                child: Text('No products found'.hardcoded),
              )
            : Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                      onPressed: () => context.pushNamed(AppRoutes.product.name,
                          params: {'id': products[index].productId}),
                    );
                  },
                ),
              ));
  }
}

class ProductsLabel extends StatelessWidget {
  const ProductsLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Text(
        'Top Selling'.hardcoded,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.grey[800],
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
