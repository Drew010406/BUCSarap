import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/stall_model.dart';

final List<Stall> test_list = [
  Stall(stallName: "Abby&Ynna"),
  Stall(stallName: "Benmark"),
  Stall(stallName: "Celzo's"),
  Stall(stallName: "Fairy Swirl"),
  Stall(stallName: "Gracianas"),
  Stall(stallName: "Kiko"),
];

final productProvider = Provider((ref) {
  return test_list;
});