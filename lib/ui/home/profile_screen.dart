import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_gh/model/ui_image_data.dart';
import 'package:internship_gh/model/user.dart';
import 'package:internship_gh/ui/widget/user_image_with_plus_icon.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  Users _user;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
    // retrieveUserDetails();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // retrieveUserDetails() async {
  //   FirebaseUser currentUser = await _repository.getCurrentUser();
  //   User user = await _repository.retrieveUserDetails(currentUser);
  //   setState(() {
  //     _user = user;
  //   });
  //   _future = _repository.retrieveUserPosts(_user.uid);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              // User information section
              SliverToBoxAdapter(child: userInfo()),

              // Tap bar
              SliverPersistentHeader(
                delegate: CustomSliverDelegate(_tabController),
                pinned: true,
                floating: true,
              ),
            ];
          },
          body: _user == null
              ? TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    postGridView(),
                    taggedGridView(),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

// App bar
  Widget appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: new Color(0xfff8faf8),
      title: Row(
        children: <Widget>[
          Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          SizedBox(width: 4.0),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18.0,
          ),
        ],
      ),
      actions: <Widget>[
        Icon(Icons.menu),
        SizedBox(width: 16.0),
      ],
    );
  }

  // User information
  Widget userInfo() {
    Widget stats(String statName, int statCount) {
      return Column(
        children: <Widget>[
          Text(
            statCount.toString(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(statName),
        ],
      );
    }

    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                UserImageWithPlusIcon(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      stats('Posts', 20),
                      stats('Followers', 111),
                      stats('Following', 203),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Pankaj Koirala',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '''Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program.''',
              style: TextStyle(),
            ),
            // Edit profile button
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black26,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // For padding
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  // Tab 1 page (Frist TabView)
  Widget postGridView() {
    return GridView.builder(
      itemCount: 50,
      padding: EdgeInsets.only(top: 4.0),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                UIImageData.man2,
              ),
            ),
          ),
        );
      },
    );
  }

  // Tab 2 page (Second TabView)
  Widget taggedGridView() {
    return GridView.builder(
      itemCount: 4,
      padding: EdgeInsets.only(top: 4.0),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                UIImageData.man4,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Tab bar
class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  TabController _tabController;
  CustomSliverDelegate(this._tabController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.black,
        tabs: <Widget>[
          Icon(Icons.grid_on),
          Icon(Icons.contacts),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
