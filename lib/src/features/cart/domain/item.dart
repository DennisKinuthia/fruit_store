import 'package:soko/src/features/product/domain/product.dart';

class Item {
  Item({required this.productId, required this.quantity});
  final ProductID productId;
  final int quantity;
}
