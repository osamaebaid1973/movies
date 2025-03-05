import 'package:flutter/material.dart';

import '../app_sizes/app_font_size.dart';
import 'app_font_weight.dart';

class AppTextStyle{
  static TextStyle _getTextStyle(double fontSize,Color color,FontWeight fontWeight){
    return TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight);
  }

  //return light Text style
  static TextStyle getLightTextStyle({double fontSize = AppFontSize.s12,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.light);
  }

  static TextStyle getRegularTextStyle({double fontSize = AppFontSize.s16,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.regular);
  }

  static TextStyle getMediumTextStyle({double fontSize = AppFontSize.s20,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.medium);
  }

  static TextStyle getSemiBoldTextStyle({double fontSize = AppFontSize.s24,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.semiBold);


  }

  static TextStyle getBoldTextStyle({double fontSize = AppFontSize.s30,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.bold);
  }
}