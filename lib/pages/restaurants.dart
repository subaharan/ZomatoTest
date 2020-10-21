import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:location_permissions/location_permissions.dart';

import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';
import 'package:zomato_test/common/app_colors.dart';
import 'package:zomato_test/common/size_config.dart';
import 'package:zomato_test/common/strings.dart';
import 'package:zomato_test/data/api.dart';
import 'package:zomato_test/models/restaurant_obj.dart';
import 'package:zomato_test/util/utils.dart';

import 'restaurant_detail.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsStatefull createState() => _RestaurantsStatefull();
}

class _RestaurantsStatefull extends State<Restaurants> {
  List<RestaurantObj> mRestaurantList = null;
  List<RestaurantObj> mPopularRestaurantList = null;
  int mPage = 0;
  int mPagePopular = 0;
  int mHealthPage = 0;
  ScrollController _controller;
  ScrollController _popularController;
  double mRadius = 50;
  int mCount = 20;
  double latitude = 1.290270;
  double longitude = 103.851959;
  Position mPosition;

  _getSearch() {
    API.getSearch(latitude, longitude, mCount, mRadius,null,mPage).then((response) {
      setState(() {
        var mapResponse = json.decode(response.body);
        Iterable list = mapResponse['restaurants'];
        if(mPage==0) {
          mRestaurantList = list
              .map((model) => RestaurantObj.fromJson(model['restaurant']))
              .toList();
        }else{
          List<RestaurantObj> tempList = list
              .map((model) => RestaurantObj.fromJson(model['restaurant']))
              .toList();
          mRestaurantList.addAll(tempList);
        }
      });
    });
  }

  _getSearchPopular() {
    API.getSearch(latitude, longitude, mCount, mRadius,'rating',mPagePopular).then((response) {
      setState(() {
        var mapResponse = json.decode(response.body);
        Iterable list = mapResponse['restaurants'];
        if(mPage==0) {
          mPopularRestaurantList = list
              .map((model) => RestaurantObj.fromJson(model['restaurant']))
              .toList();
        }else{
          List<RestaurantObj> tempList = list
              .map((model) => RestaurantObj.fromJson(model['restaurant']))
              .toList();
          mPopularRestaurantList.addAll(tempList);
        }

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _popularController = ScrollController();
    _popularController.addListener(_scrollHealthListener);
    getLocation();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        print("reach the bottom");
        mPage += 1;
        _getSearch();
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        print("reach the top");
      });
    }
  }

  _scrollHealthListener() {
    if (_popularController.offset >=
        _popularController.position.maxScrollExtent &&
        !_popularController.position.outOfRange) {
      mPagePopular +=1;
      _getSearchPopular();
      setState(() {
        print("reach the bottom");
      });
    }
    if (_popularController.offset <=
        _popularController.position.minScrollExtent &&
        !_popularController.position.outOfRange) {
      setState(() {
        print("reach the top");
      });
    }
  }

  Future<void> getLocation() async {
    PermissionStatus permission =
        await LocationPermissions().requestPermissions();
    switch (permission) {
      case PermissionStatus.granted:
        // do something
        print("Location granted");
        mPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        // List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(mPosition.latitude, mPosition.longitude);
        // print("Country ${placemark[0].country} - ${placemark[0].locality} - ${placemark[0].subLocality} ");

        latitude = mPosition.latitude;
        longitude = mPosition.longitude;
        _getSearch();
        _getSearchPopular();
        break;
      case PermissionStatus.denied:
        _getSearch();
        _getSearchPopular();
        break;
      case PermissionStatus.restricted:
        _getSearch();
        _getSearchPopular();
        break;
      case PermissionStatus.unknown:
        _getSearch();
        _getSearchPopular();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        mRestaurantList==null?new SliverToBoxAdapter():_titleText(Strings.near_you),
        SliverToBoxAdapter(
          child: mRestaurantList == null
              ? Container()
              : Container(
                  padding: EdgeInsets.only(
                      left: Util.px_20 * SizeConfig.heightMultiplier),
                  height: Util.px_420 * SizeConfig.imageSizeMultiplier,
                  child: ListView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: mRestaurantList.length,
                    itemBuilder: (context, index) {
                      return itemCard(mRestaurantList[index]);
                    },
                  ),
                ),
        ),
        mPopularRestaurantList==null?new SliverToBoxAdapter():_titleText(Strings.popular),
        SliverToBoxAdapter(
          child: mPopularRestaurantList == null
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(
                      left: Util.px_20 * SizeConfig.heightMultiplier),
                  height: Util.px_420 * SizeConfig.imageSizeMultiplier,
                  child: ListView.builder(
                    controller: _popularController,
                    scrollDirection: Axis.horizontal,
                    itemCount: mPopularRestaurantList.length,
                    itemBuilder: (context, index) {
                      return itemCard(mPopularRestaurantList[index]);
                    },
                  ),
                ),
        ),
        _viewAllButton()
      ],
    );
  }

  //------------------
  Widget itemCard(RestaurantObj item) {
    return GestureDetector(
      onTap: (){
        startNewsDetailsPage(item);
      },
      child: Container(
        width: Util.px_420 * SizeConfig.imageSizeMultiplier,
        child: Stack(
          children: [
            Card(
              margin: EdgeInsets.only(left: Util.px_30 * SizeConfig.heightMultiplier, right: Util.px_20 * SizeConfig.heightMultiplier,
              top: Util.px_20 * SizeConfig.heightMultiplier, bottom: Util.px_10 * SizeConfig.heightMultiplier),
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(Util.px_15 * SizeConfig.heightMultiplier),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.all(
                    Util.px_10 * SizeConfig.heightMultiplier,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            decoration: _favouriteIconBackground(),
                            padding: EdgeInsets.only(
                                left: Util.px_10 * SizeConfig.heightMultiplier,
                                right: Util.px_10 * SizeConfig.heightMultiplier,
                                top: Util.px_5 * SizeConfig.heightMultiplier,
                                bottom: Util.px_5 * SizeConfig.heightMultiplier),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(left: Util.px_5 * SizeConfig.heightMultiplier),
                        child: RichText(
                          text: TextSpan(
                              text: item.currency,
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: Util.px_16 * SizeConfig.textMultiplier,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '${item.averageCostForTwo} ',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: Util.px_16 * SizeConfig.textMultiplier,
                                        fontFamily: "ProximaNova",
                                        fontWeight: FontWeight.bold)),

                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Util.px_5 * SizeConfig.heightMultiplier, top: Util.px_5 * SizeConfig.heightMultiplier,),
                        child: Text(
                          item.name,
                          style: TextStyle(
                            color: AppColor.ff253851,
                            fontWeight: FontWeight.normal,
                            fontSize: Util.px_14 * SizeConfig.textMultiplier,
                            fontFamily: 'Roboto',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Util.px_5 * SizeConfig.heightMultiplier, top: Util.px_5 * SizeConfig.heightMultiplier,
                        bottom: Util.px_5 * SizeConfig.heightMultiplier),
                        child: Text(
                          item.cuisines,
                          style: TextStyle(
                            color: AppColor.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: Util.px_14 * SizeConfig.textMultiplier,
                            fontFamily: 'Roboto',
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )),
            ),
            Card(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(
                      Util.px_100 * SizeConfig.heightMultiplier)),
              color: Color(0xFF454F63),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    Util.px_100 * SizeConfig.heightMultiplier),
                child: Image.network(
                  "${item.featuredImage}",
                  height: Util.px_200 * SizeConfig.imageSizeMultiplier,
                  width: Util.px_200 * SizeConfig.imageSizeMultiplier,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //------------------
  Widget _titleText(String title) {
    return SliverPadding(
      padding: EdgeInsets.only(
          top: Util.px_30 * SizeConfig.heightMultiplier,
          bottom: Util.px_15 * SizeConfig.heightMultiplier,
          left: Util.px_20 * SizeConfig.heightMultiplier),
      sliver: new SliverList(
        delegate: new SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: Util.px_18 * SizeConfig.textMultiplier,
                  fontFamily: 'Roboto',
                ),
              ),
            );
          },
          childCount: 1,
        ),
      ),
    );
  }



  //------------------
  Widget _viewAllButton(){
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              _launchInWebViewWithJavaScript(mRestaurantList[0].url);
            },
            child: Container(
              margin: EdgeInsets.only(right: Util.px_15 * SizeConfig.heightMultiplier, top: Util.px_15 * SizeConfig.heightMultiplier),
              decoration: _viewButtonBackground(),
              padding: EdgeInsets.only(left: Util.px_25 * SizeConfig.heightMultiplier, right: Util.px_25 * SizeConfig.heightMultiplier,
              top: Util.px_10 * SizeConfig.heightMultiplier, bottom: Util.px_10 * SizeConfig.heightMultiplier),
              child: Text(
                Strings.view_all,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Util.px_20 * SizeConfig.textMultiplier,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  //------------------
  BoxDecoration _favouriteIconBackground() {
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

  //------------------
  BoxDecoration _viewButtonBackground() {
    // Add box decoration
    return BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Util.px_8 * SizeConfig.heightMultiplier),
          topRight: Radius.circular(Util.px_8 * SizeConfig.heightMultiplier),
      bottomRight: Radius.circular(Util.px_30 * SizeConfig.heightMultiplier),
      topLeft: Radius.circular(Util.px_30 * SizeConfig.heightMultiplier)),
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.0, 0.7],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.blueAccent,
          Colors.blueAccent,
        ],
      ),
    );
  }


  //-------------
  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  //---------------
  Future startNewsDetailsPage(RestaurantObj item) async {
    Map results =
    await Navigator.of(context).push<dynamic>(new PageRouteBuilder<Map>(
        opaque: false,
//        transitionDuration: Duration(days: 1),
        pageBuilder: (BuildContext context, _, __) {
          return RestaurantDetail(mRestaurant: item,);
        }));


  }
}
