import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:PhoneFusion/inner_screens/product_details.dart';
import 'package:PhoneFusion/models/cart_attr.dart';
import 'package:PhoneFusion/provider/cart_provider.dart';
import 'package:PhoneFusion/provider/dark_theme_provider.dart';
import 'package:PhoneFusion/services/global_method.dart';

class CartFull extends StatefulWidget{
  final String? productId;

  const CartFull({this.productId});
  // final String? id;
  // final String? productId;
  // final double? price;
  // final int? quantity;
  // final String? title;
  // final String? imageUrl;
  //
  //
  // const CartFull({
  //   required this.id,
  //   required this.productId,
  //   required this.price,
  //   required this.quantity,
  //   required this.title,
  //   required this.imageUrl});

  @override
  CartFullState createState() => CartFullState();
}
class CartFullState extends State<CartFull>{

  @override
  Widget build(BuildContext context){
    GlobalMethod globalMethod=GlobalMethod();
   final  themeChange=Provider.of<DarkThemeProvider>(context);
   final cartAttr=Provider.of<CartAttr>(context);
   final cartprovider=Provider.of<CartProvider>(context);
   double subTotal=cartAttr.price!*cartAttr.quantity!;
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, ProductDetails.routeName,arguments: widget.productId),
      child: Container(
        height:138,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          color: Colors.lightBlueAccent,
        ),
          child: Row(children: [
            Container(width: 140,
              decoration:  BoxDecoration(image:DecorationImage(
                image: NetworkImage(cartAttr.imageUrl!),
                // fit: BoxFit.fill,
              ),),),
            Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                       Flexible(
                          child: Text(cartAttr.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,fontSize:15
                            ),),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: (){
                            globalMethod.showDialogg('Remove Item!', 'Product will be remove from the cart!',()=> cartprovider.removeItem(widget.productId!),context);
                            // cartprovider.removeItem(widget.productId!);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: const Icon(
                              FeatherIcons.trash2,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                    ),
                     Row(children: [
                      const Text('Price:'),
                      const SizedBox(width: 5,),
                      Text('${cartAttr.price}/-',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                      ),
                    ],
                    ),
                      Row(children: [
                       Text('SubTotal:'),
                       SizedBox(width: 5,),
                      FittedBox(
                        child: Text('${subTotal.toStringAsFixed(2)}/-',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                    ),
                    Row(children: [
                      Text('Ships Free',style:TextStyle(color:themeChange.darkTheme?Colors.brown.shade900:themeChange.darkTheme?Colors.brown.shade900:Theme.of(context).textSelectionTheme.selectionColor),),
                      const Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: cartAttr.quantity!<2?null:(){
                            cartprovider.reduceItemToCart(widget.productId!);
                          },
                          child: Container(
                            child:  Padding(
                              padding:const EdgeInsets.all(5.0),
                              child: Icon(
                                FeatherIcons.minusCircle,
                                color:cartAttr.quantity!<2?Colors.grey : Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation:12,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.12,
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              ColorsConsts.gradientLStart,
                              ColorsConsts.gradientLEnd,
                            ],stops: const [0.0, 0.7
                            ]),
                          ),
                          child:  Text(cartAttr.quantity.toString(),textAlign: TextAlign.center,),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: (){
                            cartprovider.addProductToCart(widget.productId!,cartAttr.price!,cartAttr.title!,cartAttr.imageUrl!);
                          },
                          child: Container(
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                FeatherIcons.plusCircle,
                                color: Colors.green,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    )

                  ],),
                )
            )
          ],),
      ),
    );
  }
}