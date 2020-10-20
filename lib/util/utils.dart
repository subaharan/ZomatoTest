import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zomato_test/common/app_colors.dart';
import 'package:zomato_test/common/size_config.dart';


class Util {
//  static int iosVersion =6;
//  static int androidVersion =8;
//static String GOOGLE_API_KEY="AIzaSyAljNBNweEPpGtZMOFhp_fRu6Yp7sX2m78";

  static double px_610 = 84.96;
  static double px_600 = 83.57;
  static double px_550 = 76.6;
  static double px_500 = 69.64;
  static double px_450 = 62.67;
  static double px_420 = 58.5;
  static double px_400 = 55.71;
  static double px_380 = 52.9;
  static double px_360 = 50.14;
  static double px_350 = 48.75;
  static double px_340 = 47.35;
  static double px_325 = 45.26;
  static double px_320 = 44.57;
  static double px_310 = 43.17;
  static double px_300 = 41.8;
  static double px_290 = 40.39;
  static double px_280 = 39;
  static double px_260 = 36.2;
  static double px_250 = 34.82;
  static double px_225 = 31.34;
  static double px_220 = 30.64;
  static double px_210 = 29.25;
  static double px_205 = 28.55;
  static double px_200 = 27.85;
  static double px_195 = 27.16;
  static double px_193 = 26.88;
  static double px_190 = 26.46;
  static double px_185 = 25.76;
  static double px_180 = 25;
  static double px_175 = 24.37;
  static double px_170 = 23.67;
  static double px_160 = 22.28;
  static double px_150 = 20.89;
  static double px_145 = 20.19;
  static double px_140 = 19.5;
  static double px_130 = 18.1;
  static double px_120 = 16.71;
  static double px_110 = 15.32;
  static double px_100 = 13.93;
  static double px_98 = 13.65;
  static double px_95 = 13.23;
  static double px_90 = 12.53;
  static double px_85 = 11.84;
  static double px_80 = 11.14;
  static double px_75 = 10.45;
  static double px_72 = 10;
  static double px_70 = 9.75;
  static double px_65 = 9;
  static double px_60 = 8.36;
  static double px_55 = 7.66;
  static double px_50 = 6.96;
  static double px_48 = 6.68;
  static double px_46 = 6.4;
  static double px_45 = 6.27;
  static double px_43 = 5.99;
  static double px_40 = 5.57;
  static double px_36 = 5;
  static double px_35 = 4.87;
  static double px_32 = 4.45;
  static double px_30 = 4.18;

  static double px_28 = 3.89;
  static double px_27 = 3.76;
  static double px_26 = 3.62;
  static double px_25 = 3.5;
  static double px_24 = 3.34;
  static double px_23 = 3.2;
  static double px_22 = 3;
  static double px_21 = 2.925;
  static double px_20 = 2.785;
  static double px_19 = 2.65;
  static double px_18 = 2.5;
  static double px_17 = 2.37;
  static double px_16 = 2.23;
  static double px_15 = 2.1;
  static double px_14 = 1.95;
  static double px_13 = 1.81;
  static double px_12 = 1.67;
  static double px_11 = 1.53;
  static double px_10 = 1.39;
  static double px_9 = 1.25;
  static double px_8 = 1.11;
  static double px_7 = 0.95;
  static double px_6 = 0.975;
  static double px_5 = 0.7;
  static double px_4 = 0.56;
  static double px_3 = 0.42;
  static double px_2 = 0.23;

/*  static toastDisplay(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0);
  }*/

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    print("Email : ${regExp.hasMatch(em)}");
    return regExp.hasMatch(em);
  }

  static void showDialogMsg(String msg, BuildContext context) {
    // flutter defined function
    /*if(int.parse(statusCode)==400){

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginMail()));
    }else {*/
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Details"/*AppTranslations.of(context).text("key_error_response")*/),
            content: new Text(msg==null?"Error":msg),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
//    }
  }


  static void showCenterShortToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,

        fontSize: Util.px_14 * SizeConfig.textMultiplier,
        textColor: Colors.white,
        backgroundColor: AppColor.green,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }


  //-----------
  static String stringToDay(String dateString){
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(dateString);

    String date = DateFormat('EEEE').format(tempDate);
//    String time = DateFormat("hh:mm:ss").format(DateTime.now());
    //DateFormat('EEEE').format(date)
    return date;
  }

  //-----------
  static String stringToYYYYmmDD(String dateString){
//    String date = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(dateString);

    String date = DateFormat("yyyy-MM-dd").format(tempDate);

    return date;
  }
  //-----------
  static String stringToHHmm(String dateString){
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateString);
//    DateTime tempDate = new DateFormat("hh:mm:ss").parse(dateString);

    String time = DateFormat("hh:mm").format(tempDate);

    return time;
  }

  //-----------
  static String stringToDateTime(String dateString){
//    String date = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateString);

    final difference = new DateTime.now().difference(tempDate);
    String timeString = timeago.format(new DateTime.now().subtract(difference), locale: 'en');

    return timeString;
  }

  //-----------
  static String milliSecondToTimeAgo(String dateString){
    String temp = new DateFormat('yyyy-MM-dd hh:mm:ss').format(
        DateTime.fromMillisecondsSinceEpoch(
            int.parse(dateString)));
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(temp);

    final difference = new DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(
        int.parse(dateString)));
    String timeString = timeago.format(new DateTime.now().subtract(difference), locale: 'en');

    return timeString;
  }


 static void showCenterLongToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: Util.px_14 * SizeConfig.textMultiplier,
        textColor: Colors.white,
        backgroundColor: AppColor.green,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  static void showErrorToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: Util.px_14 * SizeConfig.textMultiplier,
        textColor: Colors.white,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  static bool validateName(String value) {
   bool valid =false;
    valid = RegExp(r"^[a-zA-Z]+$").hasMatch(value);
    if(!valid) {
//      valid = RegExp("^[\u0621-\u064A\s\p{N}]+$").hasMatch(value);
    }
    return valid;
  }

 static bool validateMobile(String value) {
//    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return false;
    }else{
      return true;
    }

  }


 static Future<bool> isConnectedToInternet() async {
   try {
     final result = await InternetAddress.lookup('google.com');
     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
       print('connected');
       return true;
     }else{
       return false;
     }
   } on SocketException catch (_) {
     print('not connected');
     return false;
   }

  }






}
