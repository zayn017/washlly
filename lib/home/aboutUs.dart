import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'myDrawer.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
        title: const Text(
          "washly",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      drawer: myDrawer(),
      body: Container(
        height: _screenWidth * 2,
        width: _screenWidth * 2,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Washly inc",
                style: TextStyle(
                    fontSize: 28, color: Colors.blue, fontFamily: "arialbd"),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Washly is an mobile application where users can book their car wash."
                      " We can come to you. We do care about our customers,"
                      " so we do our best to provide the best washing services",
                  style: TextStyle(
                      fontSize: 21, color: Colors.blue, fontFamily: "arial"),
                ),
              ),
              Row(
                children: [
                  RichText(
                    textAlign: TextAlign.right,
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            //child: Icon(Icons.link),
                          ),
                        ),
                        TextSpan(
                          //text: 'www.washly.com',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RichText(
                    textAlign: TextAlign.right,
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            // child: Icon(Icons.facebook),
                          ),
                        ),
                        TextSpan(
                          //text: 'washly Inc',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
