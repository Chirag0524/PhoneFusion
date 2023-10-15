import 'package:flutter/material.dart';
import 'package:PhoneFusion/inner_screens/categories_feed.dart';
import 'package:PhoneFusion/screens/feeds.dart';

class CategoryWidget extends StatefulWidget{
  final int index;

  const CategoryWidget({super.key, required this.index});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List <Map<String,String>> categories=[
    {
      'categoryName':'Phones',
      'categoryImagePath':'assets/images/catPhones.jpg'
    },
    {
      'categoryName':'Smart Watch',
      'categoryImagePath':'assets/images/catSmartWatch.webp'
    },
    {
     'categoryName':'Headsets',
     'categoryImagePath':'assets/images/catBuds.jpg'
    },
    {
      'categoryName':'Power Banks',
      'categoryImagePath':'assets/images/catPowerBanks.jpg'
    },
    {
      'categoryName':'Cables & Chargers',
      'categoryImagePath':'assets/images/catCableandChargers.jpg'
    },
    {
      'categoryName':'Cases & Covers',
      'categoryImagePath':'assets/images/catCovers.webp'
    },
    {
      'categoryName':'Screen Protectors',
      'categoryImagePath':'assets/images/catProtector.webp'
    },
    {
        'categoryName':'Mobile Holders & more',
      'categoryImagePath':'assets/images/catHolders.jpg'
    },
  ];

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(CategoriesFeedsScreen.routeName,arguments: '${categories[widget.index]["categoryName"]}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image:AssetImage(categories[widget.index]['categoryImagePath']!),
                fit: BoxFit.cover,

              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 140,
          ),
        ),
        Positioned(bottom: 0,
            left: 9,
            right: 9,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              color:Theme.of(context).primaryColor,
              child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    categories[widget.index]['categoryName']!,
                    style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15,
                        color: Theme.of(context).textSelectionTheme.selectionColor),),),),)
      ],
    );
  }
}
