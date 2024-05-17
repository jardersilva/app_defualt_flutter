import 'package:flutter/material.dart';

class AppBarImage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(250),
      child: Container(
        height: 250,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backk.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white24, Colors.white],
                stops: [0.0, 1.0],
              ),
            ),
            child: Image.asset(
              'assets/logo_v.png',
              width: 200,
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
