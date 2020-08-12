import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

Widget cardTimeWidget(SizingInformation sizingInformation) {
  return Container(
    height: 150,
    child: Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 150,
              width: sizingInformation.localWidgetSize.width * 0.45,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "10",
                      style: TextStyle(
                          fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sunday, May 25",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Time: 10:00",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: sizingInformation.localWidgetSize.width * 0.45,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "11",
                      style: TextStyle(
                          fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sunday, Nov 26",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Time: 10:00",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Icon(
              Icons.arrow_forward,
              size: 28,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}