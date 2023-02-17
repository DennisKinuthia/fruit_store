import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soko/src/common_widgets/shopping_cart_icon.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/localization/string_hardcoded.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.homeAppBar = true});

  final bool homeAppBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          homeAppBar
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 25.0,
                    color: Colors.black,
                  ),
                )
              : IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25.0,
                    color: Colors.black,
                  ),
                ),
          const ShoppingCartIcon()
        ],
      ),
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Hey Dennis,'.hardcoded,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w700,
                ),
          ),
          gapH12,
          Text(
            'You are what you eat!'.hardcoded,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.grey[600],
                  fontSize: Sizes.p16,
                ),
          )
        ],
      ),
    );
  }
}
