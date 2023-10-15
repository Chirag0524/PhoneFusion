import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/provider/favs_provider.dart';
import 'package:PhoneFusion/services/global_method.dart';
import 'package:PhoneFusion/widgets/wishlist_empty.dart';
import 'package:PhoneFusion/widgets/wishlist_full.dart';

import '../consts/my_icons.dart';
import 'bottom_bar.dart';
class Wishlist extends StatelessWidget{
  const Wishlist({super.key});
  static const String routeName="/wishlist";

  @override
  Widget build (BuildContext context){

    final favsProvider=Provider.of<FavsProvider>(context);
    GlobalMethod globalMethod=GlobalMethod();
    return WillPopScope(
        onWillPop: () async {
          // Navigate back to the BottomBarScreen when the back button or gesture is triggered
          Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
          return true; // Return true to allow the back navigation
        },
    child: favsProvider.getFavsItems.isEmpty? const Scaffold(
        body: WishlistEmpty()
    ):Scaffold(
        appBar: AppBar(
          title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
            actions: [IconButton(onPressed: (){
              globalMethod.showDialogg('Clear Wishlist!', 'Your wishlist will be cleared!',()=> favsProvider.clearFavs(),context);
            },
              icon: const Icon(MyAppIcons.trash),)]
        ),
        body: ListView.builder(
          itemCount: favsProvider.getFavsItems.length,
          itemBuilder: (BuildContext context,int index){
          return ChangeNotifierProvider.value(
              value: favsProvider.getFavsItems.values.toList()[index],
              child: WishlistFull(
                productId: favsProvider.getFavsItems.keys.toList()[index],
              ));
        },
        ),
    ));
  }
}