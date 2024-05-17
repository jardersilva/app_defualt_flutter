// ignore_for_file: use_build_context_synchronously

import 'package:app_cadastro/mainScreen.dart';
import 'package:app_cadastro/repository/UserRepository.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final EntityUserRepository repository = EntityUserRepository();
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final usuarioLogado = await repository.getUserLogad();

    if (usuarioLogado != null) {
      if (username == usuarioLogado.email && password == usuarioLogado.senha) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScrren(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nome de usuário ou senha incorretos'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário não encontrado'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome de usuário ou e-mail',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                _login();
              },
              child: const Text('ENTRAR')),
        ],
      ),
    );
  }
}
