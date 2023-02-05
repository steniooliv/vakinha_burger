import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xff140E0E),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.screenWidth,
              child: Image.asset(
                "assets/images/lanche.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: context.percentHeight(.30),
                ),
                Image.asset(
                  "assets/images/logo.png",
                ),
                const SizedBox(
                  height: 80,
                ),
                DeliveryButton(
                  width: context.percentWidth(.6),
                  height: 35,
                  label: "Acessar",
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/home");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
