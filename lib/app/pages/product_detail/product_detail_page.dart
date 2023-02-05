import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burger/app/core/ui/base_state/base_state.dart';
import 'package:vakinha_burger/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:vakinha_burger/app/dto/order_product_dto.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:vakinha_burger/app/pages/product_detail/product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel productModel;
  final OrderProductDto? orderProduct;

  const ProductDetailPage({
    super.key,
    required this.productModel,
    this.orderProduct,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.orderProduct?.amount ?? 1;
    controller.initial(amount, widget.orderProduct != null);
  }

  void _showConfirmDelete(int amount) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deseja exlcuir?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancelar",
                style: context.textStyles.textBold.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(
                  OrderProductDto(
                    productModel: widget.productModel,
                    amount: amount,
                  ),
                );
              },
              child: Text(
                "Confirmar",
                style: context.textStyles.textBold,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(0.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.productModel.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.productModel.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  widget.productModel.description,
                  style: context.textStyles.textRegular.copyWith(fontSize: 14),
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              SizedBox(
                width: context.percentWidth(0.5),
                height: 68,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                      builder: (context, amount) {
                    return DeliveryIncrementDecrementButton(
                      incrementPress: controller.increment,
                      decrementPress: controller.decrement,
                      amount: amount,
                    );
                  }),
                ),
              ),
              SizedBox(
                width: context.percentWidth(0.5),
                height: 68,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                      builder: (context, amount) {
                    return ElevatedButton(
                      style: amount == 0
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            )
                          : null,
                      onPressed: () {
                        if (amount == 0) {
                          _showConfirmDelete(amount);
                        } else {
                          Navigator.of(context).pop(
                            OrderProductDto(
                              productModel: widget.productModel,
                              amount: amount,
                            ),
                          );
                        }
                      },
                      child: Visibility(
                        visible: amount > 0,
                        replacement: Text(
                          "Excluir Produto",
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Adicionar",
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                (widget.productModel.price * amount)
                                    .currencyPtBr,
                                maxFontSize: 13,
                                minFontSize: 5,
                                maxLines: 1,
                                textAlign: TextAlign.end,
                                style: context.textStyles.textExtraBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
