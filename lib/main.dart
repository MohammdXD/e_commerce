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
class AppRoutes {
  static const welcome = '/';
  static const main = '/main';
  static const profile = '/profile';
  static const product = '/product';
  static const communities = '/communities';
  static const completeProfile = '/complete_profile';
  static const favorites = '/favorites';
  static const forgotPassword = '/forgot_password';
  static const register = '/register';
  static const otp = '/otp';
  static const login = '/login';
}

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
        initialRoute: AppRoutes.welcome,
        routes: {
          AppRoutes.welcome: (context) => const welcome_Page(),
          AppRoutes.main: (context) => const MainPage(),
          AppRoutes.profile: (context) => const ProfilePage(),
          AppRoutes.product: (context) => const ProudictPage(email: ''),
          AppRoutes.communities: (context) => const CommunitiesPage(),
          AppRoutes.completeProfile: (context) => const Complete_Profile_Page(),
          AppRoutes.favorites: (context) => const FavoritesPage(),
          AppRoutes.forgotPassword: (context) => const Forgot_Password_Page(),
          AppRoutes.register: (context) => const Register_Page(),
          AppRoutes.otp: (context) => const OTP_Page(),
          AppRoutes.login: (context) => const logIn_Page(),
        },
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
