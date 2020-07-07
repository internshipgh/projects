import 'package:flutter/material.dart';
import 'package:internship_gh/model/ui_image_data.dart';
import 'package:internship_gh/ui/widget/circle_image.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
            width: 1.0,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: UIImageData.storiesList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 4.0),
        itemBuilder: (BuildContext context, int index) {
          return story(index);
        },
      ),
    );
  }

  Widget story(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleImage(UIImageData.storiesList[index]),
        Expanded(
          child: Text(
            UIImageData.storiesName[index],
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

//   Widget createStory() {
//     return Stack(
//       children: <Widget>[
//         Container(
//           height: 62.0,
//           width: 62.0,
//           margin:
//               EdgeInsets.only(left: 12.0, top: 14.0, right: 16.0, bottom: 10.0),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage(
//                 UIImageData.storiesList[0],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 4.0,
//           right: 8.0,
//           height: 24.0,
//           width: 24.0,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//             child: Container(
//               margin: EdgeInsets.all(2.0),
//               decoration: BoxDecoration(
//                 color: Colors.lightBlue,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 18.0,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
}
