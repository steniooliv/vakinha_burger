import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/provider/app_binding.dart';
import 'package:vakinha_burger/app/core/ui/theme/theme_config.dart';
import 'package:vakinha_burger/app/pages/auth/login/login_router.dart';
import 'package:vakinha_burger/app/pages/home/home_router.dart';
import 'package:vakinha_burger/app/pages/order/order_router.dart';
import 'package:vakinha_burger/app/pages/product_detail/product_detail_router.dart';
import 'package:vakinha_burger/app/pages/splash/splash_page.dart';

import 'pages/auth/register/register_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBinding(
      child: MaterialApp(
        title: "Vakinha Burger",
        theme: ThemeConfig.theme,
        routes: {
          "/": (context) => const SplashPage(),
          "/home": (context) => HomeRouter.page,
          "/product_detail": (context) => ProductDetailRouter.page,
          "/auth/login": (context) => LoginRouter.page,
          "/auth/register": (context) => RegisterRoute.page,
          "/order": (context) => OrderRouter.page,
        },
      ),
    );
  }
}
