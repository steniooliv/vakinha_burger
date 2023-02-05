import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/ui/base_state/base_state.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burger/app/dto/order_product_dto.dart';
import 'package:vakinha_burger/app/pages/order/order_controller.dart';
import 'package:vakinha_burger/app/pages/order/order_state.dart';
import 'package:vakinha_burger/app/pages/order/widget/order_field.dart';
import 'package:vakinha_burger/app/pages/order/widget/order_product_tile.dart';
import 'package:vakinha_burger/app/pages/order/widget/payment_types.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Text(
                    "Carrinho",
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                    icon: Image.asset("assets/images/trashRegular.png"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
            selector: (state) => state.orderProducts,
            builder: (context, orderProducts) => SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: orderProducts.length,
                (context, index) {
                  final orderProduct = orderProducts[index];

                  return Column(
                    children: [
                      OrderProductTile(
                        index: index,
                        orderProduct: orderProduct,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total do pedido",
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        r"R$200",
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 16,
                ),
                OrderField(
                  title: "Endereço de Entrega",
                  controller: TextEditingController(),
                  validator: Validatorless.required("Campo obrigatório"),
                  hintText: "Digite um endereço",
                ),
                const SizedBox(
                  height: 16,
                ),
                OrderField(
                  title: "CPF",
                  controller: TextEditingController(),
                  validator: Validatorless.required("Campo obrigatório"),
                  hintText: "Digite seu CPF",
                ),
                const PaymentTypes(),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: DeliveryButton(
                          width: double.infinity,
                          height: 48,
                          label: "FINALIZAR",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
