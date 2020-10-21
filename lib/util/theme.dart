import 'package:flutter/material.dart';
import 'package:zomato_test/common/size_config.dart';
import 'package:zomato_test/util/utils.dart';

TextStyle listTitleDefaultTextStyle =
    TextStyle(color: Colors.black54, fontSize: Util.px_15 * SizeConfig.textMultiplier, fontWeight: FontWeight.w600);

TextStyle listTitleSelectedTextStyle = TextStyle(color: Colors.black, fontSize: Util.px_15 * SizeConfig.textMultiplier,  fontWeight: FontWeight.w600);
TextStyle menuTextStyle = TextStyle(color: Colors.black, fontSize: Util.px_15 * SizeConfig.textMultiplier,  fontWeight: FontWeight.normal);
TextStyle selectedMenuTextStyle = TextStyle(color: Colors.blue, fontSize: Util.px_16 * SizeConfig.textMultiplier,  fontWeight: FontWeight.w600);


Color selectedColor = Color(0xFF4AC8EA);
Color drawerBackgroundColor = Colors.blueAccent.withAlpha(50);
