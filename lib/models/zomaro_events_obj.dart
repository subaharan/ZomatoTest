
import 'photos_obj.dart';

class ZomatoEventsObj {
  Event event;

  ZomatoEventsObj({this.event});

  ZomatoEventsObj.fromJson(Map<String, dynamic> json) {
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.event != null) {
      data['event'] = this.event.toJson();
    }
    return data;
  }
}


class Event {
  int eventId;
  String friendlyStartDate;
  String friendlyEndDate;
  String friendlyTimingStr;
  String startDate;
  String endDate;
  String endTime;
  String startTime;
  int isActive;
  String dateAdded;
  List<PhotosObj> photos;

  int isValid;
  String shareUrl;
  int showShareUrl;
  String title;
  String description;
  String displayTime;
  String displayDate;
  int isEndTimeSet;
  String disclaimer;
  int eventCategory;
  String eventCategoryName;
  String bookLink;
  List<Types> types;
  ShareData shareData;

  Event(
      {this.eventId,
        this.friendlyStartDate,
        this.friendlyEndDate,
        this.friendlyTimingStr,
        this.startDate,
        this.endDate,
        this.endTime,
        this.startTime,
        this.isActive,
        this.dateAdded,
        this.photos,

        this.isValid,
        this.shareUrl,
        this.showShareUrl,
        this.title,
        this.description,
        this.displayTime,
        this.displayDate,
        this.isEndTimeSet,
        this.disclaimer,
        this.eventCategory,
        this.eventCategoryName,
        this.bookLink,
        this.types,
        this.shareData});

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    friendlyStartDate = json['friendly_start_date'];
    friendlyEndDate = json['friendly_end_date'];
    friendlyTimingStr = json['friendly_timing_str'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    startTime = json['start_time'];
    isActive = json['is_active'];
    dateAdded = json['date_added'];
    if (json['photos'] != null) {
      photos = new List<PhotosObj>();
      json['photos'].forEach((v) {
        photos.add(new PhotosObj.fromJson(v));
      });
    }

    isValid = json['is_valid'];
    shareUrl = json['share_url'];
    showShareUrl = json['show_share_url'];
    title = json['title'];
    description = json['description'];
    displayTime = json['display_time'];
    displayDate = json['display_date'];
    isEndTimeSet = json['is_end_time_set'];
    disclaimer = json['disclaimer'];
    eventCategory = json['event_category'];
    eventCategoryName = json['event_category_name'];
    bookLink = json['book_link'];
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
    shareData = json['share_data'] != null
        ? new ShareData.fromJson(json['share_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['friendly_start_date'] = this.friendlyStartDate;
    data['friendly_end_date'] = this.friendlyEndDate;
    data['friendly_timing_str'] = this.friendlyTimingStr;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['end_time'] = this.endTime;
    data['start_time'] = this.startTime;
    data['is_active'] = this.isActive;
    data['date_added'] = this.dateAdded;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['is_valid'] = this.isValid;
    data['share_url'] = this.shareUrl;
    data['show_share_url'] = this.showShareUrl;
    data['title'] = this.title;
    data['description'] = this.description;
    data['display_time'] = this.displayTime;
    data['display_date'] = this.displayDate;
    data['is_end_time_set'] = this.isEndTimeSet;
    data['disclaimer'] = this.disclaimer;
    data['event_category'] = this.eventCategory;
    data['event_category_name'] = this.eventCategoryName;
    data['book_link'] = this.bookLink;
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    if (this.shareData != null) {
      data['share_data'] = this.shareData.toJson();
    }
    return data;
  }
}

class Types {
  String name;
  String color;

  Types({this.name, this.color});

  Types.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color'] = this.color;
    return data;
  }
}

class ShareData {
  int shouldShow;

  ShareData({this.shouldShow});

  ShareData.fromJson(Map<String, dynamic> json) {
    shouldShow = json['should_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['should_show'] = this.shouldShow;
    return data;
  }
}