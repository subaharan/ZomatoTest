import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zomato_test/common/app_colors.dart';
import 'package:zomato_test/common/size_config.dart';
import 'package:zomato_test/common/strings.dart';
import 'package:zomato_test/models/restaurant_obj.dart';
import 'package:zomato_test/util/utils.dart';

class RestaurantDetail extends StatefulWidget {
  RestaurantObj mRestaurant;

  RestaurantDetail({Key key, @required this.mRestaurant}) : super(key: key);

  @override
  _RestaurantDetailStatefull createState() => _RestaurantDetailStatefull();
}

class _RestaurantDetailStatefull extends State<RestaurantDetail> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: Util.px_200 * SizeConfig.heightMultiplier,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.mRestaurant.name),
              background: Image.network(
                widget.mRestaurant.featuredImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: ListView(
              children: [
                _ratingWidget(),
                _reviewWidget(),
                _addressWidget(),
                _timingWidget(),
                _phoneWidget(),
                _imageWidget(),
                _cuisinesWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }


//-------------
  Widget _ratingWidget(){
    return Row(
      children: [
        SizedBox(width: Util.px_15 * SizeConfig.heightMultiplier,),
        RatingBar(
          initialRating: double.parse(
              widget.mRestaurant.userRating.aggregateRating.toString()),
          minRating: 1,
          itemSize: Util.px_20 * SizeConfig.heightMultiplier,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Text(
          widget.mRestaurant.userRating.aggregateRating.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: Util.px_13 * SizeConfig.textMultiplier,
            fontFamily: 'Roboto',
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: Util.px_10 * SizeConfig.heightMultiplier),
          child:  Text(
            widget.mRestaurant.isDeliveringNow ==1?Strings.delivery_available:Strings.delivery_not_available,
            style: TextStyle(
              color: widget.mRestaurant.isDeliveringNow==1?Colors.green:Colors.red,
              fontSize: Util.px_11 * SizeConfig.textMultiplier,
              fontFamily: 'Roboto',
            ),
          ),
        )
      ],
    );
  }

//-------------
  Widget _reviewWidget(){
    return Container(
      margin: EdgeInsets.only(top: Util.px_5 * SizeConfig.heightMultiplier, left: Util.px_15 * SizeConfig.heightMultiplier),
      child: RichText(
        text: TextSpan(
            text: "${widget.mRestaurant.allReviewsCount} ",
            style: TextStyle(
              color: Colors.black,
              fontSize: Util.px_14 * SizeConfig.textMultiplier,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: Strings.reviews,
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: Util.px_15 * SizeConfig.textMultiplier,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.normal)),

            ]),
      ),
    );
  }

//-------------
  Widget _addressWidget(){
    return Container(
      margin: EdgeInsets.only(top: Util.px_10 * SizeConfig.heightMultiplier, left: Util.px_15 * SizeConfig.heightMultiplier),
      child: RichText(
        text: TextSpan(
            text: Strings.address,
            style: TextStyle(
              color: Colors.black,
              fontSize: Util.px_14 * SizeConfig.textMultiplier,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' : \n${widget.mRestaurant.location.address}, ${widget.mRestaurant.location.localityVerbose}',
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: Util.px_14 * SizeConfig.textMultiplier,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.normal)),

            ]),
      ),
    );
  }

//-------------
  Widget _timingWidget(){
    return Container(
      margin: EdgeInsets.only(top: Util.px_10 * SizeConfig.heightMultiplier, left: Util.px_15 * SizeConfig.heightMultiplier),
      child: RichText(
        text: TextSpan(
            text: Strings.timings,
            style: TextStyle(
              color: Colors.black,
              fontSize: Util.px_14 * SizeConfig.textMultiplier,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' : \n${widget.mRestaurant.timings} ',
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: Util.px_14 * SizeConfig.textMultiplier,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.normal)),

            ]),
      ),
    );
  }

//-------------
  Widget _phoneWidget(){
    return Container(
      margin: EdgeInsets.only(top: Util.px_10 * SizeConfig.heightMultiplier, left: Util.px_15 * SizeConfig.heightMultiplier),
      child: RichText(
        text: TextSpan(
            text: Strings.phone_number,
            style: TextStyle(
              color: Colors.black,
              fontSize: Util.px_14 * SizeConfig.textMultiplier,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' : ${widget.mRestaurant.phoneNumbers} ',
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: Util.px_14 * SizeConfig.textMultiplier,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.normal)),

            ]),
      ),
    );
  }

//-------------
  Widget _cuisinesWidget(){
    return Container(
      margin: EdgeInsets.only(top: Util.px_10 * SizeConfig.heightMultiplier, left: Util.px_15 * SizeConfig.heightMultiplier),
      child: RichText(
        text: TextSpan(
            text: Strings.cuisines,
            style: TextStyle(
              color: Colors.black,
              fontSize: Util.px_14 * SizeConfig.textMultiplier,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' : ${widget.mRestaurant.cuisines} ',
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: Util.px_14 * SizeConfig.textMultiplier,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.normal)),

            ]),
      ),
    );
  }

//-------------
Widget _imageWidget(){
    return Container(
      margin: EdgeInsets.only(top: Util.px_20 * SizeConfig.heightMultiplier),
      alignment: Alignment.center,
      height: Util.px_200 * SizeConfig.heightMultiplier,
      child: Stack(
        children: [
          Container(

            child: Image.network(
              widget.mRestaurant.featuredImage,
              fit: BoxFit.cover,
            ),
          )
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
}
