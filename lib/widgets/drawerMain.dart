import 'package:app_cadastro/main.dart';
import 'package:app_cadastro/mainFinanceiro.dart';
import 'package:app_cadastro/mainScreen.dart';
import 'package:app_cadastro/repository/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: const Text('Meu Perfil',
                style: TextStyle(
                  fontSize: 20,
                )),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainScrren()),
                (route) => false, // Limpa a pilha
              );
            },
          ),
          ListTile(
            title: const Text('Meus Imóveis', style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Financeiro', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainFinanceiro()),
                (route) => false, // Limpa a pilha
              );
            },
          ),
          ListTile(
            title: const Text('Jurídico', style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Repasse', style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Comercial', style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('FAQ', style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sobre', style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sair', style: TextStyle(fontSize: 20)),
            onTap: () {
              final EntityUserRepository repository = EntityUserRepository();
              repository.removeUserLogad();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: '',
                        )),
                (route) => false, // Limpa a pilha
              );
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                onPressed: () {
                  // Implemente a ação para o Facebook
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.twitter),
                onPressed: () {
                  // Implemente a ação para o Facebook
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.youtube),
                onPressed: () {
                  // Implemente a ação para o Facebook
                },
              ),
              IconButton(
                icon: const Icon(Icons.mail),
                onPressed: () {
                  // Implemente a ação para o Twitter
                },
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                ),
                onPressed: () {
                  // Implemente a ação para o Instagram
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
