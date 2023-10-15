import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../consts/colors.dart';
import 'bottom_bar.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _value = false;
  late ScrollController _scrollController;
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Navigate back to the BottomBarScreen when the back button or gesture is triggered
          Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
          return true; // Return true to allow the back navigation
        },
    child: Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 4,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorsConsts.starterColor,
                        ColorsConsts.endColor,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: const [0.0, 1.0],
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
                          opacity: top <= 110.0 ? 1.0 : 0,
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
                                    image: NetworkImage('YOUR_IMAGE_URL_HERE'),
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
                    background: const Image(
                      image: NetworkImage('YOUR_BACKGROUND_IMAGE_URL_HERE'),
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
                  child: userTitle('User Information'),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                userListTitle('Email', 'chiragadwani00@gmail.com', 0, context),
                userListTitle('Contact', '7874635969', 1, context),
                userListTitle(
                    'Shipping Address', 'F-304 Shrinand Flora, Nana Chiloda', 2,
                    context),
                userListTitle('Joined Date', 'date', 3, context),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: userTitle('User Settings')
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTileSwitch(
                  value: _value,
                  leading: const Icon(FeatherIcons.moon),
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  visualDensity: VisualDensity.comfortable,
                  switchType: SwitchType.cupertino,
                  switchActiveColor: Colors.indigo,
                  title: const Text('Dark Mode'),
                ),
                userListTitle('Logout', '', 4, context),
              ],
            ),
            // Other user info list tiles here
          )
        ],
      ),
    ));
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
    return const Text(
      'User Information',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
    );
  }
}
