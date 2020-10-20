
import 'package:zomato_test/models/user_rating_obj.dart';

import 'location_obj.dart';
import 'zomaro_events_obj.dart';

class RestaurantObj {
  String apikey;
  String id;
  String name;
  String url;
  LocationObj location;
  int switchToOrderMenu;
  String cuisines;
  String timings;
  int averageCostForTwo;
  int priceRange;
  String currency;

  List<ZomatoEventsObj> zomatoEvents;
  int opentableSupport;
  int isZomatoBookRes;
  String mezzoProvider;
  int isBookFormWebView;
  String bookFormWebViewUrl;
  String bookAgainUrl;
  String thumb;
  UserRatingObj userRating;
  int allReviewsCount;
  String photosUrl;
  int photoCount;
  String menuUrl;
  String featuredImage;
  var medioProvider;
  var hasOnlineDelivery;
  var isDeliveringNow;
  var storeType;
  bool includeBogoOffers;
  var deeplink;
  int isTableReservationSupported;
  int hasTableBooking;
  String eventsUrl;
  String phoneNumbers;

  RestaurantObj(
      {
        this.apikey,
        this.id,
        this.name,
        this.url,
        this.location,
        this.switchToOrderMenu,
        this.cuisines,
        this.timings,
        this.averageCostForTwo,
        this.priceRange,
        this.currency,
        this.zomatoEvents,
        this.opentableSupport,
        this.isZomatoBookRes,
        this.mezzoProvider,
        this.isBookFormWebView,
        this.bookFormWebViewUrl,
        this.bookAgainUrl,
        this.thumb,
        this.userRating,
        this.allReviewsCount,
        this.photosUrl,
        this.photoCount,
        this.menuUrl,
        this.featuredImage,
        this.medioProvider,
        this.hasOnlineDelivery,
        this.isDeliveringNow,
        this.storeType,
        this.includeBogoOffers,
        this.deeplink,
        this.isTableReservationSupported,
        this.hasTableBooking,
        this.eventsUrl,
        this.phoneNumbers,
});

  RestaurantObj.fromJson(Map<String, dynamic> json) {

    apikey = json['apikey'];
    id = json['id'];
    name = json['name'];
    url = json['url'];
    location = json['location'] != null
        ? new LocationObj.fromJson(json['location'])
        : null;
    switchToOrderMenu = json['switch_to_order_menu'];
    cuisines = json['cuisines'];
    timings = json['timings'];
    averageCostForTwo = json['average_cost_for_two'];
    priceRange = json['price_range'];
    currency = json['currency'];
    if (json['zomato_events'] != null) {
      zomatoEvents = new List<ZomatoEventsObj>();
      json['zomato_events'].forEach((v) {
        zomatoEvents.add(new ZomatoEventsObj.fromJson(v));
      });
    }
    opentableSupport = json['opentable_support'];
    isZomatoBookRes = json['is_zomato_book_res'];
    mezzoProvider = json['mezzo_provider'];
    isBookFormWebView = json['is_book_form_web_view'];
    bookFormWebViewUrl = json['book_form_web_view_url'];
    bookAgainUrl = json['book_again_url'];
    thumb = json['thumb'];
    userRating = json['user_rating'] != null
        ? new UserRatingObj.fromJson(json['user_rating'])
        : null;
    allReviewsCount = json['all_reviews_count'];
    photosUrl = json['photos_url'];
    photoCount = json['photo_count'];
    menuUrl = json['menu_url'];
    featuredImage = json['featured_image'];
    medioProvider = json['medio_provider'];
    hasOnlineDelivery = json['has_online_delivery'];
    isDeliveringNow = json['is_delivering_now'];
    storeType = json['store_type'];
    includeBogoOffers = json['include_bogo_offers'];
    deeplink = json['deeplink'];
    isTableReservationSupported = json['is_table_reservation_supported'];
    hasTableBooking = json['has_table_booking'];
    eventsUrl = json['events_url'];
    phoneNumbers = json['phone_numbers'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apikey'] = this.apikey;
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['switch_to_order_menu'] = this.switchToOrderMenu;
    data['cuisines'] = this.cuisines;
    data['timings'] = this.timings;
    data['average_cost_for_two'] = this.averageCostForTwo;
    data['price_range'] = this.priceRange;
    data['currency'] = this.currency;

    if (this.zomatoEvents != null) {
      data['zomato_events'] = this.zomatoEvents.map((v) => v.toJson()).toList();
    }
    data['opentable_support'] = this.opentableSupport;
    data['is_zomato_book_res'] = this.isZomatoBookRes;
    data['mezzo_provider'] = this.mezzoProvider;
    data['is_book_form_web_view'] = this.isBookFormWebView;
    data['book_form_web_view_url'] = this.bookFormWebViewUrl;
    data['book_again_url'] = this.bookAgainUrl;
    data['thumb'] = this.thumb;
    if (this.userRating != null) {
      data['user_rating'] = this.userRating.toJson();
    }
    data['all_reviews_count'] = this.allReviewsCount;
    data['photos_url'] = this.photosUrl;
    data['photo_count'] = this.photoCount;
    data['menu_url'] = this.menuUrl;
    data['featured_image'] = this.featuredImage;
    data['medio_provider'] = this.medioProvider;
    data['has_online_delivery'] = this.hasOnlineDelivery;
    data['is_delivering_now'] = this.isDeliveringNow;
    data['store_type'] = this.storeType;
    data['include_bogo_offers'] = this.includeBogoOffers;
    data['deeplink'] = this.deeplink;
    data['is_table_reservation_supported'] = this.isTableReservationSupported;
    data['has_table_booking'] = this.hasTableBooking;
    data['events_url'] = this.eventsUrl;
    data['phone_numbers'] = this.phoneNumbers;

    return data;
  }
}
