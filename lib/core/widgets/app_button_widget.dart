import 'package:flutter/material.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  final ButtonType? type;
  final VoidCallback? onPressed;
  final String? text;
  final TextStyle? style;
  final Color? backgroundColor;
  final double? width;
  final TextAlign? textAlign;

  AppButton(
      {this.type, this.onPressed, this.text, this.style, this.backgroundColor,this.width,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: backgroundColor ?? getButtonColor(context, type!),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(this.text!,
              style: style ??
                  Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: getTextColor(context, type!)),textAlign:textAlign ),
        ),
      ),
    );
  }
}

Color getButtonColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      return Theme.of(context).cardColor;
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return Theme.of(context).primaryColor;
  }
}

Color getTextColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return Theme.of(context).primaryColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      return Theme.of(context).cardColor;
  }
}
