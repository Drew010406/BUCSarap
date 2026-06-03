import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/order_line_model.dart';
import 'package:path_provider/path_provider.dart';

import '../services/order/order_service.dart';
import 'dio_provider.dart';

class CartNotifier extends Notifier<Set<OrderLineModel>> {
  @override
  Set<OrderLineModel> build() {
    return const {};
  }

  void addProduct(OrderLineModel product) {
    if (!state.contains(product)) {
      for (var prod in state) {
        if (prod.productID == product.productID) {
          int prodQuantity = prod.quantityOrdered!;
          removeProduct(prod);
          state = {
            ...state,
            OrderLineModel(
              productName: product.productName,
              productID: product.productID,
              unitPriceAtOrder: product.unitPriceAtOrder,
              quantityOrdered: (product.quantityOrdered! + prodQuantity),
            ),
          };
          var current = state.toList();
          for (int i = 0; i < current.length; i++) {
            for (int j = i; j < current.length - 1; j++) {
              if (current[i].productID! > current[j + 1].productID!) {
                OrderLineModel temp = current[i];
                current[i] = current[j + 1];
                current[j + 1] = temp;
              }
            }
          }
          state = current.toSet();
          return;
        }
      }
      state = {...state, product};
    }
  }

  OrderLineModel getProduct(int productID) {
    return state.where((prod) => prod.productID == productID).first;
  }

  void decrementProduct(OrderLineModel product) {
    if (product.quantityOrdered! > 0) {
      for (var prod in state) {
        if (prod.productID == product.productID) {
          removeProduct(prod);
          state = {
            ...state,
            OrderLineModel(
              productID: product.productID,
              productName: product.productName,
              unitPriceAtOrder: product.unitPriceAtOrder,
              quantityOrdered: (product.quantityOrdered! - 1),
            ),
          };
          var current = state.toList();
          for (int i = 0; i < current.length; i++) {
            for (int j = i; j < current.length - 1; j++) {
              if (current[i].productID! > current[j + 1].productID!) {
                OrderLineModel temp = current[i];
                current[i] = current[j + 1];
                current[j + 1] = temp;
              }
            }
          }
          state = current.toSet();
          return;
        }
      }
    }
  }

  void incrementProduct(OrderLineModel product) {
    for (var prod in state) {
      if (prod.productID == product.productID) {
        removeProduct(prod);
        state = {
          ...state,
          OrderLineModel(
            productID: product.productID,
            productName: product.productName,
            unitPriceAtOrder: product.unitPriceAtOrder,
            quantityOrdered: (product.quantityOrdered! + 1),
          ),
        };
        var current = state.toList();
        for (int i = 0; i < current.length; i++) {
          for (int j = i; j < current.length - 1; j++) {
            if (current[i].productID! > current[j + 1].productID!) {
              OrderLineModel temp = current[i];
              current[i] = current[j + 1];
              current[j + 1] = temp;
            }
          }
        }
        state = current.toSet();
        return;
      }
    }
  }

  void removeProduct(OrderLineModel product) {
    if (state.contains(product)) {
      state = state
          .where((prod) => prod.productID != product.productID)
          .toSet();
    }
  }

  void resetCart() {
    state = const {};
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    String timestamp = DateTime.now().toString().replaceAll(':', '-').replaceAll(' ', '_');
    return File('$path/receipt_$timestamp.txt');
  }

  Future<void> writeReceipt(int stallID, String orderNumber, Set<OrderLineModel> items) async {
    final file = await _localFile;
    final sink = file.openWrite();
    sink.write("Stall ID: $stallID\n");
    sink.write("Order Number: $orderNumber\n");
    sink.write("Date: ${DateTime.now()}\n");
    sink.write("--------------------------------\n");
    sink.write("${'Product'.padRight(16)} ${'Qty'.padRight(6)} Price\n");
    double totalCost = 0;
    for(var item in items) {
      String name = (item.productName ?? "Item").padRight(16);
      String qty = (item.quantityOrdered ?? 0).toString().padRight(6);
      sink.write("$name $qty ${item.unitPriceAtOrder}\n");
      totalCost += item.unitPriceAtOrder!;
    }
    sink.write("\n\n--------------------------------\n");
    sink.write("Total Cost: $totalCost\n");
    await sink.close();
  }
}

final cartNotifierProvider =
    NotifierProvider<CartNotifier, Set<OrderLineModel>>(() {
      return CartNotifier();
    });

class OrderPriceNotifier extends Notifier<double> {
  @override
  double build() {
    final cart = ref.watch(cartNotifierProvider);
    return cart.fold(
      0,
      (sum, item) => sum + (item.unitPriceAtOrder! * item.quantityOrdered!),
    );
  }
}

final orderPriceNotifierProvider = NotifierProvider<OrderPriceNotifier, double>(
  () => OrderPriceNotifier(),
);

final orderServiceProvider = Provider<OrderService>((ref) {
  final dio = ref.watch(dioProvider);
  return OrderService(dio: dio);
});

class NameNotifier extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }

  void addName(String? name) {
    if (name == null) {
      state = "Anonymous";
    } else {
      state = name;
    }
  }
}

final nameProvider = NotifierProvider<NameNotifier, String?>(() {
  return NameNotifier();
});
