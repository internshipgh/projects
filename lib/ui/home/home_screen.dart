import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_gh/ui/home/favourite_screen.dart';
import 'package:internship_gh/ui/home/feed_screen.dart';
import 'package:internship_gh/ui/home/links_screen.dart';
import 'package:internship_gh/ui/home/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

PageController pageController;

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
        children: [
          new Container(
            color: Colors.white,
            child: FeedScreen(),
          ),
          new Container(
            color: Colors.white,
            child: LinkScreen(),
          ),
          new Container(
            color: Colors.white,
            child: FavouriteScreen(),
          ),
          new Container(
            color: Colors.white,
            child: ProfileScreen(),
          ),
        ],
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new CupertinoTabBar(
        activeColor: Colors.orange,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon((_page == 0) ? Icons.home : CupertinoIcons.home,
                  color: (_page == 0) ? Colors.blue : Colors.grey),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(
                  (_page == 1)
                      ? Icons.add_circle_outline
                      : Icons.add_circle_outline,
                  color: (_page == 1) ? Colors.blue : Colors.grey),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(
                  (_page == 2) ? Icons.favorite : Icons.favorite_border,
                  color: (_page == 2) ? Colors.blue : Colors.grey),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(
                  (_page == 3) ? Icons.person : CupertinoIcons.profile_circled,
                  color: (_page == 3) ? Colors.blue : Colors.grey),
              backgroundColor: Colors.white),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
