import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants{
  Color blue = Colors.blue;
  static Widget textWithPro(var txt,double font,FontWeight fontWeight,Color color) {
    return Text(txt,style: TextStyle(
        fontSize: font,fontFamily: '',fontWeight: fontWeight,color:color
    ),);
  }
  static void toaster(msg){
    Fluttertoast.showToast(
      msg: msg,
    );
  }
  static Widget sPacewidth(double width) => SizedBox(width: width,);
  static Widget sPaceHeight(double height) => SizedBox(height: height,);
}