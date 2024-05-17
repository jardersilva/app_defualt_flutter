// ignore_for_file: must_be_immutable

import 'package:app_cadastro/utils/appColors.dart';
import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final bool isBorder;

  const AppBarScreen({
    super.key,
    required this.scaffoldKey,
    required this.title,
    required this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(
          bottom: BorderSide(
              color: Color(isBorder ? AppColors.secondary : AppColors.primary),
              width: isBorder ? 4 : 0)),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_rounded),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
