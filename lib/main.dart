import 'package:app_cadastro/mainCadastro.dart';
import 'package:app_cadastro/repository/UserRepository.dart';
import 'package:app_cadastro/utils/appColors.dart';
import 'package:app_cadastro/utils/theme.dart';
import 'package:app_cadastro/widgets/appBarImage.dart';
import 'package:app_cadastro/widgets/formLogin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final EntityUserRepository _repository = EntityUserRepository();

  _initPrefs() async {
    final usuarioLogado = await _repository.getUserLogad();
    if (usuarioLogado != null) {
      Navigator.pushReplacementNamed(context, '/mainScreen');
    }
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                AppBarImage(),
                SizedBox(height: 30),
                Text('Bem vindo',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                FormLogin(),
              ],
            ),
            Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: Color(AppColors.secondary)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não tem uma conta?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainCadastro(
                                        title: '',
                                      )),
                              (route) => false, // Limpa a pilha
                            );
                          },
                          child: const Text(
                            'Cadastre-se',
                            style: TextStyle(color: Color(AppColors.secondary)),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
