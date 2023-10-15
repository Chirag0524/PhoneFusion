import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/inner_screens/product_details.dart';
import 'package:PhoneFusion/models/product.dart';
import 'package:PhoneFusion/provider/cart_provider.dart';
import 'package:PhoneFusion/provider/favs_provider.dart';
// import 'package:PhoneFusion/provider/products.dart';

class PopularProducts extends StatelessWidget{
  const PopularProducts({super.key});


  // final String imageUrl;
  // final String title;
  // final String description;
  // final double price;
  // const PopularProducts({super.key,required this.imageUrl,required this.title,required this.description,required this.price});

  @override
  Widget build(BuildContext context){
    final cartProvider=Provider.of<CartProvider>(context);
    final favsProvider=Provider.of<FavsProvider>(context);
    final productAttributes=Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius:const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ) ,
            onTap: ()=>Navigator.pushNamed(context, ProductDetails.routeName,arguments: productAttributes.id),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 190,
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:NetworkImage(productAttributes.imageUrl!),
                          fit: BoxFit.contain)),
                    ),
                     Positioned(
                        right: 12,
                        top: 10,
                        child:Icon(
                          Icons.star_border_outlined,
                          color:Colors.blueGrey,
                        ),
                    ),
                     Positioned(
                      right: 12,
                      top: 10,
                      child:Icon(
                        favsProvider.getFavsItems.containsKey(productAttributes.id)?Icons.star:Icons.star_border_outlined,
                        color: favsProvider.getFavsItems.containsKey(productAttributes.id)? Colors.red:Colors.blueGrey,
                      ),
                    ),
                    Positioned(
                      right: 12,
                      bottom: 32.0,
                      child:Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Theme.of(context).colorScheme.background,
                        child: Text(
                          '${productAttributes.price}',
                          style: TextStyle(
                            color: Theme.of(context).textSelectionTheme.selectionColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        productAttributes.title!,
                        maxLines: 1,
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Expanded(
                          flex:5,
                          child: Text(
                            productAttributes.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.grey[800]),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap:cartProvider.getCartItems.containsKey(productAttributes.id)?(){}: () {
                                cartProvider.addProductToCart(productAttributes.id!, productAttributes.price!, productAttributes.title!, productAttributes.imageUrl!);
                              },
                              borderRadius: BorderRadius.circular(30.0),
                              child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  cartProvider.getCartItems.containsKey(productAttributes.id,)?Icons.check_circle_outline_sharp: Icons.add_shopping_cart,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
