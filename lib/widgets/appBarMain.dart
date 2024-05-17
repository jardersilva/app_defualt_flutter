// ignore_for_file: must_be_immutable

import 'package:app_cadastro/utils/appColors.dart';
import 'package:flutter/material.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarMain({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
          bottom: BorderSide(color: Color(AppColors.secondary), width: 4)),
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://png.pngitem.com/pimgs/s/579-5798505_user-placeholder-svg-hd-png-download.png'),
            ),
          );
        },
      ),
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Olá, Usuário",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Text(
            "Seja bem-vindo!",
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          )
        ],
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
