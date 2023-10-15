import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:PhoneFusion/inner_screens/brand_navigation_rail.dart';
import 'package:PhoneFusion/provider/products.dart';
import 'package:PhoneFusion/screens/feeds.dart';
import 'package:PhoneFusion/widgets/backlayer.dart';
import 'package:PhoneFusion/widgets/cateogary.dart';
import 'package:PhoneFusion/widgets/popular_products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  // static const String routeName='/home';

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List brandsImages=[
          'assets/images/apple.png',
         'assets/images/oneplus.png',
         'assets/images/samsung.png',
         'assets/images/realme.png',
  ];

  var index=4;
  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final popularItems=productsData.popularProducts;
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          headerHeight: MediaQuery.of(context).size.height * 0.25,
          appBar: BackdropAppBar(
            title: const Text("PhoneFusion"),
            leading: const BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorsConsts.starterColor, ColorsConsts.endColor],
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                iconSize: 15,
                padding: const EdgeInsets.all(10),
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundImage: NetworkImage("https://sc04.alicdn.com/kf/HTB1jA_RXrj1gK0jSZFuq6ArHpXab.jpg_350x350.jpg"),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          backLayer: const BackLayerMenu(),
          frontLayer: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 190.0,
                  width: double.infinity,
                  child:Carousel(
                    boxFit: BoxFit.fill,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    dotSize: 6.0,
                    dotIncreasedColor: Colors.purple,
                    dotBgColor: Colors.black.withOpacity(0.1),
                    dotPosition: DotPosition.bottomCenter,
                    showIndicator: true,
                    indicatorBgPadding: 5.0,
                    images: const [
                      NetworkImage("https://contentstatic.techgig.com/thumb/msid-102499015,width-460,resizemode-4/Huge-offers-and-discounts-on-iPhone-13-iPhone-14-and-iPhone-14-Pro-at-Amazon-Flipkart-and-Vijay-Sales.jpg?207856"),
                      NetworkImage("https://i.gadgets360cdn.com/large/amazonfabphonefest_main_1566883974967.jpg?output-quality=80"),
                      NetworkImage("https://itwire.com/media/k2/items/cache/ddc36d8b3416e4638d02188b96933fed_XL.jpg"),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Text("Categories",
                          style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),
                        ),
                  ),
                ),
                Container(width: double.infinity,
                  height: 180,
                  child: ListView.builder(itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int index){
                      return CategoryWidget(index: index);
                      }),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Popular Brands",
                        style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),
                      ),
                      const Spacer(),
                      TextButton(onPressed: ()=> Navigator.of(context).pushNamed(
                            BrandNavigationRailScreen.routeName,
                            arguments: {
                             index, // Pass the argument with a key
                            },
                        ),
                        child:const Text("View all...",
                          style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.redAccent
                          ),
                        ), ),
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width*0.92,
                  child: Swiper(
                    itemCount: brandsImages.length,
                    autoplay: true,
                    onTap: (index){
                      Navigator.of(context).pushNamed(
                        BrandNavigationRailScreen.routeName,
                        arguments: {
                          index,
                        },
                      );
                    },
                    itemBuilder: (BuildContext context,int index){
                      return ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: Container(
                          color: Colors.white60,
                          child: Image.asset(brandsImages[index],fit: BoxFit.fill,)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Popular Products",
                        style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),
                      ),
                      const Spacer(),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushNamed(Feeds.routeName,arguments: "Popular");
                      },
                        child:const Text("View all...",
                          style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.redAccent
                          ),
                        ), ),
                    ],
                  ),
                ),
                Container(width: double.infinity,
                  height: 285,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularItems.length,
                      itemBuilder: (BuildContext context,int index){
                        return ChangeNotifierProvider.value(
                           value: popularItems[index],
                            child: const PopularProducts(
                                // imageUrl: popularItems[index].imageUrl!,title: popularItems[index].title!,description: popularItems[index].description!,price: popularItems[index].price!
                            )
                        );
                      }),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
