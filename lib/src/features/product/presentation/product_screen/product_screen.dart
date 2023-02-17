import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/common_widgets/async_value_widget.dart';
import 'package:soko/src/common_widgets/empty_placeholder_widget.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/product/data/fake_product_repository.dart';
import 'package:soko/src/features/product/domain/product.dart';
import 'package:soko/src/features/product/presentation/home_screen/home_app_bar.dart';
import 'package:soko/src/features/product/presentation/product_screen/product_screen_body.dart';
import 'package:soko/src/localization/string_hardcoded.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final productValue = ref.watch(productProvider(productId));
          return AsyncValueWidget(
              value: productValue,
              data: (product) => product == null
                  ? EmptyPlaceholderWidget(
                      message: 'Product not found'.hardcoded)
                  : Column(
                      children: <Widget>[
                        ProductScreenAppBar(
                          product: product,
                        ),
                        ProductScreenBody(
                          product: product,
                        ),
                      ],
                    ));
        },
      ),
    );
  }
}

class ProductScreenAppBar extends StatelessWidget {
  const ProductScreenAppBar({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height * .3,
          decoration: BoxDecoration(
            color: product.color.withOpacity(.5),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Sizes.p48),
              bottomRight: Radius.circular(Sizes.p48),
            ),
          ),
          child: Transform.translate(
            offset: const Offset(0, 70.0),
            child: Image.asset(
              product.image,
            ),
          ),
        ),
        const Positioned(
            top: Sizes.p48,
            left: 0,
            right: 0,
            child: HomeAppBar(
              homeAppBar: false,
            ))
      ],
    );
  }
}
