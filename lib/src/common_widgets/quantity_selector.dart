import 'package:flutter/material.dart';
import 'package:soko/src/constants/app_sizes.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector(
      {super.key,
      required this.quantity,
      this.maxQuantity = 9,
      this.itemIndex,
      this.onChanged});
  final int quantity;
  final int maxQuantity;
  final int? itemIndex;
  final ValueChanged<int>? onChanged;

  // * keys for testing using find.byKey()
  static Key decrementKey([int? index]) =>
      index != null ? Key('decrement-$index') : const Key('decrement');
  static Key quantityKey([int? index]) =>
      index != null ? Key('quantity-$index') : const Key('quantity');
  static Key incrementKey([int? index]) =>
      index != null ? Key('increment-$index') : const Key('increment');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.p16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            key: decrementKey(itemIndex),
            icon: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
            onPressed: onChanged != null && quantity > 1
                ? () => onChanged!.call(quantity - 1)
                : null,
          ),
          SizedBox(
            width: 30.0,
            child: Text(
              '0$quantity',
              key: quantityKey(itemIndex),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: Sizes.p20,
                  ),
            ),
          ),
          IconButton(
            key: incrementKey(itemIndex),
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: onChanged != null && quantity < maxQuantity
                ? () => onChanged!.call(quantity + 1)
                : null,
          ),
        ],
      ),
    );
  }
}
