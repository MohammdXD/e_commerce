import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'favorites_provider.dart';

class ProudictPage extends StatefulWidget {
  const ProudictPage({super.key, required this.email});
  final String email;

  @override
  State<ProudictPage> createState() => _ProudictPageState();
}

class _ProudictPageState extends State<ProudictPage> {
  int _selectedIndex = 0;
  bool isLoading = true;
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    print('fetching data...');
    try {
      final url = 'https://fakestoreapi.in/api/products';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final jsonData = jsonDecode(body);

      setState(() {
        products = jsonData['products'];
        isLoading = false;
      });
      print('Fetched data DONE');
    } catch (e) {
      print('Error fetching products: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  final List<Map<String, dynamic>> bannerItems = [
    {
      'image': 'assets/images/Image Banner 2.png',
      'name': 'Smartphone',
      'brandNumber': '18 Brands',
    },
    {
      'image': 'assets/images/Image Banner 3.png',
      'name': 'Fashion',
      'brandNumber': '24 Brands',
    },
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                padding: EdgeInsets.fromLTRB(7, 19, 0, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Search for products",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      gapPadding: 10,
                    ),
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/Cart Icon.svg'),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 2, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/Bell.svg'),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  width: 200,
                  height: 120,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF4b3298),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 150, top: 20),
                        child: Text(
                          "A Summer Suprise",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150, top: 20),
                        child: Text(
                          "Cashback 20%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMenuItem(
                      context,
                      'assets/icons/Flash Icon.svg',
                      "Flash",
                    ),
                    _buildMenuItem(
                      context,
                      'assets/icons/Bill Icon.svg',
                      "Bill",
                    ),
                    _buildMenuItem(
                      context,
                      'assets/icons/Game Icon.svg',
                      "Games",
                    ),
                    _buildMenuItem(
                      context,
                      'assets/icons/Gift Icon.svg',
                      "Daily",
                    ),
                    _buildMenuItem(
                      context,
                      'assets/icons/Discover.svg',
                      "More",
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Special for you',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'See More',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerItems.length,
                            itemBuilder: (context, index) {
                              return productCard(
                                name: bannerItems[index]['name'],
                                brand: bannerItems[index]['brandNumber'],
                                image: bannerItems[index]['image'],
                              );
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Popular Products',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'See More',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Container(
                                height: 275,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    return ApiProduct(product: products[index]);
                                  },
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ApiProduct extends StatefulWidget {
  final dynamic product;

  const ApiProduct({super.key, required this.product});

  @override
  State<ApiProduct> createState() => _ApiProductState();
}

class _ApiProductState extends State<ApiProduct> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final productId = widget.product['id'].toString();
    final isFavorite = favoriteProvider.isFavorite(productId);

    void _toggleFavorite() {
      final productTitle = widget.product['title'] ?? 'No title';
      final productImage = widget.product['image'] ?? '';
      final productPrice =
          double.tryParse(widget.product['price']?.toString() ?? '0') ?? 0;

      final product = Product(
        id: productId,
        image: productImage,
        title: productTitle,
        price: productPrice,
      );

      favoriteProvider.toggleFavorite(product);
    }

    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Image.network(
              widget.product['image'] ?? '',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 50, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.product['title'] ?? 'No title',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.product['price']?.toString() ?? '0'}',
                style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: _toggleFavorite,
                icon: SvgPicture.asset(
                  isFavorite
                      ? "assets/icons/Heart Icon_2.svg"
                      : "assets/icons/Heart Icon.svg",
                  color: isFavorite ? Colors.red : Colors.grey,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget productCard({
  required String name,
  required String brand,
  required String image,
}) {
  return Container(
    width: 300,
    margin: EdgeInsets.only(right: 16),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 10,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    brand,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildMenuItem(BuildContext context, String iconPath, String title) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(16),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: title,
            child: Container(
              width: 52,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(iconPath, width: 24, height: 24),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
