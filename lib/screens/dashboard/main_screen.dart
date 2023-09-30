import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/access/access.dart';
import 'package:admin/screens/dashboard/components/client/client.dart';
import 'package:admin/screens/dashboard/components/project/project.dart';
import 'package:admin/screens/dashboard/components/report/report.dart';
import 'package:admin/screens/dashboard/components/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';
import 'components/staff/staff_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int selectedItem = 0;

  Widget dashBordItem(int selected) {
    switch (selected) {
      case 0:
        return StaffScreen();
      case 1:
        return ClientScreen();

      case 2:
        return ProjectScreen();
      case 3:
        return SettingsScreen();
      case 4:
        return AccessScreen();
      case 5:
        return ReportScreen();
      default:
        return const Center(child: Icon(Icons.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: _sideManu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              SizedBox(width: 250, child: _sideManu()),
            Expanded(
              child: dashBordItem(selectedItem),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sideManu() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(child: Text("LOGO")),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: sidebarItem.length,
              itemBuilder: (context, index) {
                return DrawerListTile(
                  selected: index == selectedItem,
                  title: sidebarItem[index].title,
                  svgSrc: sidebarItem[index].icon,
                  press: () {
                    setState(() {
                      selectedItem = index;
                    });
                  },
                );
              }),
        ],
      ),
    );
  }
}
