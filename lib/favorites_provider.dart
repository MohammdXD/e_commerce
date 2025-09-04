import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String image;
  final String title;
  final double price;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class FavoriteProvider with ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  void addToFavorites(Product product) {
    if (!_favoriteProducts.any((p) => p.id == product.id)) {
      _favoriteProducts.add(product);
      notifyListeners();
    }
  }

  void removeFromFavorites(String productId) {
    _favoriteProducts.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _favoriteProducts.any((product) => product.id == productId);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product.id)) {
      removeFromFavorites(product.id);
    } else {
      addToFavorites(product);
    }
  }
}
