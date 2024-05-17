import 'package:app_cadastro/widgets/appBarImage.dart';
import 'package:app_cadastro/widgets/formCadastro.dart';
import 'package:flutter/material.dart';

class MainCadastro extends StatefulWidget {
  const MainCadastro({super.key, required this.title});

  final String title;

  @override
  State<MainCadastro> createState() => _MainCadastroState();
}

class _MainCadastroState extends State<MainCadastro> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppBarImage(),
                SizedBox(height: 30),
                Text('Cadastro de usuário',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                FormCadastro(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
