import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:e_commerce/favorites_provider.dart';

// Pages
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
  runApp(const MyApp());
}

/// Centralized route names

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/welcomePage': (context) => welcome_Page(),
          '/mainPage': (context) => MainPage(),
          '/productPage': (context) => ProudictPage(email: ''),
          '/loginPage': (context) => logIn_Page(),
          '/profilePage': (context) => ProfilePage(),
          '/communitiesPage': (context) => CommunitiesPage(),
          '/completeProfilePage': (context) => Complete_Profile_Page(),
          '/favoritesPage': (context) => FavoritesPage(),
          '/forgotPasswordPage': (context) => Forgot_Password_Page(),
          '/registerPage': (context) => Register_Page(),
          '/otpPage': (context) => OTP_Page(),
        },
        home: welcome_Page(),
        //home: MainPage()
      ),
    );
  }
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
