import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:PhoneFusion/provider/favs_provider.dart';
// import 'package:PhoneFusion/provider/favs_provider.dart';

import '../models/favs_attr.dart';
import '../services/global_method.dart';


class WishlistFull extends StatefulWidget{
  final String? productId;

  const WishlistFull({ this.productId});

  @override
  _WishlistFullState createState() => _WishlistFullState();
}
class _WishlistFullState extends State<WishlistFull>{
  @override
  Widget build(BuildContext context){
    final favsattr=Provider.of<FavsAttr>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(right: 30.0,bottom: 10.0,top: 10.0),
          child: Material(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network(favsattr.imageUrl!),

                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                     Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              favsattr.title!,
                                  style: const TextStyle(
                                    fontSize: 16.0,fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              '${favsattr.price!}',
                              style:const TextStyle(
                                  fontSize: 18.0,fontWeight: FontWeight.bold) ,
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.productId!),
      ],
    );
  }
  Widget positionedRemove(String productId){
    final favsProvider = Provider.of<FavsProvider>(context);
    GlobalMethod globalMethod=new GlobalMethod();
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: const EdgeInsets.all(0.0),
          color: ColorsConsts.favColor,
          child: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: ()=>{
            globalMethod.showDialogg('Remove Item!', 'This product will be removed from your wishlist',()=>favsProvider.removeItem(productId), context)
          }
        ),
      ),
    );
  }
}