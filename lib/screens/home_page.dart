import 'package:flutter/material.dart';
import 'package:flutterwebapi/services/movie_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiService>(context);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            provider.listarFilmes();
          },
          child: const Text('Clique aqui'),
        ),
      ),
    );
  }
}
