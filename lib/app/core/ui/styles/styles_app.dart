import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';

class StylesApp {
  static StylesApp? _instance;

  StylesApp._();

  static StylesApp get instance {
    _instance ??= StylesApp._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: ColorsApp.instance.primary,
        foregroundColor: Colors.white,
        textStyle: TextStyles.instance.textLabelButton,
      );
}
