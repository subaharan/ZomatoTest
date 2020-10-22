import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:zomato_test/common/images.dart';
import 'package:zomato_test/common/size_config.dart';
import 'package:zomato_test/common/strings.dart';
import 'package:zomato_test/util/utils.dart';

import '../ui/collapsing_list_tile.dart';
import '../../util/theme.dart';
import 'navigation_item.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double _maxWidth = Util.px_250 * SizeConfig.heightMultiplier;
  double _minWidth = Util.px_55 * SizeConfig.heightMultiplier;
  bool _isCollapsed = true;
  AnimationController _animationController;
  Animation<double> _withAnimation;
  int _currentIndexMenu = 0;
  int mSelectedIndex=3;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _withAnimation = Tween(begin: _minWidth, end: _minWidth).animate(_animationController);
    // initiate();
  }

/*  void initiate() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        setState(() async {
          _isCollapsed=true;
        });
      });

    });
  }*/

  @override
  Widget build(BuildContext context) {
    return getWidget(context, widget);
  /*  return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );*/
  }

  Widget getWidget(BuildContext context, Widget widget) {
    return Material(
      color: Colors.transparent,
      // elevation: 80,
      child: Container(
        width: Util.px_65 * SizeConfig.heightMultiplier,
        color: Colors.white,
        // decoration: _drawerWhiteBackground(),
        child: Container(
          width: _withAnimation.value,

          // color: drawerBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: Util.px_45 * SizeConfig.heightMultiplier,
                decoration: _drawerTopCornerBackground(),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: Util.px_50 * SizeConfig.heightMultiplier,
                    ),
                    CollapsingListTile(
                      title: Strings.dashboard,
                      icon: Icons.dashboard_sharp,
                      animationController: _animationController,
                    ),
                    SizedBox(
                      height: Util.px_20 * SizeConfig.heightMultiplier,
                    ),
                    CollapsingListTile(
                      title: Strings.search,
                      icon: Icons.search,
                      animationController: _animationController,
                    ),
                    SizedBox(height: Util.px_40 * SizeConfig.heightMultiplier,),
                  ],
                ),
              ),


              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    _verticalTextWidget(0),
                    _verticalTextWidget(1),
                    _verticalTextWidget(2),
                    _verticalTextWidget(3),

                  ],
                ) /*ListView.separated(

                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: Util.px_10 * SizeConfig.heightMultiplier,
                    );
                  },
                  itemBuilder: (context, index) {
                    return _verticalTextWidget(navigationItems[index].title);
                    *//*return CollapsingListTile(
                      title: navigationItems[index].title,
                      icon: navigationItems[index].icon,
                      animationController: _animationController,
                      isSelected: _currentIndexMenu == index,
                      onTab: () {
                        setState(() {
                          _currentIndexMenu = index;
                        });
                      },
                    );*//*
                  },
                  itemCount: navigationItems.length,
                ),*/
              ),
              Container(
                decoration: _drawerBottomCornerBackground(),
                alignment: Alignment.centerLeft,
                width: Util.px_45 * SizeConfig.heightMultiplier,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: Util.px_40 * SizeConfig.heightMultiplier,),
                    InkWell(

                      child: Icon(Icons.content_paste, color: Colors.black,
                        size: Util.px_24 * SizeConfig.heightMultiplier,),

                    ),
                    SizedBox(
                      height: Util.px_40 * SizeConfig.heightMultiplier,
                    ),
                  ],
                ),
              ),
            /*  SizedBox(height: Util.px_40 * SizeConfig.heightMultiplier,),
              InkWell(
              *//*  onTap: () {
                  setState(() {
                    print("IsCollapsed before${_isCollapsed}");
                    _isCollapsed = !_isCollapsed;
                    print("IsCollapsed after ${_isCollapsed}");
                    _isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },*//*
                child: Icon(Icons.content_paste, color: Colors.black,
                  size: Util.px_24 * SizeConfig.heightMultiplier,),
               *//* child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.black,
                  size: Util.px_24 * SizeConfig.heightMultiplier,
                ),*//*
              ),
              SizedBox(
                height: Util.px_40 * SizeConfig.heightMultiplier,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
/*
  Widget _verticalTextWidget(int i){
    return RaisedButton(
      co
      onPressed: (){
        setState(() {
          mSelectedIndex=i;
        });
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(navigationItems[i].title,
          style: mSelectedIndex==i?selectedMenuTextStyle:menuTextStyle,),
      ),
    );
  }*/
  Widget _verticalTextWidget(int i){
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            mSelectedIndex=i;
          });
        },
        child: Container(

          // decoration: mSelectedIndex==i?_drawerSelectedBackground():_drawerNotSelectedBackground(),
          // decoration: _drawerNotSelectedBackground(),
          width: mSelectedIndex==i?Util.px_65 * SizeConfig.heightMultiplier: Util.px_45 * SizeConfig.heightMultiplier,
          // padding: EdgeInsets.all(Util.px_5 * SizeConfig.heightMultiplier),
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
               decoration: _drawerNotSelectedBackground(),
                alignment: Alignment.center,
                width: Util.px_45 * SizeConfig.heightMultiplier,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(navigationItems[i].title,
                    style: mSelectedIndex==i?selectedMenuTextStyle:menuTextStyle,),
                ),
              ),
              mSelectedIndex==i?Expanded(
                child: Image(image: AssetImage(Images.side_curve),
                  color: Colors.deepPurpleAccent.withAlpha(50),
                  fit:BoxFit.fitHeight,
                  width: Util.px_15 * SizeConfig.heightMultiplier,
                ),
              ):new Container(),
            ],
          ),
        ),
      )
    );
  }
/*  Widget _verticalTextWidget(int i){
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            mSelectedIndex=i;
          });
        },
        child: Container(

          decoration: mSelectedIndex==i?_drawerSelectedBackground():_drawerNotSelectedBackground(),
          width: mSelectedIndex==i?Util.px_60 * SizeConfig.heightMultiplier: Util.px_45 * SizeConfig.heightMultiplier,
          padding: EdgeInsets.all(Util.px_5 * SizeConfig.heightMultiplier),
         alignment: Alignment.center,
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(navigationItems[i].title,
            style: mSelectedIndex==i?selectedMenuTextStyle:menuTextStyle,),
          ),
        ),
      ),
    );
  }*/


  BoxDecoration _drawerSelectedBackground() {
    // Add box decoration
    return BoxDecoration(
      // Box decoration takes a gradient
      borderRadius: BorderRadius.only(
          bottomRight:Radius.elliptical(25, 80)
          /*Radius.circular(Util.px_25 * SizeConfig.heightMultiplier)*/,
          topRight: Radius.elliptical(25, 80)/*Radius.circular(Util.px_25 * SizeConfig.heightMultiplier)*/),
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.deepPurpleAccent.withAlpha(50),
          Colors.deepPurpleAccent.withAlpha(50),
        ],
      ),
    );
  }
  BoxDecoration _drawerNotSelectedBackground() {
    // Add box decoration
    return BoxDecoration(

      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.deepPurpleAccent.withAlpha(50),
          Colors.deepPurpleAccent.withAlpha(50),
        ],
      ),
    );
  }

  BoxDecoration _drawerBackground() {
    // Add box decoration
    return BoxDecoration(
      // Box decoration takes a gradient
      borderRadius: BorderRadius.only(
          bottomRight:
              Radius.circular(Util.px_80 * SizeConfig.heightMultiplier),
          topRight: Radius.circular(Util.px_80 * SizeConfig.heightMultiplier)),
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.deepPurpleAccent.withAlpha(50),
          Colors.deepPurpleAccent.withAlpha(50),
        ],
      ),
    );
  }
  BoxDecoration _drawerTopCornerBackground() {
    // Add box decoration
    return BoxDecoration(
      // Box decoration takes a gradient
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(Util.px_80 * SizeConfig.heightMultiplier)),
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.deepPurpleAccent.withAlpha(50),
          Colors.deepPurpleAccent.withAlpha(50),
        ],
      ),
    );
  }

  BoxDecoration _drawerBottomCornerBackground() {
    // Add box decoration
    return BoxDecoration(
      // Box decoration takes a gradient
      borderRadius: BorderRadius.only(
          bottomRight:
          Radius.circular(Util.px_80 * SizeConfig.heightMultiplier),
      ),
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.deepPurpleAccent.withAlpha(50),
          Colors.deepPurpleAccent.withAlpha(50),
        ],
      ),
    );
  }

  BoxDecoration _drawerWhiteBackground() {
    // Add box decoration
    return BoxDecoration(
      // Box decoration takes a gradient
      borderRadius: BorderRadius.only(
          bottomRight:
              Radius.circular(Util.px_80 * SizeConfig.heightMultiplier),
          topRight: Radius.circular(Util.px_80 * SizeConfig.heightMultiplier)),
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.white,
          Colors.white,
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(size.height * 0.75, size.width * 0.25);
    path.quadraticBezierTo(
        size.width* 0.75 , size.height / 2, size.width* 0.75, size.height /2);
    path.lineTo(size.width* 0.75, 0);
    path.lineTo(size.width, 0);

/*
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);*/

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
