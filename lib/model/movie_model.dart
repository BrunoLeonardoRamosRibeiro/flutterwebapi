class Filme {
  final int id;
  final String titulo;
  final String descricao;
  final int ano;
  final String foto;

  const Filme({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.ano,
    required this.foto,
  });

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      id: json["id"],
      titulo: json["titulo"],
      descricao: json["descricao"],
      ano: json["ano"],
      foto: json["foto"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "titulo": titulo,
      "descricao": descricao,
      "ano": ano,
      "foto": foto,
    };
  }
//
}
