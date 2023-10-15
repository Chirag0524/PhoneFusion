import 'package:flutter/cupertino.dart';
import 'package:PhoneFusion/models/cart_attr.dart';

class CartProvider with ChangeNotifier{
  final Map<String, CartAttr> _cartItems={};

  Map<String, CartAttr> get getCartItems{
    return {..._cartItems};
  }

  double get totalAmount{
    var total=0.0;
    _cartItems.forEach((key, value) {total+=(value.price!* value.quantity!) ;});
    return total;
  }

  void addProductToCart(String productId,double price,String title,String imageUrl){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (existingCartItem) => CartAttr(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        imageUrl: existingCartItem.imageUrl,
        quantity: existingCartItem.quantity!+1,
      ));
    }else{
        _cartItems.putIfAbsent(productId,() => CartAttr(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ));

    }
    notifyListeners();
  }
  void reduceItemToCart(String productId){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (existingCartItem) => CartAttr(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        imageUrl: existingCartItem.imageUrl,
        quantity: existingCartItem.quantity!-1,
      ));
    }
    notifyListeners();
  }

  void removeItem(String productId){
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }
}