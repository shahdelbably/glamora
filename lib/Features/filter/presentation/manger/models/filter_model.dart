// class ProductFilters {
//   final String? color;
//   final List<String>? sizes;
//   final String? priceRange; // مثل: "100-300"
//   final String? brand;
//   final int? page;

//   ProductFilters({
//     this.color,
//     this.sizes,
//     this.priceRange,
//     this.brand,
//     this.page,
//   });

//   Map<String, dynamic> toQueryParameters() {
//     final Map<String, dynamic> params = {
//       if (color != null) 'color': color,
//       if (sizes != null && sizes!.isNotEmpty) 'size': sizes!.join(','),
//       if (priceRange != null) 'price': priceRange,
//       if (brand != null) 'brand': brand,
//       if (page != null) 'page': page.toString(),
//     };

//     return params;
//   }

//   String get cacheKey {
//     return '${color ?? "all"}-${sizes?.join(",") ?? "all"}-${priceRange ?? "all"}-${brand ?? "all"}-${page ?? "1"}';
//   }
// }
class ProductFilters {
  final String? color;
  final List<String>? sizes;
  final String? priceRange; // مثل: "100-300"
  final String? brand;
  final String? category; // ✅ ضفنا category
  final int? page;

  ProductFilters({
    this.color,
    this.sizes,
    this.priceRange,
    this.brand,
    this.category,
    this.page,
  });

  Map<String, dynamic> toQueryParameters() {
    final Map<String, dynamic> params = {
      if (color != null) 'color': color,
      if (sizes != null && sizes!.isNotEmpty) 'size': sizes!.join(','),
      if (priceRange != null) 'price': priceRange,
      if (brand != null) 'brand': brand,
      if (category != null) 'category': category, // ✅ لو في كاتيجوري نضيفه
      if (page != null) 'page': page.toString(),
    };
    return params;
  }

  /// نسخة بدون category لو مش عايزين نبعته
  Map<String, dynamic> toQueryParametersWithoutCategory() {
    final Map<String, dynamic> params = {
      if (color != null) 'color': color,
      if (sizes != null && sizes!.isNotEmpty) 'size': sizes!.join(','),
      if (priceRange != null) 'price': priceRange,
      if (brand != null) 'brand': brand,
      if (page != null) 'page': page.toString(),
    };
    return params;
  }

  String get cacheKey {
    return '${color ?? "all"}-${sizes?.join(",") ?? "all"}-${priceRange ?? "all"}-${brand ?? "all"}-${category ?? "all"}-${page ?? "1"}';
  }
}
