import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProducts = favoriteProvider.favoriteProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: favoriteProducts.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      "No favorites yet",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Tap the heart icon to add products to favorites",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(left: 20, right: 10, top: 10),
                child: GridView.builder(
                  itemCount: favoriteProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = favoriteProducts[index];
                    return FavoriteProduct(product: product);
                  },
                ),
              ),
      ),
    );
  }
}

class FavoriteProduct extends StatelessWidget {
  final Product product;

  const FavoriteProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    void _removeFromFavorites() {
      favoriteProvider.removeFromFavorites(product.id);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Image.network(
              product.image,
              width: 150,
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 50, color: Colors.grey);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: _removeFromFavorites,
                  icon: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: Colors.red,
                    width: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
