import 'package:go_router/go_router.dart';
import 'package:soko/src/features/cart/presentation/shopping_cart/shopping_cart_screen.dart';
import 'package:soko/src/features/product/presentation/home_screen/home_screen.dart';
import 'package:soko/src/features/product/presentation/product_screen/product_screen.dart';

enum AppRoutes { home, product, cart }

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'product/:id',
          name: AppRoutes.product.name,
          builder: (context, state) {
            final id = state.params["id"]!;
            return ProductScreen(productId: id);
          },
        ),
        GoRoute(
          path: 'cart',
          name: AppRoutes.cart.name,
          builder: (context, state) => ShoppingCartScreen(),
        ),
      ],
    ),
  ],
);
