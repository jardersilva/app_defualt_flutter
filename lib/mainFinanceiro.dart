import 'dart:ui';

import 'package:app_cadastro/entitys/financeiro.dart';
import 'package:app_cadastro/utils/appColors.dart';
import 'package:app_cadastro/widgets/appBarMain.dart';
import 'package:app_cadastro/widgets/appBarScreen.dart';
import 'package:app_cadastro/widgets/drawerMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFinanceiro extends StatefulWidget {
  const MainFinanceiro({super.key});

  @override
  State<MainFinanceiro> createState() => _MainFinanceiroState();
}

class _MainFinanceiroState extends State<MainFinanceiro> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Financeiro> arrayFinaceiro = [
    Financeiro(
      title: "Nova fatura dispovível",
      descricao: 'Conta de Luz',
      valor: 'R\$ 100,00',
    ),
    Financeiro(
      title: "Nova fatura dispovível",
      descricao: 'Conta de Água',
      valor: 'R\$ 50,00',
    ),
    Financeiro(
      title: "Nova fatura dispovível",
      descricao: 'Conta de Internet',
      valor: 'R\$ 103,99',
    ),
    Financeiro(
      title: "Nova fatura dispovível",
      descricao: 'Conta de Telefone',
      valor: 'R\$ 50,00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarScreen(
          scaffoldKey: _scaffoldKey,
          title: 'Financeiro',
          isBorder: false,
        ),
        body: Scaffold(
            appBar: null,
            key: _scaffoldKey,
            endDrawer: const DrawerMain().build(context),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(AppColors.primary),
                    border: Border(
                      bottom: BorderSide(
                        color: Color(AppColors.secondary),
                        width: 4,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://png.pngitem.com/pimgs/s/579-5798505_user-placeholder-svg-hd-png-download.png'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Nome do Usuário',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'usuario@email.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Valor a pagar:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(AppColors.primary),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'R\$ 100,00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(AppColors.primary),
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(AppColors.secondary),
                              ),
                              onPressed: () {},
                              child: const Text('Pagar'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text('Faturas disponíveis',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Divider(),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: arrayFinaceiro.length,
                        itemBuilder: (context, index) {
                          final Financeiro financeiro = arrayFinaceiro[index];
                          return ListTile(
                            leading: const Icon(Icons.attach_money),
                            title: Text(financeiro.title),
                            subtitle: Text(financeiro.descricao),
                            trailing: Text(financeiro.valor),
                          );
                        },
                      ),
                    ),
                  ],
                )),
              ],
            )));
  }
}
