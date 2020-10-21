import 'package:flutter/material.dart';
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
  double _minWidth = Util.px_45 * SizeConfig.heightMultiplier;
  bool _isCollapsed = true;
  AnimationController _animationController;
  Animation<double> _withAnimation;
  int _currentIndexMenu = 0;
  int mSelectedIndex=3;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _withAnimation =
        Tween(begin: _minWidth, end: _minWidth).animate(_animationController);
    initiate();
  }

  void initiate() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        setState(() async {
          _isCollapsed=true;
        });
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(BuildContext context, Widget widget) {
    return Material(
      color: Colors.transparent,
      elevation: 80,
      child: Container(
        width: Util.px_45 * SizeConfig.heightMultiplier,
        decoration: _drawerWhiteBackground(),
        child: Container(
          // width: _withAnimation.value,
          width: Util.px_45 * SizeConfig.heightMultiplier,
          decoration: _drawerBackground(),
          // color: drawerBackgroundColor,
          child: Column(
            children: <Widget>[
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

              Expanded(
                child: Column(
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
              SizedBox(height: Util.px_40 * SizeConfig.heightMultiplier,),
              InkWell(
                onTap: () {
                  setState(() {
                    print("IsCollapsed before${_isCollapsed}");
                    _isCollapsed = !_isCollapsed;
                    print("IsCollapsed after ${_isCollapsed}");
                    _isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: Icon(Icons.content_paste, color: Colors.black,
                  size: Util.px_24 * SizeConfig.heightMultiplier,),
               /* child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.black,
                  size: Util.px_24 * SizeConfig.heightMultiplier,
                ),*/
              ),
              SizedBox(
                height: Util.px_40 * SizeConfig.heightMultiplier,
              ),
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
    return GestureDetector(
      onTap: (){
        setState(() {
          mSelectedIndex=i;
        });
      },
      child: Container(
        padding: EdgeInsets.all(Util.px_5 * SizeConfig.heightMultiplier),
       alignment: Alignment.center,
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(navigationItems[i].title,
          style: mSelectedIndex==i?selectedMenuTextStyle:menuTextStyle,),
        ),
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
