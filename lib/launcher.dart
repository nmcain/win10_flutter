/*
Copyright 2019 The dahliaOS Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/material.dart';
import 'dart:ui';
import 'widgets/tile.dart';
import 'widgets/cards.dart';
import 'localization/localization.dart';
import 'icons/windows_icons.dart';

class LauncherWidget extends StatefulWidget {
  @override
  LauncherState createState() => LauncherState();
}

MaterialButton buildTile(String icon, String label) {
  return MaterialButton(
    onPressed: null //kanou pls help
    ,
    child: Column(
      //mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Image.asset(
          icon,
          fit: BoxFit.fill,
          width: 64.0,
          height: 64.0,
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

class LauncherState extends State<LauncherWidget> {
  @override
  Widget build(BuildContext context) {
    Localization local = Localization.of(context);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: const Color(0xFFff5722),
        accentColor: const Color(0xFFff5722),
        canvasColor: Colors.white.withOpacity(0.5),
      ),
      home: new Stack(
        children: [
          new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              decoration:
                  new BoxDecoration(color: Colors.white.withOpacity(0.5)),
            ),
          ),
          new Scaffold(
            body: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 15, top: 15),
                            child: new Icon(
                              Windows.uniE14C,
                              color: Colors.black,
                              size: 16,
                            )),
                        new Expanded(
                          child: Container(),
                        ),
                        new Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 15, top: 15),
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Text('N'),
                              radius: 10,
                            )),
                        new Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 15, top: 15),
                            child: new Icon(
                              Windows.uniE8B7,
                              color: Colors.black,
                              size: 16,
                            )),
                        new Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 15, top: 15),
                            child: new Icon(
                              Windows.uniE8B2,
                              color: Colors.black,
                              size: 16,
                            )),
                        new Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 15, top: 15),
                            child: new Icon(
                              Windows.uniE115,
                              color: Colors.black,
                              size: 16,
                            )),
                        new Padding(
                            padding:
                                EdgeInsets.only(left: 15, bottom: 15, top: 15),
                            child: new Icon(
                              Windows.uniE7E8,
                              color: Colors.black,
                              size: 16,
                            )),
                      ],
                    ),
                    new Container(
                      width: 10,
                    ),
                    tileSection(context),
                    new Expanded(
                        child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: new SingleChildScrollView(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 2),
                              child: Text(
                                "Productivity",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            new Row(
                              children: [
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/task.png',
                                    "Microsoft Store",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    205),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/root.png',
                                    "Office",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                              ],
                            ),
                            new Row(
                              children: [
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/web.png',
                                    "Edge",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/settings.png',
                                    "Settings",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/notes.png',
                                    "Word",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                              ],
                            ),
                            new Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 2),
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            new Row(
                              children: [
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/disks.png',
                                    "Disks",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/containers.png',
                                    "Containers",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/github.png',
                                    "Github",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                              ],
                            ),
                            new Row(
                              children: [
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/files.png',
                                    "File Explorer",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/messages.png',
                                    "Mail",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    205),
                              ],
                            ),
                            new Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 2),
                              child: Text(
                                "Create",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            new Row(
                              children: [
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/music.png',
                                    "Music",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/logs.png',
                                    "System Events",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/calculator.png',
                                    "Calculator",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                              ],
                            ),
                            new Row(
                              children: [
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/developer.png',
                                    "Microsoft Visual Studio",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    205),
                                startTileWidget(
                                    'lib/images/icons/v2/compiled/terminal.png',
                                    "Terminal",
                                    Color(0xFF0178D6),
                                    Colors.white,
                                    100),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
