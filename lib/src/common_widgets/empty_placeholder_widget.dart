import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soko/src/constants/app_sizes.dart';
import 'package:soko/src/localization/string_hardcoded.dart';
import 'package:soko/src/routing/app_router.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            gapH32,
            ElevatedButton(
                onPressed: () => context.goNamed(AppRoutes.home.name),
                child: Text(
                  'Go Home'.hardcoded,
                ))
          ],
        ),
      ),
    );
  }
}
