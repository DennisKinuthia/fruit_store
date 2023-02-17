import 'package:flutter/material.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/cart/presentation/add_to_cart/add_to_cart_btn.dart';
import 'package:soko/src/features/product/domain/product.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Transform.translate(
          offset: const Offset(0, Sizes.p48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${product.name} - medium',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
              ),
              gapH12,
              Text(
                product.package,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.p16,
                    ),
              ),
              SizedBox(
                height: size.height * .225,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Text(
                      product.description,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: Sizes.p16,
                            height: 1.5,
                          ),
                    );
                  },
                ),
              ),
              gapH20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(Sizes.p16)),
                    ),
                    child: const Center(child: Icon(Icons.timer)),
                  ),
                  gapW16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      gapH4,
                      Text(
                        'Delivery Time',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      gapH8,
                      Text(
                        '25-35 Min',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
              gapH20,
              AddToCartButton(
                  color: product.color.withOpacity(.5), product: product),
            ],
          ),
        ),
      ),
    );
  }
}
