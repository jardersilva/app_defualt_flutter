import 'dart:convert';

class EntityNews {
  final int id;
  final String title;
  final String introducao;
  final String dataPublicacao;
  final ImagensNews images;

  EntityNews({
    required this.id,
    required this.title,
    required this.introducao,
    required this.dataPublicacao,
    required this.images,
  });

  factory EntityNews.fromJson(Map<String, dynamic> object) {
    return EntityNews(
      id: object['id'],
      title: object['titulo'],
      introducao: object['introducao'],
      dataPublicacao: object['data_publicacao'],
      images: ImagensNews.fromJson(json.decode(object['imagens'])),
    );
  }
}

class ImagensNews {
  final String imagensInto;

  ImagensNews({required this.imagensInto});

  factory ImagensNews.fromJson(Map<String, dynamic> json) {
    return ImagensNews(
      imagensInto:
          'https://agenciadenoticias.ibge.gov.br/${json["image_intro"]}',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_intro': imagensInto,
    };
  }
}
