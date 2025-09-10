class ProductModel {
  final String id;
  final String name;
  final String img;

  ProductModel({
    required this.id,
    required this.name,
    required this.img,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Unknown',
      img: json['img'] ?? '',
    );
  }
}

class PaymentMethodModel {
  final String? id;
  final String? methodName;

  PaymentMethodModel({this.id, this.methodName});

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['_id'],
      methodName: json['methodName'],
    );
  }
}

class BrandModel {
  final String id;
  final String brandName;
  final String brandLogo;

  BrandModel({
    required this.id,
    required this.brandName,
    required this.brandLogo,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'] ?? '',
      brandName: json['brandName'] ?? 'Unknown',
      brandLogo: json['brandLogo'] ?? '',
    );
  }
}

class OrderItemModel {
  final String id;
  final ProductModel product;
  final BrandModel brand;
  final int quantity;
  final double price;
  final String color;
  final String size;

  OrderItemModel({
    required this.id,
    required this.product,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.color,
    required this.size,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['_id'] ?? '',
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : ProductModel(id: '', name: 'Unknown', img: ''),
      brand: json['brand'] != null
          ? BrandModel.fromJson(json['brand'])
          : BrandModel(id: '', brandName: 'Unknown', brandLogo: ''),
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      color: json['color'] ?? 'Unknown',
      size: json['size'] ?? 'Unknown',
    );
  }
}

class OrderModel {
  final String id;
  final String user;
  final List<OrderItemModel> items;
  final double shipping;
  final double tax;
  final double subTotal;
  final double totalPrice;
  final String status;
  final String shippingAddress;
  final PaymentMethodModel? paymentMethod;
  final String createdAt;
  final String updatedAt;
  final String estimatedDate;

  OrderModel({
    required this.id,
    required this.user,
    required this.items,
    required this.shipping,
    required this.tax,
    required this.subTotal,
    required this.totalPrice,
    required this.status,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.createdAt,
    required this.updatedAt,
    required this.estimatedDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      items: (json['items'] as List)
          .map((item) => OrderItemModel.fromJson(item))
          .toList(),
      shipping: (json['shipping'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? 'Unknown',
      shippingAddress: json['shippingAddress'] ?? 'Unknown',
      paymentMethod: json['paymentMethod'] != null
          ? PaymentMethodModel.fromJson(json['paymentMethod'])
          : null,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      estimatedDate: json['estimatedDate'] ?? 'UnKown',
    );
  }
}

class PostOrderResponseModel {
  final String status;
  final OrderModel order;

  PostOrderResponseModel({
    required this.status,
    required this.order,
  });

  factory PostOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return PostOrderResponseModel(
      status: json['status'] ?? '',
      order: OrderModel.fromJson(json['data']['order']),
    );
  }
}

class GetOrdersResponseModel {
  final String status;
  final List<OrderModel> orders;

  GetOrdersResponseModel({
    required this.status,
    required this.orders,
  });

  factory GetOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return GetOrdersResponseModel(
      status: json['status'] ?? '',
      orders: (json['data'] as List)
          .map((orderJson) => OrderModel.fromJson(orderJson))
          .toList(),
    );
  }
}
