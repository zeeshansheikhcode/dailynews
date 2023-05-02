import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils 
{
  static  fieldFocusChange(BuildContext context, FocusNode current,FocusNode next)
  {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }



  static snackBar(String title, String message){
      Get.snackbar(
          title,
          message ,
      );
    }

}