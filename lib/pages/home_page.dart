import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';

import 'package:zomato_test/common/app_colors.dart';
import 'package:zomato_test/common/size_config.dart';
import 'package:zomato_test/common/strings.dart';
import 'package:zomato_test/data/api.dart';
import 'package:zomato_test/models/category_obj.dart';
import 'package:zomato_test/pages/restaurants.dart';
import 'package:zomato_test/pages/ui/collapsing_navigation_drawer.dart';
import 'package:zomato_test/util/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;

  List<CategoryObj> categoryList = new List<CategoryObj>();

  _getCategories() {
    API.getCategories().then((response) {
      setState(() {
        var objsJson = jsonDecode(response.body)['categories'] as List;
        categoryList = objsJson
            .map((categoryJson) =>
                CategoryObj.fromJson(categoryJson['categories']))
            .toList();
        setTabData();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategories();
  }

  void _setActiveTabIndex() {
    setState(() {
      print("D a ${_tabController.index}");
      tabIndex = _tabController.index;
      // offerList=null;
      // _getAppDealsbyCategory(categoryList[tabIndex].Id);
    });
  }

  void setTabData() {
    _tabController =
        new TabController(vsync: this, length: categoryList.length);
    _tabController.addListener(_setActiveTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            CollapsingNavigationDrawer(),
            categoryList.length == 0
                ? Expanded(
                    child: new Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Expanded(
                    child: DefaultTabController(
                      length: categoryList.length,
                      child: NestedScrollView(
                        headerSliverBuilder: (context, value) {
                          return [
                            SliverToBoxAdapter(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: Util.px_60 *
                                        SizeConfig.heightMultiplier,
                                    left: Util.px_20 *
                                        SizeConfig.heightMultiplier),
                                child: Text(
                                  Strings.food_delivery,
                                  style: TextStyle(
                                    color: AppColor.ff253851,
                                    fontWeight: FontWeight.normal,
                                    fontSize:
                                        Util.px_20 * SizeConfig.textMultiplier,
                                    fontFamily: 'Roboto',
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SliverAppBar(
                              backgroundColor: Colors.white,
                              // expandedHeight: Util.px_300 * SizeConfig.heightMultiplier,
                              pinned: true,
                              automaticallyImplyLeading: false,
                              flexibleSpace: SafeArea(
                                child: TabBar(
                                  labelColor: Colors.black,
                                  indicatorColor: Colors.transparent,
                                  isScrollable: true,
                                  unselectedLabelColor: Colors.grey,
                                  controller: _tabController,
                                  tabs: [
                                    for (int i = 0;
                                        i < categoryList.length;
                                        i++)
                                      Tab(
                                        /*text: categoryList[i].name,*/
                                        child: _tabController.index == i
                                            ? _itemSelected(i)
                                            : _itemUnSelected(i),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ];
                        },
                        body: TabBarView(
                          controller: _tabController,
                          children: [
                            for (int i = 0; i < categoryList.length; i++)
                              Restaurants(),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ));
  }

  //------------------
  Widget _itemSelected(int index) {
    return Container(
      decoration: _itemSelectedBackground(),
      padding: EdgeInsets.only(
          left: Util.px_15 * SizeConfig.heightMultiplier,
          right: Util.px_15 * SizeConfig.heightMultiplier,
          top: Util.px_8 * SizeConfig.heightMultiplier,
          bottom: Util.px_8 * SizeConfig.heightMultiplier),
      child: Text(categoryList[index].name,
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: Util.px_14 * SizeConfig.textMultiplier,
            fontFamily: 'Roboto',
          )),
    );
  }

  //------------------
  Widget _itemUnSelected(int index) {
    return Container(
      child: Text(categoryList[index].name,
          style: TextStyle(
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: Util.px_14 * SizeConfig.textMultiplier,
            fontFamily: 'Roboto',
          )),
    );
  }

  //------------------
  BoxDecoration _itemSelectedBackground() {
    // Add box decoration
    return BoxDecoration(
      // Box decoration takes a gradient
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Util.px_15 * SizeConfig.heightMultiplier),
          topRight: Radius.circular(Util.px_15 * SizeConfig.heightMultiplier)),
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.blueAccent.withAlpha(70),
          Colors.blueAccent.withAlpha(70),
        ],
      ),
    );
  }
}
