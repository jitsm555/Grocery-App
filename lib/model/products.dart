import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  static String dummyDesc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

  List<Product> _items = [
    /// Fruits Products
    Product(
      id: 'p1',
      title: 'Apple/kg',
      price: 80,
      imageUrl:
          'shopping_assets/images/fruits/apple.png',
      description: dummyDesc,
    ),

    Product(
      id: 'p5',
      title: 'Orange/dz',
      price: 60,
      imageUrl:
      'shopping_assets/images/fruits/orange.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p6',
      title: 'PineApple/pc',
      price: 50,
      imageUrl:
      'shopping_assets/images/fruits/pineapple.png',
      description: dummyDesc,
    ),

    Product(
      id: 'p2',
      title: 'Banana/dz',
      price: 40,
      imageUrl:
      'shopping_assets/images/fruits/banana.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p3',
      title: 'Lemon/dz',
      price: 30,
      imageUrl:
      'shopping_assets/images/fruits/lemon.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p4',
      title: 'Mango/dz',
      price: 50,
      imageUrl:
      'shopping_assets/images/fruits/mango.png',
      description: dummyDesc,
    ),
    /// Vegetable Products
    Product(
      id: 'p7',
      title: 'Carrot/kg',
      price: 20,
      imageUrl:
      'shopping_assets/images/vegetables/carrot.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p8',
      title: 'Cucumber/kg',
      price: 40,
      imageUrl:
      'shopping_assets/images/vegetables/cucumber.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p9',
      title: 'Onion/kg',
      price: 90,
      imageUrl:
      'shopping_assets/images/vegetables/onion.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p10',
      title: 'Potato/kg',
      price: 60,
      imageUrl:
      'shopping_assets/images/vegetables/potato.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p11',
      title: 'RedChillies/kg',
      price: 50,
      imageUrl:
      'shopping_assets/images/vegetables/red_chillies.png',
      description: dummyDesc,
    ),
    Product(
      id: 'p12',
      title: 'Tomato/kg',
      price: 40,
      imageUrl:
      'shopping_assets/images/vegetables/tomato.png',
      description: dummyDesc,
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
