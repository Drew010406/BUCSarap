import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';

List<ProductModel> testMenu = [
  ProductModel(productName: "Adobo"),
  ProductModel(productName: "Putangina"),
  ProductModel(productName: "Deputa"),
  ProductModel(productName: "HAHAHAHA"),
];

final menuProvider = Provider((ref) {
  return testMenu;
});