import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkScreen extends StatefulWidget {
  @override
  _LinkScreenState createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: new Color(0xfff8faf8),
        title: Row(
          children: <Widget>[
            Text(
              'My Links',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            SizedBox(width: 4.0),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.news),
            tooltip: 'New link',
            enableFeedback: true,
            iconSize: 25,
            splashColor: Colors.orange[200],
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'New Application',
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                      ),
                      content: Form(
                        autovalidate: true,
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: 'Something',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: 'Something',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: 'Something',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: 'Something',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: 'Something',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: 'Something',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: RaisedButton(
                                  color: Colors.orange[200],
                                  child: Text("Submit"),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(width: 16.0),
        ],
      ),
// body: ,
    );
    // body: ModalProgressHUD(
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       color: Colors.transparent,
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.all(15),
    //       child: ListView(
    //         children: <Widget>[
    //           Center(
    //             child: CircleAvatar(
    //               minRadius: 30,
    //               backgroundColor: Colors.orange[200],
    //               foregroundColor: Colors.white,
    //               child: SizedBox(
    //                 width: 100,
    //                 height: 100,
    //                 child: Image.asset(
    //                   '',
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Form(
    //             child: Column(
    //               children: <Widget>[
    //                 Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
    //                   child: TextFormField(
    //                     // controller: studentRef,
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     decoration: InputDecoration(
    //                         enabledBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.grey)),
    //                         labelText: 'Reference No',
    //                         labelStyle:
    //                             TextStyle(fontSize: 15, color: Colors.grey)),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
    //                   child: TextFormField(
    //                     // controller: email,
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     decoration: InputDecoration(
    //                         enabledBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.grey)),
    //                         labelText: 'Email Address',
    //                         labelStyle:
    //                             TextStyle(fontSize: 15, color: Colors.grey)),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
    //                   child: TextFormField(
    //                     // controller: firstName,
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     decoration: InputDecoration(
    //                         enabledBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.grey)),
    //                         labelText: 'First Name',
    //                         labelStyle:
    //                             TextStyle(fontSize: 15, color: Colors.grey)),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
    //                   child: TextFormField(
    //                     // controller: lastName,
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     decoration: InputDecoration(
    //                         enabledBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.grey)),
    //                         labelText: 'Last Name',
    //                         labelStyle:
    //                             TextStyle(fontSize: 15, color: Colors.grey)),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
    //                   child: TextFormField(
    //                     // controller: password,
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     decoration: InputDecoration(
    //                         enabledBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.grey)),
    //                         labelText: 'Password',
    //                         labelStyle:
    //                             TextStyle(fontSize: 15, color: Colors.grey)),
    //                     obscureText: true,
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
    //                   child: TextFormField(
    //                     // controller: confirmPassword,
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     decoration: InputDecoration(
    //                         enabledBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.grey)),
    //                         labelText: 'Confirm Password',
    //                         labelStyle:
    //                             TextStyle(fontSize: 15, color: Colors.grey)),
    //                     obscureText: true,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(top: 20),
    //             child: MaterialButton(
    //               onPressed: () {
    //                 // _submit();
    //               },
    //               child: Text(
    //                 'Get Started',
    //                 style: TextStyle(
    //                   fontSize: 15,
    //                   fontFamily: 'SFUIDisplay',
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               color: Colors.orange[200],
    //               elevation: 1,
    //               minWidth: 30,
    //               height: 45,
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10)),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   inAsyncCall: false,
    // ),
  }
}
