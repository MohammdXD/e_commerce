import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'welcomePage.dart';
import 'main_page.dart';
import 'Proudict_page.dart';
import 'login_page.dart';
import 'Profile_page.dart';
import 'communities_page.dart';
import 'complete_Profile_Page.dart';
import 'favorites_page.dart';
import 'forgot_Password_Page.dart';
import 'register_Page.dart';
import 'otp_Page.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: welcome_Page(),
    routes: {
      '/main': (context) => MainPage(),
      '/profile': (context) => ProfilePage(),
      '/product': (context) => ProudictPage(email: ''),
      '/communities': (context) => CommunitiesPage(),
      '/complete_profile': (context) => Complete_Profile_Page(),
      '/favorites': (context) => FavoritesPage(),
      '/forgot_password': (context) => Forgot_Password_Page(),
      '/register': (context) => Register_Page(),
      '/otp': (context) => OTP_Page(),
      '/login': (context) => logIn_Page(),
    },
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
