import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProudictPage extends StatefulWidget {
  const ProudictPage({super.key, required this.data});
  final String data;

  @override
  State<ProudictPage> createState() => _ProudictPageState();
}

class _ProudictPageState extends State<ProudictPage> {
  dynamic receivedData;

  void initState() {
    super.initState();
    // Store the received data when widget is created
    receivedData = widget.data;
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
      "productText": "Smart Watch",
      "productPrice": "\$200",
      "isFavorit": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 👇 SliverAppBar replaces AppBar
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true, // appears when you scroll up
              snap: true, // smooth snap
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                width: 300,
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Cart Icon.svg'),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Bell.svg'),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),

            // 👇 Body content as SliverList
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  width: 200,
                  height: 120,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF4b3298),
                    border: Border.all(color: Colors.grey.shade300),
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
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Popular Products section 1
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
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

                      Container(
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

                      // Popular Products section 2
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
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

                      Container(
                        height: 275,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return popularProduct(
                              productImage: products[index]['productImage'],
                              productText: products[index]['productText'],
                              productPrice: products[index]['productPrice'],
                              isFavorit: products[index]['isFavorit'],
                            );
                          },
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

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFff7643),
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'chats'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Custom widget for the product card
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

// Custom widget for popular product
Widget popularProduct({
  required String productImage,
  required String productText,
  required String productPrice,
  required bool isFavorit,
}) {
  return Container(
    width: 180,
    margin: EdgeInsets.only(right: 15, left: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Image.asset(productImage, width: 150, height: 150),
        ),
        const SizedBox(height: 10),
        Text(
          productText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productPrice,
              style: const TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.favorite,
                color: isFavorit ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ],
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
