import 'package:flutter/foundation.dart';

class FavItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  FavItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}

class Fav with ChangeNotifier {
  Map<String, FavItem> _items = {};

  Map<String, FavItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, favItem) {
      total += favItem.price * favItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
    String imageUrl,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingFavItem) => FavItem(
          id: existingFavItem.id,
          title: existingFavItem.title,
          price: existingFavItem.price,
          quantity: existingFavItem.quantity + 1,
          imageUrl: imageUrl,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => FavItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => FavItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity - 1,
                imageUrl: existingCartItem.imageUrl,
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
