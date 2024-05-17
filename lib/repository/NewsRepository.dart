import 'dart:convert';
import 'package:app_cadastro/entitys/news.dart';
import 'package:http/http.dart' as http;

class EntityNewsRepository {
  EntityNewsRepository();

  Future<List<EntityNews>> getAll() async {
    try {
      final response = await http.get(Uri.parse(
          'https://servicodados.ibge.gov.br/api/v3/noticias/?tipo=noticia&qtd=5'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body)['items'];
        return jsonList.map((json) => EntityNews.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
