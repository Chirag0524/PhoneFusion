import 'package:PhoneFusion/screens/checkout1.dart';
// import 'package:PhoneFusion/screens/confirmorder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/inner_screens/brand_navigation_rail.dart';
import 'package:PhoneFusion/inner_screens/categories_feed.dart';
import 'package:PhoneFusion/inner_screens/product_details.dart';
import 'package:PhoneFusion/provider/cart_provider.dart';
import 'package:PhoneFusion/provider/dark_theme_provider.dart';
import 'package:PhoneFusion/provider/favs_provider.dart';
import 'package:PhoneFusion/provider/products.dart';
import 'package:PhoneFusion/screens/auth/login.dart';
import 'package:PhoneFusion/screens/auth/sign_up.dart';
// import 'package:untitled1/screens/cart.dart';
import 'package:PhoneFusion/screens/bottom_bar.dart';
import 'package:PhoneFusion/screens/cart.dart';
import 'package:PhoneFusion/screens/feeds.dart';
import 'package:PhoneFusion/screens/landing_page.dart';
import 'package:PhoneFusion/screens/wishlist.dart';
// import 'package:untitled1/screens/home.dart';

import 'consts/theme_data.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
  themeChangeProvider.darkTheme= await themeChangeProvider.darkThemePreference.getTheme();
}
@override
  void initState() {
  getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_){
        return themeChangeProvider;
      }),
      ChangeNotifierProvider(create: (_)=>
        Products(),
      ),
      ChangeNotifierProvider(create: (_)=>
          CartProvider(),
      ),
      ChangeNotifierProvider(create: (_)=>
          FavsProvider(),
      )
    ],
    child:Consumer<DarkThemeProvider>(

      builder:(context,themeData,child){
        return MaterialApp(
          title:'E-Commerce',
          theme:Styles.themeData(themeChangeProvider.darkTheme,context),
           home:LandingPage(),
          // initialRoute:'/BottomBarScreen()',
          routes: {
            // '/': (context) => BottomBarScreen(),
            "/brand_navigation_rail": (context) => BrandNavigationRailScreen(),
            "/Feeds": (context) => Feeds(),
            "/cart": (context) => Cart(),
            "/wishlist":(context)=>Wishlist(),
            '/ProductDetails':(context)=>ProductDetails(),
            "/CategoriesFeedsScreen":(context)=>CategoriesFeedsScreen(),
            "/LoginScreen":(context)=>LoginScreen(),
            "/SignUpScreen":(context)=>SignUpScreen(),
            "/BottomBarScreen":(context)=>BottomBarScreen(),
            "/CheckoutScreen":(context)=>CheckoutScreen(),
            // Add other routes if needed
          },
        );
      }
    ));

  }
}
