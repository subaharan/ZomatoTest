import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zomato_test/pages/home_page.dart';

import 'common/app_colors.dart';
import 'common/size_config.dart';
import 'common/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation
        .portraitDown /*, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight*/
  ]).then((_) {
    runApp(
        MyApp());
  });

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constrains, orientation);
          return MaterialApp(
            title: Strings.app_name,
            theme: ThemeData(
              primarySwatch: AppColor.colorCustom,

            ),
            home: HomePage(),

          );
        },
      );
    });
  }
}

