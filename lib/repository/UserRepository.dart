import 'dart:convert';

import 'package:app_cadastro/entitys/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EntityUserRepository {
  EntityUserRepository();

  Future<Usuario?> getUserLogad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('user');

    if (value != null && value.isNotEmpty) {
      return Usuario.fromJson(json.decode(value));
    } else {
      return null;
    }
  }

  Future<void> setUserLogad(Usuario user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toJson()));
  }

  Future<void> removeUserLogad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', '');
  }
}
