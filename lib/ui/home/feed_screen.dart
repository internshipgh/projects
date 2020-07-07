import 'package:flutter/material.dart';
import 'package:internship_gh/model/ui_image_data.dart';
import 'package:internship_gh/model/user.dart';
import 'package:internship_gh/ui/widget/company_suggestion.dart';
import 'package:internship_gh/ui/widget/post.dart';
import 'package:internship_gh/ui/widget/story.dart';

class FeedScreen extends StatefulWidget {
  final List<List<String>> listContent = UIImageData.postList;
  FeedScreen() {
    // Adding two empty list to postList in first and third index
    // We are doping this to place stories widget in first index and suggested for you widget in second index
    listContent.insert(0, []);
    listContent.insert(2, []);
  }

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Users _user;
  IconData icon;
  Color color;
  @override
  void initState() {
    super.initState();
    // retrieveUserDetails();
    icon = Icons.favorite;
  }

  // retrieveUserDetails() async {
  //   var user = await CallAuthenticationAPI().getCurrentUser('details');
  //   setState(() {
  //     _user = user;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          elevation: 1,
          title: title(),
          actions: actions(),
        ),
        body: _user == null
            ? RefreshIndicator(
                child: ListView.builder(
                  itemCount: widget.listContent.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0)
                      return Story();
                    else if (index == 2)
                      return CompanySuggestion();
                    else {
                      return Post(UIImageData.postList[1]);
                    }
                  },
                ),
                onRefresh: () async {},
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  // Widget postImagesWidget() {
  //   return _isGridActive == true
  //       ? FutureBuilder(
  //           future: _future,
  //           builder:
  //               ((context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
  //             if (snapshot.hasData) {
  //               if (snapshot.connectionState == ConnectionState.done) {
  //                 return GridView.builder(
  //                   shrinkWrap: true,
  //                   itemCount: snapshot.data.length,
  //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                       crossAxisCount: 3,
  //                       crossAxisSpacing: 4.0,
  //                       mainAxisSpacing: 4.0),
  //                   itemBuilder: ((context, index) {
  //                     return GestureDetector(
  //                       child: CachedNetworkImage(
  //                         imageUrl: snapshot.data[index].data['imgUrl'],
  //                         placeholder: ((context, s) => Center(
  //                               child: CircularProgressIndicator(),
  //                             )),
  //                         width: 125.0,
  //                         height: 125.0,
  //                         fit: BoxFit.cover,
  //                       ),
  //                       onTap: () {
  //                         print(
  //                             "SNAPSHOT : ${snapshot.data[index].reference.path}");
  //                         Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: ((context) => PostDetailScreen(
  //                                       user: _user,
  //                                       currentuser: _user,
  //                                       documentSnapshot: snapshot.data[index],
  //                                     ))));
  //                       },
  //                     );
  //                   }),
  //                 );
  //               } else if (snapshot.hasError) {
  //                 return Center(
  //                   child: Text('No Posts Found'),
  //                 );
  //               }
  //             } else {
  //               return Center(child: CircularProgressIndicator());
  //             }
  //           }),
  //         )
  //       : FutureBuilder(
  //           future: _future,
  //           builder:
  //               ((context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
  //             if (snapshot.hasData) {
  //               if (snapshot.connectionState == ConnectionState.done) {
  //                 return SizedBox(
  //                     height: 600.0,
  //                     child: ListView.builder(
  //                         //shrinkWrap: true,
  //                         itemCount: snapshot.data.length,
  //                         itemBuilder: ((context, index) => ListItem(
  //                             list: snapshot.data,
  //                             index: index,
  //                             user: _user))));
  //               } else {
  //                 return Center(
  //                   child: CircularProgressIndicator(),
  //                 );
  //               }
  //             } else {
  //               return Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //             }
  //           }),
  //         );
  // }

//   Widget detailsWidget(String count, String label) {
//     return Column(
//       children: <Widget>[
//         Text(count,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//                 color: Colors.black)),
//         Padding(
//           padding: const EdgeInsets.only(top: 4.0),
//           child:
//               Text(label, style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//         )
//       ],
//     );
//   }
// }

// class ListItem extends StatefulWidget {
//   List<DocumentSnapshot> list;
//   User user;
//   int index;

//   ListItem({this.list, this.user, this.index});

//   @override
//   _ListItemState createState() => _ListItemState();
// }

// class _ListItemState extends State<ListItem> {
//   var _repository = Repository();
//   bool _isLiked = false;
//   Future<List<DocumentSnapshot>> _future;

//   Widget commentWidget(DocumentReference reference) {
//     return FutureBuilder(
//       future: _repository.fetchPostComments(reference),
//       builder: ((context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
//         if (snapshot.hasData) {
//           return GestureDetector(
//             child: Text(
//               'View all ${snapshot.data.length} comments',
//               style: TextStyle(color: Colors.grey),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: ((context) => CommentsScreen(
//                             documentReference: reference,
//                             user: widget.user,
//                           ))));
//             },
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       }),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     print("INDEX : ${widget.index}");
//     //_future =_repository.fetchPostLikes(widget.list[widget.index].reference);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   new Container(
//                     height: 40.0,
//                     width: 40.0,
//                     decoration: new BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: new DecorationImage(
//                           fit: BoxFit.fill,
//                           image: new NetworkImage(widget.user.photoUrl)),
//                     ),
//                   ),
//                   new SizedBox(
//                     width: 10.0,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       new Text(
//                         widget.user.displayName,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       widget.list[widget.index].data['location'] != null
//                           ? new Text(
//                               widget.list[widget.index].data['location'],
//                               style: TextStyle(color: Colors.grey),
//                             )
//                           : Container(),
//                     ],
//                   )
//                 ],
//               ),
//               new IconButton(
//                 icon: Icon(Icons.more_vert),
//                 onPressed: null,
//               )
//             ],
//           ),
//         ),
//         CachedNetworkImage(
//           imageUrl: widget.list[widget.index].data['imgUrl'],
//           placeholder: ((context, s) => Center(
//                 child: CircularProgressIndicator(),
//               )),
//           width: 125.0,
//           height: 250.0,
//           fit: BoxFit.cover,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               new Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   GestureDetector(
//                       child: _isLiked
//                           ? Icon(
//                               Icons.favorite,
//                               color: Colors.red,
//                             )
//                           : Icon(
//                               FontAwesomeIcons.heart,
//                               color: null,
//                             ),
//                       onTap: () {
//                         if (!_isLiked) {
//                           setState(() {
//                             _isLiked = true;
//                           });
//                           // saveLikeValue(_isLiked);
//                           postLike(widget.list[widget.index].reference);
//                         } else {
//                           setState(() {
//                             _isLiked = false;
//                           });
//                           //saveLikeValue(_isLiked);
//                           postUnlike(widget.list[widget.index].reference);
//                         }
//                       }),
//                   new SizedBox(
//                     width: 16.0,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: ((context) => CommentsScreen(
//                                     documentReference:
//                                         widget.list[widget.index].reference,
//                                     user: widget.user,
//                                   ))));
//                     },
//                     child: new Icon(
//                       FontAwesomeIcons.comment,
//                     ),
//                   ),
//                   new SizedBox(
//                     width: 16.0,
//                   ),
//                   new Icon(FontAwesomeIcons.paperPlane),
//                 ],
//               ),
//               new Icon(FontAwesomeIcons.bookmark)
//             ],
//           ),
//         ),
//         FutureBuilder(
//           future:
//               _repository.fetchPostLikes(widget.list[widget.index].reference),
//           builder:
//               ((context, AsyncSnapshot<List<DocumentSnapshot>> likesSnapshot) {
//             if (likesSnapshot.hasData) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: ((context) => LikesScreen(
//                                 user: widget.user,
//                                 documentReference:
//                                     widget.list[widget.index].reference,
//                               ))));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: likesSnapshot.data.length > 1
//                       ? Text(
//                           "Liked by ${likesSnapshot.data[0].data['ownerName']} and ${(likesSnapshot.data.length - 1).toString()} others",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       : Text(likesSnapshot.data.length == 1
//                           ? "Liked by ${likesSnapshot.data[0].data['ownerName']}"
//                           : "0 Likes"),
//                 ),
//               );
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           }),
//         ),
//         Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: widget.list[widget.index].data['caption'] != null
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Wrap(
//                         children: <Widget>[
//                           Text(widget.user.displayName,
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0),
//                             child:
//                                 Text(widget.list[widget.index].data['caption']),
//                           )
//                         ],
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.only(top: 4.0),
//                           child: commentWidget(
//                               widget.list[widget.index].reference))
//                     ],
//                   )
//                 : commentWidget(widget.list[widget.index].reference)),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
//         )
//       ],
//     );
//   }

//   void postLike(DocumentReference reference) {
//     var _like = Like(
//         ownerName: widget.user.displayName,
//         ownerPhotoUrl: widget.user.photoUrl,
//         ownerUid: widget.user.uid,
//         timeStamp: FieldValue.serverTimestamp());
//     reference
//         .collection('likes')
//         .document(widget.user.uid)
//         .setData(_like.toMap(_like))
//         .then((value) {
//       print("Post Liked");
//     });
//   }

//   void postUnlike(DocumentReference reference) {
//     reference
//         .collection("likes")
//         .document(widget.user.uid)
//         .delete()
//         .then((value) {
//       print("Post Unliked");
//     });
//   }

// }

  Widget title() => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'App Name',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      );
}

List<Widget> actions() => <Widget>[
      // first item
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: IconButton(
          icon: Icon(
            Icons.chat_bubble_outline,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),

      // For padding
      SizedBox(width: 10.0),
    ];
