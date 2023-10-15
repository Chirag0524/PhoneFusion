import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:PhoneFusion/consts/my_icons.dart';
import 'package:PhoneFusion/provider/dark_theme_provider.dart';
import 'package:PhoneFusion/screens/cart.dart';
import 'package:PhoneFusion/screens/wishlist.dart';
import '../consts/colors.dart';
import 'bottom_bar.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
   UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  late ScrollController _scrollController;
  double defaultTopMargin = 200.0 - 4.0;
  double scaleStart = 150.0;
  double scaleEnd = 50.0;
  double fabTop = 0.0;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);

    // Set the initial value of fabTop
    fabTop = defaultTopMargin - scaleEnd/12;
  }

  void _handleScroll() {
    double offset = _scrollController.offset;
    setState(() {
      fabTop = defaultTopMargin - offset;

      if (offset < defaultTopMargin - scaleStart) {
        // Do nothing, scale is already 1.0
      } else {
        // Calculate scale based on the scroll position
        double scale = (defaultTopMargin - scaleEnd - offset) / (defaultTopMargin - scaleStart);
        fabTop -= scaleEnd * (1 - scale); // Adjust the top position

        // Adjust the fabTop based on the scroll offset
        double distanceFromTop = defaultTopMargin - offset;
        double maxDistance = defaultTopMargin - scaleStart;
        double adjustedTop = (distanceFromTop / maxDistance) * (scaleStart / 4);
        fabTop += adjustedTop;
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    final themeChange=Provider.of<DarkThemeProvider>(context);
    return WillPopScope(
        onWillPop: () async {
          // Navigate back to the BottomBarScreen when the back button or gesture is triggered
          Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
          return true; // Return true to allow the back navigation
        },
    child: Scaffold(
      body: Stack(
        children: [
       CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 4,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // top = constraints.biggest.height;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorsConsts.starterColor,
                        ColorsConsts.endColor,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops:  const [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: _scrollController.offset >= defaultTopMargin - scaleStart
                              ? 1.0
                              : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                height: kToolbarHeight / 1.8,
                                width: kToolbarHeight / 1.8,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage('https://sc04.alicdn.com/kf/HTB1jA_RXrj1gK0jSZFuq6ArHpXab.jpg_350x350.jpg'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text(
                                'Chirag Adwani',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    background:
                      Image.network(
                        'https://sc04.alicdn.com/kf/HTB1jA_RXrj1gK0jSZFuq6ArHpXab.jpg_350x350.jpg',
                        fit: BoxFit.cover,
                      ),

                    ),
                  );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: userTitle('User Bag'),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              Material(
                    color:Colors.transparent,
                    child:InkWell(
                        splashColor: Theme.of(context).splashColor,
                child:ListTile(
                  onTap: ()=>Navigator.of(context).pushNamed(
                    Wishlist.routeName
                  ),
                  title: Text('Wishlist'),
                  trailing: Icon(Icons.chevron_right_rounded),
                  leading: Icon(MyAppIcons.wishlist),
                )
            )
        ),
                Material(
                    color:Colors.transparent,
                    child:InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child:ListTile(
                          onTap: ()=>Navigator.of(context).pushNamed(
                              Cart.routeName
                          ),
                          title: Text('Cart'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(MyAppIcons.cart),
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: userTitle('User Information'),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                // userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                // userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                // userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                // userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                // userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                // userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                userListTitle('Contact', '7874635969', 1, context),
                userListTitle(
                    'Shipping Address', 'F-304 Shrinand Flora, Nana Chiloda', 2,
                    context),
                userListTitle('Joined Date', 'date', 3, context),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: userTitle('User Controls')
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTileSwitch(
                  value: themeChange.darkTheme,
                  leading: const Icon(FeatherIcons.moon),
                  onChanged: (value) {
                    setState(() {
                      themeChange.darkTheme = value;
                    });
                  },
                  visualDensity: VisualDensity.comfortable,
                  switchType: SwitchType.cupertino,
                  switchActiveColor: Colors.indigo,
                  title: const Text('Dark Mode'),
                ),
            Material(
              color:Colors.transparent,
              child:InkWell(
              splashColor: Theme.of(context).splashColor,
              child:ListTile(
                onTap: (){
                  Navigator.canPop(context)?Navigator.pop(context):null;
                },
                title: Text('Logout'),
                leading: Icon(Icons.exit_to_app_rounded),
              )
          )
          ),
              ],
            ),
            // Other user info list tiles here
          )
        ],
      ),
           _buildFab(),
      ],
      ),
    ));
  }

  Widget _buildFab() {
    double scale = 1.0;
    double adjustedFabTop = fabTop;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;

      if (offset >= defaultTopMargin - scaleStart) {
        scale = (defaultTopMargin - scaleEnd - offset) / (defaultTopMargin - scaleStart);
        scale = scale.clamp(0.0, 1.0);

        // Adjust the top position based on the scroll offset
        double distanceFromTop = defaultTopMargin - offset;
        double maxDistance = defaultTopMargin - scaleStart;
        double adjustedTop = (distanceFromTop / maxDistance) * (scaleStart / 2);
        adjustedFabTop = adjustedTop;
      } else {
        scale = 1.0;
        adjustedFabTop = fabTop;
      }
    }
    return Positioned(
      top: adjustedFabTop, // Use the adjustedFabTop instead of fabTop
      right: 16.0,
      child: Transform.scale(
        scale: scale,
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
  final List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];
  Widget userListTitle(String title,String subTitle,int index, BuildContext context){
    return Material(
        color:Colors.transparent,
        child:InkWell(
            splashColor: Theme.of(context).splashColor,
            child:ListTile(
              onTap: (){},
              title: Text(title),
              subtitle: Text(subTitle),
              leading: Icon(_userTileIcons[index]),
            )
        )
    );
  }

  Widget userTitle(String title) {
    return  Padding(
      padding: EdgeInsets.all(14.0),
      child: Text(
        '${title}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}
