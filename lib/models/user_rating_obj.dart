class UserRatingObj {
  var aggregateRating;
  var ratingText;
  var ratingColor;
  RatingObj ratingObj;
  int votes;

  UserRatingObj(
      {this.aggregateRating,
        this.ratingText,
        this.ratingColor,
        this.ratingObj,
        this.votes});

  UserRatingObj.fromJson(Map<String, dynamic> json) {
    aggregateRating = json['aggregate_rating'];
    ratingText = json['rating_text'];
    ratingColor = json['rating_color'];
    ratingObj = json['rating_obj'] != null
        ? new RatingObj.fromJson(json['rating_obj'])
        : null;
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aggregate_rating'] = this.aggregateRating;
    data['rating_text'] = this.ratingText;
    data['rating_color'] = this.ratingColor;
    if (this.ratingObj != null) {
      data['rating_obj'] = this.ratingObj.toJson();
    }
    data['votes'] = this.votes;
    return data;
  }
}

class RatingObj {
  Title title;
  BgColor bgColor;

  RatingObj({this.title, this.bgColor});

  RatingObj.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    bgColor = json['bg_color'] != null
        ? new BgColor.fromJson(json['bg_color'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.bgColor != null) {
      data['bg_color'] = this.bgColor.toJson();
    }
    return data;
  }
}

class Title {
  String text;

  Title({this.text});

  Title.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}
class BgColor {
  String type;
  String tint;

  BgColor({this.type, this.tint});

  BgColor.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    tint = json['tint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['tint'] = this.tint;
    return data;
  }
}