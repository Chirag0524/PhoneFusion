// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/provider/products.dart';
import 'package:PhoneFusion/screens/wishlist.dart';
import 'package:PhoneFusion/widgets/feeds_product.dart';
import 'package:badges/badges.dart' as badges;
import '../consts/colors.dart';
import '../consts/my_icons.dart';
import '../models/product.dart';
import '../provider/cart_provider.dart';
import '../provider/favs_provider.dart';
import 'bottom_bar.dart';
import 'cart.dart';
class Feeds extends StatelessWidget{
   const Feeds({super.key});
  static const String routeName='/Feeds';

  @override
  Widget build (BuildContext context){
    final popular = ModalRoute.of(context)?.settings.arguments as String?;
    final productsProvider=Provider.of<Products>(context);
    List<Product> productsList=productsProvider.products;
    // if (kDebugMode) {
    //   print('Popular Products:$popular');
    // }
    if(popular=="Popular"){
      productsList=productsProvider.popularProducts;
    }
    return WillPopScope(
        onWillPop: () async {
          // Navigate back to the BottomBarScreen when the back button or gesture is triggered
          Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
          return true; // Return true to allow the back navigation
        },
    child:  Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).cardColor,
        title:Text('Feeds'),
        actions: [Consumer<FavsProvider>(
          builder: (_,favs,ch)=>badges.Badge(
            badgeStyle: badges.BadgeStyle(
              badgeColor: ColorsConsts.carBadgeColor,
            ),

            badgeAnimation: badges.BadgeAnimation.slide(toAnimate: true),
            position: badges.BadgePosition.topEnd(top: 5, end: 7),
            badgeContent: Text(
              favs.getFavsItems.length.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(
                MyAppIcons.wishlist,
                color: ColorsConsts.favColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Wishlist.routeName);
              },
            ),
          ),
        ),
          Consumer<CartProvider>(
            builder: (_,cart,ch)=>badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: ColorsConsts.carBadgeColor,
              ),

              badgeAnimation: badges.BadgeAnimation.slide(toAnimate: true),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(
                cart.getCartItems.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(
                  MyAppIcons.cart,
                  color: ColorsConsts.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(Cart.routeName);
                },
              ),
            ),
          ),],
      ),
      body:GridView.count(crossAxisCount: 2,
        childAspectRatio: 210/315,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(productsList.length, (index) {
          return ChangeNotifierProvider.value(
            value: productsList[index],
            child: FeedProduct(

            ),
          );
        }),)
    ));
  }
}