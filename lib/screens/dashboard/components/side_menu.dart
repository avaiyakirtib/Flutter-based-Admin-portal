import 'package:admin/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.selected,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final bool selected;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ListTile(
        hoverColor: primaryColor.withOpacity(0.05),
        selectedTileColor: primaryColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        selected: selected,
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SidebarItem {
  final String title;
  final String icon;

  const SidebarItem({
    required this.title,
    required this.icon,
  });
}

List<SidebarItem> sidebarItem = [
  SidebarItem(title: "Staff", icon: "assets/icons/menu_tran.svg"),
  SidebarItem(title: "Client", icon: "assets/icons/menu_dashboard.svg"),
  SidebarItem(title: "Project", icon: "assets/icons/menu_task.svg"),
  SidebarItem(title: "Settings", icon: "assets/icons/menu_doc.svg"),
  SidebarItem(title: "Access", icon: "assets/icons/menu_store.svg"),
  SidebarItem(title: "Reports", icon: "assets/icons/menu_notification.svg"),
];
