import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../staff/components/header.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: "Project"),
            Expanded(
                child: Center(
              child: Text("Project"),
            ))
          ],
        ),
      ),
    );
  }
}
