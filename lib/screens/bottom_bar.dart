
import 'package:flutter/material.dart';
import 'package:PhoneFusion/consts/my_icons.dart';
import 'package:PhoneFusion/screens/cart.dart';
import 'package:PhoneFusion/screens/feeds.dart';
import 'package:PhoneFusion/screens/home.dart';
import 'package:PhoneFusion/screens/search.dart';
import 'package:PhoneFusion/screens/user_info.dart';
class BottomBarScreen extends StatefulWidget{
  const BottomBarScreen({super.key});
  static const String routeName='/BottomBarScreen';

  @override
  BottomBarScreenState createState() =>BottomBarScreenState();
}
class BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Widget>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const Home(),
      },
      {
        'page':  Feeds(),
      },
      {
        'page':  Search(),
      },
      {
        'page': const Cart(),
      },
      {
        'page':  const UserInfo(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(MyAppIcons.home),
                onPressed: () => _selectPage(0),
                color: _selectedPageIndex == 0
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
              ),
              IconButton(
                icon: const Icon(MyAppIcons.rss),
                onPressed: () => _selectPage(1),
                color: _selectedPageIndex == 1
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
              ),
              // Add an invisible IconButton to fill the gap for the FAB
              IconButton(
                icon: const Icon(null),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(MyAppIcons.bag),
                onPressed: () => _selectPage(3),
                color: _selectedPageIndex == 3
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
              ),
              IconButton(
                icon: const Icon(MyAppIcons.user),
                onPressed: () => _selectPage(4),
                color: _selectedPageIndex == 4
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        hoverElevation: 10,
        splashColor: Colors.grey,
        tooltip: 'Search',
        elevation: 4,
        child: const Icon(MyAppIcons.search),
        onPressed: () => setState(() {
          _selectedPageIndex = 2;
        }),
      ),
    );
  }
}
