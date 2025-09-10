import 'dart:io';

import 'package:store_powered_ai/Features/home/data/models/product_models.dart';

abstract class RetrieveRepo {
  Future<List<ProductModel>> postRetrieve({
    required File image,
  });
}
