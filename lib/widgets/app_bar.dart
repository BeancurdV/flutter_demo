import 'package:flutter/material.dart';

appBar(String title, String rightTitle, VoidCallback rightButtonClick) {
  return AppBar(
    // zfc 这个控件
    centerTitle: false,
    titleSpacing: 0,
    leading: const BackButton(),
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
    actions: [
      InkWell(
        // zfc 这个控件
        onTap: rightButtonClick,
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: Text(
            rightTitle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  );
}
