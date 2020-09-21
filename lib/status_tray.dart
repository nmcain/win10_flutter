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

import 'package:GeneratedApp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'icons/windows_icons.dart';
import 'widgets/toggle.dart';

/// Hosts a collection of status icons.
class StatusTrayWidget extends StatefulWidget {
  final ValueChanged<bool> _callback;
  final GlobalKey<ToggleState> _toggleKey;

  final Tween<double> _backgroundOpacityTween =
      new Tween<double>(begin: 0.0, end: 0.33);

  /// Constructor.
  StatusTrayWidget({
    GlobalKey<ToggleState> toggleKey,
    ValueChanged<bool> callback,
  })  : _toggleKey = toggleKey,
        _callback = callback;

  @override
  StatusTrayWidgetState createState() => StatusTrayWidgetState();
}

class StatusTrayWidgetState extends State<StatusTrayWidget> {
  String _timeString;
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    if (!isTesting)
      Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    else
      print("WARNING: Clock was disabled due to testing flag!");
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('h:mm a \n M/d/yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) => new Toggle(
        key: widget._toggleKey,
        callback: widget._callback,
        builder: (Animation<double> animation) {
          return new AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) => new Container(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(4.0),
                color: Colors.grey.withOpacity(
                    widget._backgroundOpacityTween.evaluate(animation)),
              ),
              child: child,
            ),
            child: Center(
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: new Icon(Windows.uniE010,
                          color: const Color(0xFF000000), size: 10.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: new Icon(Windows.uniEBB5,
                          color: const Color(0xFF000000), size: 15.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: new Icon(Windows.uniEC3F,
                          color: const Color(0xFF000000), size: 16.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: new Icon(Windows.uniE15D,
                          color: const Color(0xFF000000), size: 16.0),
                    ),
                    new Text(
                      _timeString,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Segoe UI",
                        color: Colors.black,
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 15, right: 20),
                      child: new Icon(Windows.uniE7E7,
                          color: const Color(0xFF000000), size: 16.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 0, right: 4),
                      child: new Container(
                        height: 45,
                        width: 1,
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
            ),
          );
        },
      );
}
