import 'package:flutter/material.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:PhoneFusion/screens/cart.dart';
import 'package:PhoneFusion/screens/feeds.dart';
import 'package:PhoneFusion/screens/wishlist.dart';


class BackLayerMenu extends StatelessWidget{
  const BackLayerMenu({super.key});

  @override
  Widget build(BuildContext context){
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsConsts.starterColor,
                ColorsConsts.endColor,
              ],
              begin:const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops:const [0.0,1.0],
              tileMode: TileMode.clamp),
          ),
        ),
        Positioned(
          top: -100.0,
          left: 140.0,
          child: Transform.rotate(
              angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 100.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 300,
            ),
          ),
        ),
        Positioned(
          top: -50.0,
          left: 60.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 0.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: NetworkImage('https://sc04.alicdn.com/kf/HTB1jA_RXrj1gK0jSZFuq6ArHpXab.jpg_350x350.jpg'),
                          fit: BoxFit.fill,
                        )),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                content(context,(){navigateTo(context,  Feeds.routeName );},'Feeds'),
                const SizedBox(height: 10.0),
                content(context,(){navigateTo(context, Wishlist.routeName);},'Wishlist'),
                const SizedBox(height: 10.0),
                content(context,(){navigateTo(context,  Cart.routeName );},'Cart'),
                const SizedBox(height: 10.0),
                // content(context,(){navigateTo(context, Feeds.routeName);},'Upload a new Product'),
              ],
            ),
          ),
        ),
      ],
    );
  }
  void navigateTo(BuildContext context,String routeName){
    Navigator.of(context).pushNamed(
         routeName,
    );
  }
  Widget content(BuildContext context,VoidCallback fct,String text){
    return InkWell(
      onTap: fct,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:const EdgeInsets.all(16.0),
            child:Text(
                text,
              style: const TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          const Icon(Icons.rss_feed_rounded)
        ],
      ),
    );
  }
}