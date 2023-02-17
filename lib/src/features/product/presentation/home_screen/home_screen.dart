import 'package:flutter/material.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/product/presentation/home_screen/home_app_bar.dart';
import 'package:soko/src/features/product/presentation/home_screen/product_grid.dart';
import 'package:soko/src/features/product/presentation/home_screen/product_search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            HomeAppBar(),
            gapH24,
            Greeting(),
            gapH24,
            ProductSearchTextField(),
            gapH24,
            ProductsLabel(),
            gapH24,
            ProductGrid(),
          ],
        ),
      ),
    );
  }
}
