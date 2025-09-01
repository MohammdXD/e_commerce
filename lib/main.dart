import 'dart:async';
import 'package:e_commerce/Profile_page.dart';
import 'package:e_commerce/Proudict_page.dart';
import 'package:e_commerce/main_page.dart';
import 'package:e_commerce/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: welcome_Page(),
    //home: ProudictPage(email: ''),
    //home: ProfilePage(),
    //home: MainPage(),
  );
}

// class Tabbar extends StatefulWidget {
//   const Tabbar({super.key});

//   @override
//   State<Tabbar> createState() => _TabbarState();
// }

// class _TabbarState extends State<Tabbar> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Tabbar'),
//           bottom: TabBar(
//             tabs: [
//               Tab(icon: Icon(Icons.home)),
//               Tab(icon: Icon(Icons.search)),
//               Tab(icon: Icon(Icons.person)),
//             ],
//           ),
//         ),

//         body: TabBarView(
//           children: [
//             Center(child: Text('Home')),
//             Center(child: Text('Search')),
//             Center(child: Text('Person')),
//           ],
//         ),
//       ),
//     );
//   }
// }
