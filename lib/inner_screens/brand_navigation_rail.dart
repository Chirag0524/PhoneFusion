import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/provider/products.dart';

import 'brands_rail_widget.dart';

class BrandNavigationRailScreen extends StatefulWidget {
  // const BrandNavigationRailScreen({required Key key}) : super(key: key);

  static const routeName = '/brand_navigation_rail';
  @override
  BrandNavigationRailScreenState createState() {
    return BrandNavigationRailScreenState();
  }
}

class BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;
  late String routeArgs;
  late String brand;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    _selectedIndex = int.parse(
      routeArgs.substring(1,2),
    );
    if (_selectedIndex == 0) {
      setState(() {
        brand = "Apple";
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brand = "Oneplus";
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brand = "Samsung";
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brand = "Realme";
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brand = "All";
      });
    }
    // if (_selectedIndex == 5) {
    //   setState(() {
    //     brand = 'Samsung';
    //   });
    // }
    // if (_selectedIndex == 6) {
    //   setState(() {
    //     brand = 'Huawei';
    //   });
    // }
    // if (_selectedIndex == 7) {
    //   setState(() {
    //     brand = 'All';
    //   });
    // }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 56.0,
                      groupAlignment: 1.0,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                          if (_selectedIndex == 0) {
                            setState(() {
                              brand = "Apple";
                            });
                          }
                          if (_selectedIndex == 1) {
                            setState(() {
                              brand = "Oneplus";
                            });
                          }
                          if (_selectedIndex == 2) {
                            setState(() {
                              brand = "Samsung";
                            });
                          }
                          if (_selectedIndex == 3) {
                            setState(() {
                              brand = "Realme";
                            });
                          }
                          if (_selectedIndex == 4) {
                            setState(() {
                              brand = "All";
                            });
                          }
                          // if (_selectedIndex == 5) {
                          //   setState(() {
                          //     brand = 'Samsung';
                          //   });
                          // }
                          // if (_selectedIndex == 6) {
                          //   setState(() {
                          //     brand = 'Huawei';
                          //   });
                          // }
                          // if (_selectedIndex == 7) {
                          //   setState(() {
                          //     brand = 'All';
                          //   });
                          // }
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      leading: const Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                  "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                      selectedLabelTextStyle: const TextStyle(
                        color: Color(0xffffe6bc97),
                        fontSize: 20,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.5,
                      ),
                      unselectedLabelTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 0.8,
                      ),
                      destinations: [
                        // buildRotatedTextRailDestination('Addidas', padding),
                        buildRotatedTextRailDestination("Apple", padding),
                        buildRotatedTextRailDestination("Oneplus", padding),
                        buildRotatedTextRailDestination("Samsung", padding),
                        buildRotatedTextRailDestination("Realme", padding),
                        // buildRotatedTextRailDestination("Samsung", padding),
                        // buildRotatedTextRailDestination("Huawei", padding),
                        buildRotatedTextRailDestination("All", padding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // This is the main content.

          ContentSpace(context, brand)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: const SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  // final int _selectedIndex;

 final String brand;
   const ContentSpace(BuildContext context, this.brand, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final productsBrand=productsData.findByBrand(brand);
    if (brand=='All'){
      for (int i=0;i<productsData.products.length;i++){
        productsBrand.add(productsData.products[i]);
      }
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: productsBrand.length,
            itemBuilder: (BuildContext context, int index) =>
                ChangeNotifierProvider.value(
                    value: productsBrand[index],
                    child: const BrandsNavigationRail()),
          ),
        ),
      ),
    );
  }
}
