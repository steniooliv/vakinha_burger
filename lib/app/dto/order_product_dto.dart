import 'package:vakinha_burger/app/models/product_model.dart';

class OrderProductDto {
  final ProductModel productModel;
  final int amount;

  OrderProductDto({
    required this.productModel,
    required this.amount,
  });

  double get totalPrice => amount * productModel.price;
}
