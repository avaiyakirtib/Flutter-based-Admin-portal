import 'package:flutter/material.dart';
import '../../responsive.dart';
import '../constants.dart';
import 'app_button_widget.dart';

class TitleView extends StatelessWidget {
  final String text;
  final String? buttonText;
  final void Function()? onTap;
  final TextEditingController? controller;

  const TitleView(
      {required this.text, this.buttonText, this.onTap, this.controller});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w600)),
          Container(
            alignment: Alignment.centerLeft,
            width: !Responsive.isMobile(context)
                ? !Responsive.isDesktop(context)
                    ? width * 0.2
                    : buttonText == null
                        ? width * 0
                        : width * 0.15
                : width * 0.25,
            child: buttonText != null
                ? SizedBox(
                    width: !Responsive.isMobile(context) ? width * 0.1 : width,
                    height: 45,
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: appColors.xffffffff),
                      onTap: onTap,
                      controller: controller,
                      readOnly: true,
                      decoration: InputDecoration(
                        fillColor: primaryColor.withOpacity(0.8),
                        filled: true,
                        hintText: buttonText ?? "",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: appColors.xffffffff),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            width: 1.2,
                            color: appColors.xffffffff,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            width: 1.2,
                            color: appColors.xff000000,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            width: 1.2,
                            color: appColors.xff000000,
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
          )
        ],
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  final String? buttonText;
  final void Function()? onTap;
  final String title;
  final String? value;
  final Widget? widget;
  final EdgeInsetsGeometry? padding;

  const DetailsView(
      {required this.title,
      this.value,
      this.padding,
      this.widget,
      this.buttonText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: padding ?? EdgeInsets.only(top: height * 0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  color: appColors.xffffffff.withOpacity(0.6),
                  letterSpacing: 0.2)),
          Container(
            alignment: Alignment.centerLeft,
            width: !Responsive.isMobile(context)
                ? !Responsive.isDesktop(context)
                    ? width * 0.2
                    : width * 0.15
                : width * 0.25,
            child: buttonText != null
                ? AppButton(
              width: !Responsive.isMobile(context) ? width * 0.1 : width,
                    type: ButtonType.PRIMARY,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: appColors.xffffffff.withOpacity(0.7)),
                    backgroundColor: appColors.xff000000,
                    text: buttonText ?? "",
                    textAlign: TextAlign.center,
                    onPressed: onTap ?? () {},
                  )
                : Text(value ?? "",
                    style: TextStyle(
                        fontSize: 16,
                        color: appColors.xffffffff.withOpacity(0.6),
                        letterSpacing: 0.2)),
          )
        ],
      ),
    );
  }
}
