import 'package:flutter/material.dart';
import 'package:flutterwebapi/model/movie_model.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.open_in_browser),
      ),
      body: Consumer<ApiService>(builder: (context, apiService, child) {
        return FutureBuilder(
            future: apiService.listarFilmes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text('Carregando ...'),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Ocorreu um erro ao acessar!'),
                );
              }

              List<Filme> filmes = snapshot.data!;
              return SingleChildScrollView(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filmes.length,
                  itemBuilder: (_, index) {
                    var item = filmes[index];
                    return ListTile(
                      title: Text(item.titulo),
                      subtitle: Text(item.descricao),
                      leading: SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.network(item.foto),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            apiService.deletarFilme(item.id);
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  },
                ),
              );
            });
      }),
    );
  }
}
