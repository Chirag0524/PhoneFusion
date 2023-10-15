import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/inner_screens/product_details.dart';
import 'package:PhoneFusion/models/product.dart';

class BrandsNavigationRail extends StatelessWidget{
  const BrandsNavigationRail({super.key});

  @override
  Widget build(BuildContext context){
    final productsAttribute=Provider.of<Product>(context);
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, ProductDetails.routeName,arguments: productsAttribute.id),
      child: Container(
        padding: const EdgeInsets.only(left:5.0,right: 5.0),
        margin: const EdgeInsets.only(right: 20.0,bottom: 5,top: 18),
        constraints: const BoxConstraints(
          minHeight: 150,minWidth: double.infinity,maxHeight: 175),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    image:  DecorationImage(
                      image:NetworkImage(productsAttribute.imageUrl!),
                        fit: BoxFit.contain),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 2.0)
                    ],
                  ),
                ),
            ),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0)
                    ]),
                width: 170,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productsAttribute.title!,
                      maxLines: 4,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textSelectionTheme.selectionColor),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                     FittedBox(
                      child: Text('${productsAttribute.price}',
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                     Text(productsAttribute.productCategoryName!,
                        style: const TextStyle(color: Colors.grey, fontSize: 18.0)),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
