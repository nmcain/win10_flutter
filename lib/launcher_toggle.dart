// Copyright 2017 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons/windows_icons.dart';
import 'widgets/toggle.dart';

/// A toggle button for the launcher.
class LauncherToggleWidget extends StatelessWidget {
  final ValueChanged<bool> _callback;
  final GlobalKey<ToggleState> _toggleKey;

  final Tween<double> _backgroundOpacityTween =
      new Tween<double>(begin: 0.0, end: 0.33);

  /// Constructor.
  LauncherToggleWidget({
    GlobalKey<ToggleState> toggleKey,
    ValueChanged<bool> callback,
  })  : _toggleKey = toggleKey,
        _callback = callback;
  @override
  Widget build(BuildContext context) => new Container(
        //width: 30,
        height: 50,
        child: Toggle(
          key: _toggleKey,
          callback: _callback,
          builder: (Animation<double> animation) => new AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) => new Row(
              children: <Widget>[
                new Container(
                  //color: Colors.white,
                  height: 40,
                  width: 485,
                  child: new Row(
                    children: [
                      new Padding(
                        padding: EdgeInsets.only(top: 0, left: 15, right: 15),
                        child: new FaIcon(
                          FontAwesomeIcons.windows,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      new Container(
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.only(
                                    top: 1, left: 12, right: 10),
                                child: new Icon(
                                  Windows.uniE094,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                              new Text(
                                "Type here to search",
                                style: new TextStyle(
                                    fontFamily: "Segoe UI",
                                    color: Colors.grey[900],
                                    fontSize: 15),
                              ),
                            ]),
                        color: Colors.white,
                        width: 345,
                        height: 40,
                      ),
                      new Padding(
                          padding: EdgeInsets.only(top: 0, left: 13, right: 13),
                          child: new Icon(Icons.panorama_fish_eye,
                              color: Colors.black, size: 20)),
                      new Padding(
                          padding: EdgeInsets.only(top: 0, left: 13),
                          child: new Icon(Windows.uniE17D,
                              color: Colors.black, size: 18)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
