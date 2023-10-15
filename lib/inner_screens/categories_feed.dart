import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/provider/products.dart';
import 'package:PhoneFusion/widgets/feeds_product.dart';

import '../models/product.dart';
class CategoriesFeedsScreen extends StatelessWidget{
  const CategoriesFeedsScreen({super.key});
  static const String routeName='/CategoriesFeedsScreen';

  @override
  Widget build (BuildContext context){
    final categoryName = ModalRoute.of(context)?.settings.arguments as String?;
    final productsProvider=Provider.of<Products>(context,listen: false);
    final productsList=productsProvider.findByCategory(categoryName!);
    // List<Product> filteredProducts;
    // if (categoryName != null) {
    //   filteredProducts = productsList
    //       .where((product) => product.productCategoryName == categoryName)
    //       .toList();
    // } else {
    //   filteredProducts = productsList;
    // }
    return  Scaffold(
        body:GridView.count(crossAxisCount: 2,
          childAspectRatio: 210/315,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: List.generate(productsList!.length, (index) {
            return ChangeNotifierProvider.value(
              value: productsList[index],
              child: FeedProduct(

              ),
            );
          }),)
    );
  }
}