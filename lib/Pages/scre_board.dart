import 'package:flutter/material.dart';

Widget scoreboard(String title, String info) {
  return Expanded(
    child: Container(
        margin: EdgeInsets.all(26.0),
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 22.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              info,
              style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
            )
          ],
        )),
  );
}
