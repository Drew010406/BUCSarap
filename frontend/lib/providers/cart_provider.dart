import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_pile_model.dart';

class CartNotifier extends Notifier<Set<ProductPileModel>> {
  @override
  Set<ProductPileModel> build() {
    return const {};
  }

  void addProduct(ProductPileModel product) {
    if (!state.contains(product)) {
      for (var prod in state) {
        if (prod.productID == product.productID) {
          // Walang internet pota diko alam pano baguhin obj from a set
          // Kaya hanap nlng alternative
          // Update: this shit works HAHAHAHAHAHAHAHA
          int prodQuantity = prod.productsQuantity!;
          removeProduct(prod);
          state = {
            ...state,
            ProductPileModel(
              productID: product.productID,
              stallID: product.stallID,
              productsQuantity: (product.productsQuantity! + prodQuantity),
            ),
          };
          var current = state.toList();
          for (int i = 0; i < current.length; i++) {
            for (int j = i; j < current.length - 1; j++) {
              if (current[i].productID! > current[j + 1].productID!) {
                ProductPileModel temp = current[i];
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

  ProductPileModel getProduct(int productID) {
    return state.where((prod) => prod.productID == productID).first;
  }

  void decrementProduct(ProductPileModel product) {
    if (product.productsQuantity! > 0) {
      for (var prod in state) {
        if (prod.productID == product.productID) {
          // Putang talino kong hayup
          removeProduct(prod);
          state = {
            ...state,
            ProductPileModel(
              productID: product.productID,
              stallID: product.stallID,
              productsQuantity: (product.productsQuantity! - 1),
            ),
          };
          var current = state.toList();
          for (int i = 0; i < current.length; i++) {
            for (int j = i; j < current.length - 1; j++) {
              if (current[i].productID! > current[j + 1].productID!) {
                ProductPileModel temp = current[i];
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

  void incrementProduct(ProductPileModel product) {
    for (var prod in state) {
      if (prod.productID == product.productID) {
        removeProduct(prod);
        state = {
          ...state,
          ProductPileModel(
            productID: product.productID,
            stallID: product.stallID,
            productsQuantity: (product.productsQuantity! + 1),
          ),
        };
        var current = state.toList();
        for (int i = 0; i < current.length; i++) {
          for (int j = i; j < current.length - 1; j++) {
            if (current[i].productID! > current[j + 1].productID!) {
              ProductPileModel temp = current[i];
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

  void removeProduct(ProductPileModel product) {
    if (state.contains(product)) {
      state = state
          .where((prod) => prod.productID != product.productID)
          .toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<ProductPileModel>>(
  () {
    return CartNotifier();
  },
);
