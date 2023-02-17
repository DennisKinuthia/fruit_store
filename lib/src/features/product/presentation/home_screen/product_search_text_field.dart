import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/features/product/presentation/home_screen/product_search_state_provider.dart';
import 'package:soko/src/localization/string_hardcoded.dart';

class ProductSearchTextField extends ConsumerStatefulWidget {
  const ProductSearchTextField({super.key});

  @override
  ConsumerState<ProductSearchTextField> createState() =>
      _ProductSearchTextField();
}

class _ProductSearchTextField extends ConsumerState<ProductSearchTextField> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    // * Always dispose TextEditingControllers
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, text, _) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          padding: const EdgeInsets.symmetric(
              vertical: Sizes.p8, horizontal: Sizes.p16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
          child: TextField(
            controller: _controller,
            autofocus: false,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search fresh fruits'.hardcoded,
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.grey[800],
              ),
              suffixIcon: text.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _controller.clear();
                        ref
                            .read(productSearchQueryStateProvider.notifier)
                            .state = '';
                      },
                      icon: const Icon(
                        Icons.clear,
                      ),
                    )
                  : null,
            ),
            onChanged: (text) =>
                ref.read(productSearchQueryStateProvider.notifier).state = text,
          ),
        );
      },
    );
  }
}
