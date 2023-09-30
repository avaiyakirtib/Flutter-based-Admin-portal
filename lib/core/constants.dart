import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const white = Colors.white;
const bgColor = Color(0xFF212332);
const cardBackgroundColor = Color(0xFF21222D);

Color appColors = const Color(0xFFfbfdf0);

extension ColorExtension on Color {
  Color get xFFfbfdf0 => const Color(0xFFfbfdf0);
  Color get xffffffff => const Color(0xffffffff);
  Color get xff000000 => const Color(0xff000000);

  Color get trans => Colors.transparent;
}

const defaultPadding = 16.0;
