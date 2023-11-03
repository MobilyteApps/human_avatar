// To parse this JSON data, do
//
//     final avatarData = avatarDataFromJson(jsonString);

import 'dart:convert';

AvatarData avatarDataFromJson(String str) => AvatarData.fromJson(json.decode(str));

String avatarDataToJson(AvatarData data) => json.encode(data.toJson());

///this data class is used for create image avatar response handele
class AvatarData {
  String? avatarDataId; ///this is avatar id
  int? status;
  String? type;
  int? version;
  int? order;
  String? accountId;
  FrontendConfig? frontendConfig;
  AvatarConfig? avatarConfig;
  List<dynamic>? variants;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AvatarData({
    this.avatarDataId,
    this.status,
    this.type,
    this.version,
    this.order,
    this.accountId,
    this.frontendConfig,
    this.avatarConfig,
    this.variants,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AvatarData.fromJson(Map<String, dynamic> json) => AvatarData(
    avatarDataId: json["id"],
    status: json["status"],
    type: json["type"],
    version: json["version"],
    order: json["order"],
    accountId: json["accountId"],
    frontendConfig: json["frontendConfig"] == null ? null : FrontendConfig.fromJson(json["frontendConfig"]),
    avatarConfig: json["avatarConfig"] == null ? null : AvatarConfig.fromJson(json["avatarConfig"]),
    variants: json["variants"] == null ? [] : List<dynamic>.from(json["variants"]!.map((x) => x)),
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "id": avatarDataId,
    "status": status,
    "type": type,
    "version": version,
    "order": order,
    "accountId": accountId,
    "frontendConfig": frontendConfig?.toJson(),
    "avatarConfig": avatarConfig?.toJson(),
    "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class AvatarConfig {
  String? userAlphaChannelImgS3;
  String? userPhotoS3;

  AvatarConfig({
    this.userAlphaChannelImgS3,
    this.userPhotoS3,
  });

  factory AvatarConfig.fromJson(Map<String, dynamic> json) => AvatarConfig(
    userAlphaChannelImgS3: json["user_alpha_channel_img_s3"],
    userPhotoS3: json["user_photo_s3"],
  );

  Map<String, dynamic> toJson() => {
    "user_alpha_channel_img_s3": userAlphaChannelImgS3,
    "user_photo_s3": userPhotoS3,
  };
}

class FrontendConfig {
  String? gender;
  String? thumbnail;
  String? canvas;
  Tilt? tilt;
  FaceBbox? faceBbox;

  FrontendConfig({
    this.gender,
    this.thumbnail,
    this.canvas,
    this.tilt,
    this.faceBbox,
  });

  factory FrontendConfig.fromJson(Map<String, dynamic> json) => FrontendConfig(
    gender: json["gender"],
    thumbnail: json["thumbnail"],
    canvas: json["canvas"],
    tilt: json["tilt"] == null ? null : Tilt.fromJson(json["tilt"]),
    faceBbox: json["faceBbox"] == null ? null : FaceBbox.fromJson(json["faceBbox"]),
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "thumbnail": thumbnail,
    "canvas": canvas,
    "tilt": tilt?.toJson(),
    "faceBbox": faceBbox?.toJson(),
  };
}

class FaceBbox {
  int? x;
  int? y;
  int? faceWidth;
  int? faceHeight;

  FaceBbox({
    this.x,
    this.y,
    this.faceWidth,
    this.faceHeight,
  });

  factory FaceBbox.fromJson(Map<String, dynamic> json) => FaceBbox(
    x: json["x"],
    y: json["y"],
    faceWidth: json["faceWidth"],
    faceHeight: json["faceHeight"],
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "faceWidth": faceWidth,
    "faceHeight": faceHeight,
  };
}

class Tilt {
  String? top;
  String? left;
  String? zoom;

  Tilt({
    this.top,
    this.left,
    this.zoom,
  });

  factory Tilt.fromJson(Map<String, dynamic> json) => Tilt(
    top: json["top"].toString(),
    left: json["left"].toString(),
    zoom: json["zoom"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "top": top,
    "left": left,
    "zoom": zoom,
  };
}
