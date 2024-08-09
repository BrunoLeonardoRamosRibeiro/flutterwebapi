import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutterwebapi/model/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService with ChangeNotifier {
  final String url = 'http://localhost:3000/api/filmes/';

  Future<List<Filme>> listarFilmes() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      List<Filme> filmes = body.map((item) => Filme.fromJson(item)).toList();
      return filmes;
    } else {
      throw Exception('Falha ao obter os filmes');
    }
  }

  Future<Filme> adicionarFilme(Filme filme) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
      body: jsonEncode(filme.toJson()),
    );

    if (response.statusCode == 201) {
      return Filme.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao adicionar o filme');
    }
  }

  Future<Filme> editarFilme(Filme filme) async {
    final response = await http.put(
      Uri.parse(url + filme.id.toString()),
      headers: {"content-type": "application/json"},
      body: jsonEncode(filme.toJson()),
    );

    if (response.statusCode == 200) {
      return Filme.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao editar o filme');
    }
  }

  Future<void> deletarFilme(int id) async {
    final response = await http.delete(
      Uri.parse(url + id.toString()),
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode != 204) {
      throw Exception('Falha ao deletar o filme');
    }
  }
}
