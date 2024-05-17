// ignore_for_file: use_build_context_synchronously

import 'package:app_cadastro/entitys/usuario.dart';
import 'package:app_cadastro/main.dart';
import 'package:app_cadastro/repository/UserRepository.dart';
import 'package:flutter/material.dart';

class FormCadastro extends StatefulWidget {
  const FormCadastro({super.key});

  @override
  State<FormCadastro> createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  Future<void> _login() async {
    final EntityUserRepository repository = EntityUserRepository();
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String cpf = _usernameController.text;
    final String nome = _passwordController.text;

    Usuario usuario = Usuario(
      email: username,
      senha: password,
      cpf: cpf,
      nome: nome,
    );

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );
      return;
    }

    if (cpf.isEmpty || nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );
      return;
    }

    repository.setUserLogad(usuario);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastro realizado com sucesso!'),
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: '',
              )),
      (route) => false, // Limpa a pilha
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome completo',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _cpfController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CPF',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-mail',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text('Cadastrar')),
              const Text(' Ou '),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: '',
                              )),
                      (route) => false, // Limpa a pilha
                    );
                  },
                  child: const Text('Cancelar')),
            ],
          )
        ],
      ),
    );
  }
}
