class FavoriteModel {
  final String id;
  final String name;
  final String img;
  final double price;
  final String  description ;
  final List<dynamic> sizes ;
  

  FavoriteModel(  {
    required this.price,
    required this.id,
    required this.name,
    required this.img,
    required this.description,
    required this.sizes
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      name: json['name'],
      img: json['img'],
     price: (json['price'] as num).toDouble(),
      description: json['description'],
      sizes: (json['sizes'] as List?)?.map((size) => size.toString()).toList() ?? [],

    );
  }

  // تحويل FavoriteModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'price': price ,
      'description': description
    };
  }
}
