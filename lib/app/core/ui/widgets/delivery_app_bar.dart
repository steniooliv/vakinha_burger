import 'package:flutter/material.dart';

class DeliveryAppBar extends AppBar {
  DeliveryAppBar({
    super.key,
    double elevation = 0,
  }) : super(
          elevation: 1,
          title: Image.asset(
            "assets/images/logo.png",
            width: 80,
          ),
        );
}
