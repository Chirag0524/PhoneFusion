import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/inner_screens/product_details.dart';
import 'package:PhoneFusion/widgets/feeds_dialog.dart';

import '../models/product.dart';

// import '../models/product.dart';

// import '../models/product.dart';
class FeedProduct extends StatefulWidget{


  @override
  FeedProductState createState() => FeedProductState();
}

class FeedProductState extends State<FeedProduct>{



  @override
  Widget build(BuildContext context){
    final productsAttribute=Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, ProductDetails.routeName,arguments:productsAttribute.id),
        child: Container(
          width: 210,
          height:280,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                      minHeight: 100,
                      maxHeight: MediaQuery.of(context).size.height*0.201),
                  child: Image.network(productsAttribute.imageUrl!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.only(left: 5,bottom: 2,right: 3),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2,),
                    Text(productsAttribute.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('${productsAttribute.price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 18,color:Colors.black,fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quantity: ${productsAttribute.quantity}',
                          style: TextStyle(fontSize: 12,color:Colors.grey,fontWeight: FontWeight.w600),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () async {
                                showDialog(context: context, builder: (BuildContext context)=>
                                FeedDialog(productId: productsAttribute.id!,));
                              },
                              borderRadius:  BorderRadius.circular(18),
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              )
                          ),)
                      ],),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}