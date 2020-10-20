class PhotosObj {
  Photo photo;

  PhotosObj({this.photo});

  PhotosObj.fromJson(Map<String, dynamic> json) {
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.photo != null) {
      data['photo'] = this.photo.toJson();
    }
    return data;
  }
}

class Photo {
  String url;
  String thumbUrl;
  int order;
  String md5sum;
  int id;
  int photoId;
  int uuid;
  String type;

  Photo(
      {this.url,
        this.thumbUrl,
        this.order,
        this.md5sum,
        this.id,
        this.photoId,
        this.uuid,
        this.type});

  Photo.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    thumbUrl = json['thumb_url'];
    order = json['order'];
    md5sum = json['md5sum'];
    id = json['id'];
    photoId = json['photo_id'];
    uuid = json['uuid'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['thumb_url'] = this.thumbUrl;
    data['order'] = this.order;
    data['md5sum'] = this.md5sum;
    data['id'] = this.id;
    data['photo_id'] = this.photoId;
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    return data;
  }
}
