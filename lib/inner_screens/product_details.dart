import 'package:PhoneFusion/consts/colors.dart';
import 'package:PhoneFusion/consts/my_icons.dart';
import 'package:PhoneFusion/models/product.dart';
import 'package:PhoneFusion/provider/cart_provider.dart';
import 'package:PhoneFusion/provider/dark_theme_provider.dart';
import 'package:PhoneFusion/provider/products.dart';
import 'package:PhoneFusion/screens/cart.dart';
import 'package:PhoneFusion/screens/wishlist.dart';
import 'package:PhoneFusion/widgets/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favs_provider.dart';
import 'package:badges/badges.dart' as badges;
// import 'package:flutter/src/material/badge.dart';
class ProductDetails extends StatefulWidget {
   // Constructor
  static const routeName = '/ProductDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final favsProvider=Provider.of<FavsProvider>(context);
    final cartProvider=Provider.of<CartProvider>(context);
    final themeState = Provider.of<DarkThemeProvider>(context);
    final productsProvider=Provider.of<Products>(context,listen: false);
    List<Product> productsList=productsProvider.products;
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productAttr=productsProvider.findById(productId);
    // final List<Product> suggestedProducts = ModalRoute.of(context)!.settings.arguments as List<Product>;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
              productAttr.imageUrl!,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //padding: const EdgeInsets.all(16.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child:  Text(
                                productAttr.title!,
                                maxLines: 2,
                                style: const TextStyle(
                                  // color: Theme.of(context).textSelectionColor,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${productAttr.price}',
                              style: TextStyle(
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : ColorsConsts.subtitle,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 3.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          productAttr.description!,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21.0,
                            color: themeState.darkTheme
                                ? Theme.of(context).disabledColor
                                : ColorsConsts.subtitle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _details(themeState.darkTheme, 'Brand: ', productAttr.brand!),
                      _details(themeState.darkTheme, 'Quantity: ', '${productAttr.quantity}'),
                      _details(themeState.darkTheme, 'Category: ', productAttr.productCategoryName!),
                      _details(themeState.darkTheme, 'Popularity: ', productAttr.isPopular!?'Popular':'Barely Known' as String),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),

                      // const SizedBox(height: 15.0),
                      Container(
                        color: Theme.of(context).colorScheme.background,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                    color: Theme.of(context).textSelectionTheme.selectionColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Be the first review!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : ColorsConsts.subtitle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Text(
                    'Suggested products:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 267,
                  child: ListView.builder(
                    itemCount: productsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return  ChangeNotifierProvider.value(
                        value:productsList[index] ,
                        child: FeedProduct(

                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "DETAIL",
                  style:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                actions: <Widget>[
                  Consumer<FavsProvider>(
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
                          color: ColorsConsts.cartColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Cart.routeName);
                        },
                      ),
                    ),
                  ),

                ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(side: BorderSide.none),
                        backgroundColor: Colors.redAccent.shade400,
                        foregroundColor: Colors.white,
                      ),
                      onPressed:cartProvider.getCartItems.containsKey(productId)?(){}: () {
                        cartProvider.addProductToCart(productId, productAttr.price!, productAttr.title!, productAttr.imageUrl!);
                      },
                      child: Text(
                        cartProvider.getCartItems.containsKey(productId)?'In Cart': 'Add to Cart'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),

                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).textSelectionTheme.selectionColor, shape: const RoundedRectangleBorder(side: BorderSide.none),
                        backgroundColor: Theme.of(context).colorScheme.background,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Buy now'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.green.shade700,
                            size: 19,
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: themeState.darkTheme
                        ? Theme.of(context).disabledColor
                        : ColorsConsts.subtitle,
                    height: 50,
                    child: InkWell(
                      splashColor: ColorsConsts.favColor,
                      onTap: () {
                        favsProvider.addAndRemoveFromFav(productId, productAttr.price!, productAttr.title!, productAttr.imageUrl!);
                      },
                      child: Center(
                        child: Icon(
                          favsProvider.getFavsItems.containsKey(productId)?Icons.favorite:MyAppIcons.wishlist,
                          color: favsProvider.getFavsItems.containsKey(productId)?Colors.red: ColorsConsts.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ],
      ),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 21.0),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
              color: themeState
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
