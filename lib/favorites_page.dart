import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<Map<String, dynamic>> products = [
    {
      "productImage": "assets/images/Image Popular Product 1.png",
      "productText": "Wireless Controller for PS4",
      "productPrice": "\$120",
      "isFavorit": true,
    },
    {
      "productImage": "assets/images/Image Popular Product 2.png",
      "productText": "Nike Sport White - Man Pant",
      "productPrice": "\$80",
      "isFavorit": false,
    },
    {
      "productImage": "assets/images/Image Popular Product 3.png",
      "productText": "Helmet sport for biker - red",
      "productPrice": "\$200",
      "isFavorit": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 5,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7, // 👈 controls item height/width ratio
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return popularProduct(
                productImage: product["productImage"],
                productText: product["productText"],
                productPrice: product["productPrice"],
                isFavorit: product["isFavorit"],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget popularProduct({
  required String productImage,
  required String productText,
  required String productPrice,
  required bool isFavorit,
}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Image.asset(productImage, width: 150, height: 120),
        ),
        const SizedBox(height: 8),
        Text(
          productText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productPrice,
              style: const TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: isFavorit ? Colors.red : Colors.grey,
                width: 22,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
