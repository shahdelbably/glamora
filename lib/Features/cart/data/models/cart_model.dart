// class CartItemModel {
//   final String id;
//   final String productId;
//   final String productName;
//   final String productImage;
//   final String brandName;
//   final String brandLogo;
//   final int quantity;
//   final int price;
//   final String size;
//   final String color;

//   CartItemModel({
//     required this.id,
//     required this.productId,
//     required this.productName,
//     required this.productImage,
//     required this.brandName,
//     required this.brandLogo,
//     required this.quantity,
//     required this.price,
//     required this.size,
//     required this.color,
//   });

//   factory CartItemModel.fromJson(Map<String, dynamic> json) {
//     return CartItemModel(
//       id: json['_id'],
//       productId: json['product']['_id'],
//       productName: json['product']['name'],
//       productImage: json['product']['img'],
//       brandName: json['brand']['brandName'],
//       brandLogo: json['brand']['brandLogo'],
//       quantity: json['quantity'],
//       price: json['price'],
//       size: json['size'],
//       color: json['color'],
//     );
//   }
// }

// class CartModel {
//   final String id;
//   final String userId;
//   final List<CartItemModel> items;
//   final int totalPrice;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   CartModel({
//     required this.id,
//     required this.userId,
//     required this.items,
//     required this.totalPrice,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory CartModel.fromJson(Map<String, dynamic> json) {
//     return CartModel(
//       id: json['_id'],
//       userId: json['user'],
//       items: (json['items'] as List<dynamic>)
//           .map((item) => CartItemModel.fromJson(item))
//           .toList(),
//       totalPrice: json['totalPrice'],
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }
// }

// class GetCartResponse {
//   final String status;
//   final CartModel data;

//   GetCartResponse({
//     required this.status,
//     required this.data,
//   });

//   factory GetCartResponse.fromJson(Map<String, dynamic> json) {
//     return GetCartResponse(
//       status: json['status'],
//       data: CartModel.fromJson(json['data']),
//     );
//   }
// }
class CartItemModel {
  final String id;
  final String productId;
  final String productName;
  final String productImage;
  final dynamic brand;
  final int quantity;
  final int price;
  final String size;
  final String color;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.size,
    required this.color,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['_id'],
      productId: json['product']['_id'],
      productName: json['product']['name'],
      productImage: json['product']['img'],
      brand: json['brand'],
      quantity: json['quantity'],
      price: json['price'],
      size: json['size'],
      color: json['color'],
    );
  }
}

class CartModel {
  final String id;
  final String userId;
  final List<CartItemModel> items;
  final int totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;

  CartModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'],
      userId: json['user'],
      items: (json['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      totalPrice: json['totalPrice'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class GetCartResponse {
  final String status;
  final CartModel data;

  GetCartResponse({
    required this.status,
    required this.data,
  });

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      status: json['status'],
      data: CartModel.fromJson(json['data']),
    );
  }
}