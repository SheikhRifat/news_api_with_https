import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_api/src/config/ktext.dart';
import 'package:news_api/src/drawer/build_drawer.dart';
import 'package:news_api/src/page/news_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // bubble bottom bar
  // change page state
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: KText(
          text: 'E-News',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
          icon: Icon(
            EvaIcons.menu2Outline,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.searchOutline,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.navigation2Outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: BuildDrawer(),
      body: <Widget>[
        NewsPage(),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.black,
        ),
      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: (int? index) {
          setState(() {
            currentIndex = index!;
          });
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Image.asset(
                'assets/icons/home.png',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: Image.asset(
                'assets/icons/home.png',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Image.asset(
                'assets/icons/add-button.png',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: Image.asset(
                'assets/icons/add-button.png',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Add News")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Image.asset(
                'assets/icons/active.png',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: Image.asset(
                'assets/icons/active.png',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Notifications")),
          BubbleBottomBarItem(
            backgroundColor: Colors.black,
            icon: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/icons/avatar.png')),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x5c000000),
                      offset: Offset(0, 1),
                      blurRadius: 5)
                ],
              ),
            ),
            title: Text("Profile"),
            activeIcon: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/icons/avatar.png')),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x5c000000),
                      offset: Offset(0, 1),
                      blurRadius: 5)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
