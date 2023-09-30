import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../staff/components/header.dart';

class AccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: "Access"),
            Expanded(
                child: Center(
              child: Text("Access"),
            ))
          ],
        ),
      ),
    );
  }
}
