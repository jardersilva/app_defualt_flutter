import 'package:app_cadastro/entitys/news.dart';
import 'package:app_cadastro/repository/NewsRepository.dart';
import 'package:app_cadastro/widgets/appBarMain.dart';
import 'package:app_cadastro/widgets/drawerMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScrren extends StatefulWidget {
  const MainScrren({super.key});

  @override
  State<MainScrren> createState() => _MainScrrenState();
}

class _MainScrrenState extends State<MainScrren> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final EntityNewsRepository _repository = EntityNewsRepository();

  Future<List<EntityNews>> _fetchNews() async {
    try {
      return await _repository.getAll();
    } catch (e) {
      print('Erro ao carregar notícias: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarMain(scaffoldKey: _scaffoldKey),
        body: Scaffold(
          appBar: null,
          key: _scaffoldKey,
          endDrawer: const DrawerMain().build(context),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Giro de notícias',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Divider(),
                const SizedBox(height: 10),
                Expanded(
                  // Adicione um Expanded para permitir que a ListView expanda
                  child: FutureBuilder<List<EntityNews>>(
                    future: _fetchNews(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Erro ao carregar notícias'),
                        );
                      } else {
                        final List<EntityNews> newsList =
                            snapshot.data as List<EntityNews>;

                        if (newsList.isEmpty) {
                          return const Center(
                            child: Text('Nenhuma notícia encontrada'),
                          );
                        }

                        return ListView.builder(
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            final EntityNews news = newsList[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Image.network(news.images.imagensInto,
                                    width: double.infinity),
                                const SizedBox(height: 10),
                                Text(news.title,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  news.introducao,
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 15),
                                Text(news.dataPublicacao,
                                    style: const TextStyle(fontSize: 12)),
                                const SizedBox(height: 15),
                                const Divider(),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
