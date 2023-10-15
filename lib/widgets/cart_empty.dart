import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:PhoneFusion/provider/dark_theme_provider.dart';

import '../screens/feeds.dart';

class CartEmpty extends StatelessWidget{
  const CartEmpty({super.key});

  @override
  Widget build (BuildContext context){
    final themeChange=Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top:60),
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.4,
          decoration: const BoxDecoration(
            image:DecorationImage(
              fit: BoxFit.fill,
              image:AssetImage('assets/images/empty_cart.png')
            )
          )
        ),
        Text(
          'Your Cart Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            color:Theme.of(context).textSelectionTheme.selectionColor,
            fontSize: 36,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Looks Like You didn\'t \n add anything to your cart yet',
          textAlign: TextAlign.center,
          style: TextStyle(
              color:themeChange.darkTheme?Theme.of(context).disabledColor:ColorsConsts.subtitle,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
      const SizedBox(
        height: 30,
      ),
      Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.05,
            child: ElevatedButton(
            onPressed: () {Navigator.of(context).pushNamed(Feeds.routeName);},
            style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.red),
            ),
            backgroundColor: Colors.redAccent,
            ),
            child: Text(
            'shop now'.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Theme.of(context).textSelectionTheme.selectionColor,
            fontSize: 26,
            fontWeight: FontWeight.w600,
            ),
            ),
            ),
            ),
          ],
        ),
      )
      ],
    );
  }
}