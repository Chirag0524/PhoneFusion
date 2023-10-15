import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:PhoneFusion/consts/my_icons.dart';
import 'package:PhoneFusion/provider/cart_provider.dart';
import 'package:PhoneFusion/services/global_method.dart';
import 'package:PhoneFusion/widgets/cart_empty.dart';
import 'package:PhoneFusion/widgets/cart_full.dart';
class Cart extends StatelessWidget{
  const Cart({super.key});
  static const String routeName="/cart";

  @override
Widget build (BuildContext context){
    GlobalMethod globalmethod=GlobalMethod();
    final cartProvider=Provider.of<CartProvider>(context);
    return WillPopScope(
        onWillPop: () async {
          // Navigate back to the BottomBarScreen when the back button or gesture is triggered
          Navigator.pushReplacementNamed(context, '/BottomBarScreen');
          return true; // Return true to allow the back navigation
        },
    child: cartProvider.getCartItems.isEmpty? const Scaffold(
    body: CartEmpty()
    ):Scaffold(
      bottomSheet: checkOutSection(context,cartProvider.totalAmount),
      appBar:AppBar(
        // backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Cart (${cartProvider.getCartItems.length})'),
        actions: [IconButton(onPressed: (){
          globalmethod.showDialogg('Clear Cart!', 'Your cart will be cleared!',()=> cartProvider.clearCart(),context);
        },
            icon: const Icon(MyAppIcons.trash),)],),
      body: Container(
        margin: const EdgeInsets.only(bottom: 60),
        child: ListView.builder(
          itemCount: cartProvider.getCartItems.length,
          itemBuilder: (BuildContext context,int index){
          return  ChangeNotifierProvider.value(
            value: cartProvider.getCartItems.values.toList()[index],
            child: CartFull(
              productId:cartProvider.getCartItems.keys.toList()[index],
              // id: cartProvider.getCartItems.values.toList()[index].id,
              // productId: cartProvider.getCartItems.keys.toList()[index],
              // price: cartProvider.getCartItems.values.toList()[index].price,
              // title: cartProvider.getCartItems.values.toList()[index].title,
              // imageUrl: cartProvider.getCartItems.values.toList()[index].imageUrl,
              // quantity: cartProvider.getCartItems.values.toList()[index].quantity,
            ),
          );
        },),
      )
    ));
}
Widget checkOutSection(BuildContext context,double subtotal){
    return Container(
      decoration: const BoxDecoration(
        border: Border(top:BorderSide(color:Colors.grey,width: 0.5),),
      ),
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          Expanded(
            flex:2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    ColorsConsts.gradientLStart,
                    ColorsConsts.gradientLEnd,
                  ],stops: const [0.0, 0.8
                  ]),
                ),
                child: Material(

                  color:Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: (){
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Checkout',textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor,fontSize: 18,fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              )
          ),
          const Spacer(),
        Text('Total:',style:
        TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor,
            fontSize: 18,fontWeight: FontWeight.w600)
          ,),
          Text('${subtotal.toStringAsFixed(3)}',style:
        const TextStyle(color: Colors.blue,
            fontSize: 18,fontWeight: FontWeight.w500),
        ),
        ],
        ),
      ),);
}
}