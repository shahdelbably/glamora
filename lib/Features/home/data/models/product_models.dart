// class ProductModel {
//   final String id;
//   final String name;
//   final double rating;
//   final double price;
//   final String description;
//   final List<String> colors;
//   final List<String> images;
//   final int reviewCount;
//   final String img;
//   final String categoryField; 
//   final String gender;
//   final List<String> sizes;
//   final bool featured;
//   final String seller;
//   final String material;
//   final String countryOfOrigin;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final String clothingType;
  
//   ProductModel( {
//     required this.id,
//     required this.name,
//     required this.rating,
//     required this.price,
//     required this.description,
//     required this.colors,
//     required this.images,
//     required this.reviewCount,
//     required this.img,
//     required this.categoryField,
//     required this.gender,
//     required this.sizes,
//     required this.featured,
//     required this.seller,
//     required this.material,
//     required this.countryOfOrigin,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.clothingType
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['_id'],
//       name: json['name'],
//       clothingType: json['clothingType'] ?? '',
//       rating: (json['rating'] as num).toDouble(),
//       price: (json['price'] as num).toDouble(),
//       description: json['description'],
//       colors: List<String>.from(json['colors']),
//       images: List<String>.from(json['images']),
//       reviewCount: json['reviewCount'] is int
//           ? json['reviewCount']
//           : int.tryParse(json['reviewCount'].toString()) ?? 0,
//       img: json['img'],
//       categoryField:json['categoryField'] ?? '',
//       gender: json['gender'],
//       sizes: List<String>.from(json['sizes']),
//       featured: json['featured'],
//       seller: json['seller'],
//       material: json['material'],
//       countryOfOrigin: json['countryOfOrigin'],
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }

  

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'rating': rating,
//       'price': price,
//       'description': description,
//       'colors': colors,
//       'images': images,
//       'reviewCount': reviewCount,
//       'img': img,
//       'categoryField': categoryField,
//       'gender': gender,
//       'sizes': sizes,
//       'featured': featured,
//       'seller': seller,
//       'material': material,
//       'countryOfOrigin': countryOfOrigin,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//       'clothingType': clothingType
//     };
//   }
  
// }

class ProductModel {
  final String id;
  final String name;
  final double rating;
  final double price;
  final String description;
  final List<String> colors;
  final List<String> images;
  final int reviewCount;
  final String img;
  final String categoryField; 
  final String gender;
  final List<String> sizes;
  final bool featured;
  final String seller;
  final String material;
  final String countryOfOrigin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String clothingType;

  final List<RelatedProductModel> relatedItems;

  ProductModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
    required this.colors,
    required this.images,
    required this.reviewCount,
    required this.img,
    required this.categoryField,
    required this.gender,
    required this.sizes,
    required this.featured,
    required this.seller,
    required this.material,
    required this.countryOfOrigin,
    required this.createdAt,
    required this.updatedAt,
    required this.clothingType,
    required this.relatedItems,  
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      clothingType: json['clothingType'] ?? '',
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      colors: List<String>.from(json['colors']),
      images: List<String>.from(json['images']),
      reviewCount: json['reviewCount'] is int
          ? json['reviewCount']
          : int.tryParse(json['reviewCount'].toString()) ?? 0,
      img: json['img'],
      categoryField: json['categoryField'] ?? '',
      gender: json['gender'],
      sizes: List<String>.from(json['sizes']),
      featured: json['featured'],
      seller: json['seller'],
      material: json['material'],
      countryOfOrigin: json['countryOfOrigin'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      relatedItems: json['relatedItems'] != null
          ? (json['relatedItems'] as List)
              .map((item) => RelatedProductModel.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'rating': rating,
      'price': price,
      'description': description,
      'colors': colors,
      'images': images,
      'reviewCount': reviewCount,
      'img': img,
      'categoryField': categoryField,
      'gender': gender,
      'sizes': sizes,
      'featured': featured,
      'seller': seller,
      'material': material,
      'countryOfOrigin': countryOfOrigin,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'clothingType': clothingType,
      'relatedItems': relatedItems.map((e) => e.toJson()).toList(),  
    };
  }
}

class RelatedProductModel {
  final String id;
  final String name;
  final double price;
  final String img;
  final String clothingType;

  RelatedProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.clothingType,
  });

  factory RelatedProductModel.fromJson(Map<String, dynamic> json) {
    return RelatedProductModel(
      id: json['_id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      img: json['img'],
      clothingType: json['clothingType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'img': img,
      'clothingType': clothingType,
    };
  }
}
