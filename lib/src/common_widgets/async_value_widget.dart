import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko/src/common_widgets/error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(Object context) {
    return value.when(
        data: data,
        error: (error, statckTrace) =>
            Center(child: ErrorMessageWidget(errorMessage: error.toString())),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
