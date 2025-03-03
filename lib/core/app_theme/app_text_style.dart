import 'package:flutter/material.dart';

import '../app_sizes/app_font_size.dart';
import 'app_font_weight.dart';

class AppTextStyle{
  TextStyle _getTextStyle(double fontSize,Color color,FontWeight fontWeight){
    return TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight);
  }

  //return light Text style
  TextStyle getLightTextStyle({double fontSize = AppFontSize.s12,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.light);
  }

  TextStyle getRegularTextStyle({double fontSize = AppFontSize.s16,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.regular);
  }

  TextStyle getMediumTextStyle({double fontSize = AppFontSize.s20,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.medium);
  }

  TextStyle getSemiBoldTextStyle({double fontSize = AppFontSize.s24,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.semiBold);


  }

  TextStyle getBoldTextStyle({double fontSize = AppFontSize.s30,required Color color}){
    return _getTextStyle(fontSize,color,AppFontWeight.bold);
  }
}