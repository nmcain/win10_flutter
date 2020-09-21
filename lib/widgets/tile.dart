import 'dart:ui';
import 'package:flutter/material.dart';

Widget startTileWidget(
    String path, String name, Color color, Color textColor, double width) {
  return new Padding(
      padding: EdgeInsets.all(2.5),
      child: Container(
        height: 100,
        width: width,
        color: color,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: new Center(
                        child: new Image.asset(
                      path,
                      height: 45,
                      width: 45,
                    )),
                  )
                ]),
            new Padding(
              padding: EdgeInsets.only(bottom: 5, left: 8),
              child: new Text(
                name,
                style: new TextStyle(
                    color: textColor, fontFamily: "Segoe UI", fontSize: 12),
              ),
            ),
          ],
        ),
      ));
}
