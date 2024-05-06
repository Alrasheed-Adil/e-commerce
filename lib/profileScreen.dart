//import 'dart:html';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3D82AE),
        foregroundColor: Colors.white,
        onPressed: () {
          setState(() {
            counter = counter + 1;
          });
        },
        child: Container(
          width: 60,
          height: 30,
          child: Icon(Icons.edit),
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[Color(0xFF3D82AE), Color(0xFF3D82AE)],
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 90.0,
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/e-cart-d8427.appspot.com/o/profile-1.png?alt=media&token=cc64bf2d-5ed8-40c7-b79b-727da9268119'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Alrasheed Adil',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Super Customer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Container(
                              width: 310.0,
                              height: 290.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: Colors.blueAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Email",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "sprize016@gmail.com",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color:
                                              Color.fromARGB(255, 248, 166, 44),
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Phone Number",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "+249 914153537",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.pinkAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Location",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Dubai",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.monetization_on_outlined,
                                          color: Colors.lightGreen[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Balance",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "4875\$",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )))),
                ),
              ),
            ],
          ),
          // Positioned(
          //     top: MediaQuery.of(context).size.height * 0.45,
          //     left: 20.0,
          //     right: 20.0,
          //     child: Card(
          //         child: Padding(
          //       padding: EdgeInsets.all(16.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Container(
          //               child: Column(
          //             children: [
          //               Text(
          //                 'Products',
          //                 style: TextStyle(
          //                     color: Colors.grey[400], fontSize: 14.0),
          //               ),
          //               SizedBox(
          //                 height: 5.0,
          //               ),
          //               Text(
          //                 "$counter",
          //                 style: TextStyle(
          //                   fontSize: 15.0,
          //                 ),
          //               )
          //             ],
          //           )),
          //           Container(
          //             child: Column(children: [
          //               Text(
          //                 'Birthday',
          //                 style: TextStyle(
          //                     color: Colors.grey[400], fontSize: 14.0),
          //               ),
          //               SizedBox(
          //                 height: 5.0,
          //               ),
          //               Text(
          //                 'April 7th',
          //                 style: TextStyle(
          //                   fontSize: 15.0,
          //                 ),
          //               )
          //             ]),
          //           ),
          //           Container(
          //               child: Column(
          //             children: [
          //               Text(
          //                 'Age',
          //                 style: TextStyle(
          //                     color: Colors.grey[400], fontSize: 14.0),
          //               ),
          //               SizedBox(
          //                 height: 5.0,
          //               ),
          //               Text(
          //                 '19 yrs',
          //                 style: TextStyle(
          //                   fontSize: 15.0,
          //                 ),
          //               )
          //             ],
          //           )),
          //         ],
          //       ),
          //     )))
        ],
      ),
    );
  }
}
