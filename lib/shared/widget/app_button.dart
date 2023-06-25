import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../text_widgets/build_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.buttonWidth,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final double buttonWidth;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        width: buttonWidth,
        decoration: BoxDecoration(
            color: ColorConstants.primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: BuildText(
          text: title,
          color: Colors.white,
        ),
      ),
    );
  }
}
