// To parse this JSON data, do
//
//     final avatarData = avatarDataFromJson(jsonString);

import 'dart:convert';

AvatarData avatarDataFromJson(String str) =>
    AvatarData.fromJson(json.decode(str));

String avatarDataToJson(AvatarData data) => json.encode(data.toJson());

///[AvatarData] data class is used for create image avatar response handle
/// [avatarDataId] that contain String value of Avatar Image ID
/// [Status] is contain Integer value
/// [type] ,[accountId] , [id] is contain String  value
/// [version] , [order] ,[v] is contain integer value
/// [FrontendConfig] is contains object value
/// [AvatarConfig] is contains object value
/// [createdAt], [updatedAt] is contains [DateTime] value
class AvatarData {
  /// The avatarDataId this wraps.
  String? avatarDataId;

  /// The status this wraps.

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

  ///this is constructor of [AvatarData] class
  /// [avatarDataId] that contain String value of Avatar Image ID
  /// [Status] is contain Integer value
  /// [type] ,[accountId] , [id] is contain String  value
  /// [version] , [order] ,[v] is contain integer value
  /// [FrontendConfig] is contains object value
  /// [AvatarConfig] is contains object value
  /// [createdAt], [updatedAt] is contains [DateTime] value
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

  /// [avatarDataId] that contain String value of Avatar Image ID
  /// [Status] is contain Integer value
  /// [type] ,[accountId] , [id] is contain String  value
  /// [version] , [order] ,[v] is contain integer value
  /// [FrontendConfig] is contains object value
  /// [AvatarConfig] is contains object value
  /// [createdAt], [updatedAt] is contains [DateTime] value
  /// Parse it using the dart:convert package instead of json5.
  factory AvatarData.fromJson(Map<String, dynamic> json) => AvatarData(
        avatarDataId: json["id"],
        status: json["status"],
        type: json["type"],
        version: json["version"],
        order: json["order"],
        accountId: json["accountId"],
        frontendConfig: json["frontendConfig"] == null
            ? null
            : FrontendConfig.fromJson(json["frontendConfig"]),
        avatarConfig: json["avatarConfig"] == null
            ? null
            : AvatarConfig.fromJson(json["avatarConfig"]),
        variants: json["variants"] == null
            ? []
            : List<dynamic>.from(json["variants"]!.map((x) => x)),
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  /// [avatarDataId] that contain String value of Avatar Image ID
  /// [Status] is contain Integer value
  /// [type] ,[accountId] , [id] is contain String  value
  /// [version] , [order] ,[v] is contain integer value
  /// [FrontendConfig] is contains object value
  /// [AvatarConfig] is contains object value
  /// [createdAt], [updatedAt] is contains [DateTime] value
  Map<String, dynamic> toJson() => {
        "id": avatarDataId,
        "status": status,
        "type": type,
        "version": version,
        "order": order,
        "accountId": accountId,
        "frontendConfig": frontendConfig?.toJson(),
        "avatarConfig": avatarConfig?.toJson(),
        "variants":
            variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

///[AvatarConfig] data class that contains [userAlphaChannelImgS3] , [userPhotoS3] String values
class AvatarConfig {
  String? userAlphaChannelImgS3;
  String? userPhotoS3;

  ///This is constructor of class [AvatarConfig]
  ///[userAlphaChannelImgS3] , [userPhotoS3] String values contains
  AvatarConfig({
    this.userAlphaChannelImgS3,
    this.userPhotoS3,
  });

  ///[userAlphaChannelImgS3] , [userPhotoS3] String values contains
  factory AvatarConfig.fromJson(Map<String, dynamic> json) => AvatarConfig(
        userAlphaChannelImgS3: json["user_alpha_channel_img_s3"],
        userPhotoS3: json["user_photo_s3"],
      );

  Map<String, dynamic> toJson() => {
        "user_alpha_channel_img_s3": userAlphaChannelImgS3,
        "user_photo_s3": userPhotoS3,
      };
}

///[AvatarConfig] data class that contains [gender] , [thumbnail] ,[canvas] ,[tilt] ,[faceBbox] values
///[tilt],[faceBbox] is contains object value
///[gender] , [thumbnail] ,[canvas] contains String values

class FrontendConfig {
  String? gender;
  String? thumbnail;
  String? canvas;
  Tilt? tilt;
  FaceBbox? faceBbox;

  ///This is constructor of class [FrontendConfig]
  ///[tilt],[faceBbox] is contains object value
  ///[gender] , [thumbnail] ,[canvas] contains String values
  FrontendConfig({
    this.gender,
    this.thumbnail,
    this.canvas,
    this.tilt,
    this.faceBbox,
  });

  ///[tilt],[faceBbox] is contains object value
  ///[gender] , [thumbnail] ,[canvas] contains String values
  factory FrontendConfig.fromJson(Map<String, dynamic> json) => FrontendConfig(
        gender: json["gender"],
        thumbnail: json["thumbnail"],
        canvas: json["canvas"],
        tilt: json["tilt"] == null ? null : Tilt.fromJson(json["tilt"]),
        faceBbox: json["faceBbox"] == null
            ? null
            : FaceBbox.fromJson(json["faceBbox"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "thumbnail": thumbnail,
        "canvas": canvas,
        "tilt": tilt?.toJson(),
        "faceBbox": faceBbox?.toJson(),
      };
}

///[FaceBbox] data class that contains [x] , [y] ,[faceWidth] ,[faceHeight] integer values

class FaceBbox {
  int? x;
  int? y;
  int? faceWidth;
  int? faceHeight;

  ///This is constructor of class [FaceBbox]
  ///[x] , [y] ,[faceWidth] ,[faceHeight] contains integer values
  FaceBbox({
    this.x,
    this.y,
    this.faceWidth,
    this.faceHeight,
  });

  ///[x] , [y] ,[faceWidth] ,[faceHeight] contains integer values
  factory FaceBbox.fromJson(Map<String, dynamic> json) => FaceBbox(
        x: json["x"],
        y: json["y"],
        faceWidth: json["faceWidth"],
        faceHeight: json["faceHeight"],
      );

  ///[x] , [y] ,[faceWidth] ,[faceHeight] contains integer values

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
        "faceWidth": faceWidth,
        "faceHeight": faceHeight,
      };
}

///[Tilt] data class that contains [top] , [left] ,[zoom] String values
class Tilt {
  String? top;
  String? left;
  String? zoom;

  ///This is constructor of class [Tilt]
  ///contains [top] , [left] ,[zoom] String values

  Tilt({
    this.top,
    this.left,
    this.zoom,
  });

  ///contains [top] , [left] ,[zoom] String values

  factory Tilt.fromJson(Map<String, dynamic> json) => Tilt(
        top: json["top"].toString(),
        left: json["left"].toString(),
        zoom: json["zoom"].toString(),
      );

  ///contains [top] , [left] ,[zoom] String values

  Map<String, dynamic> toJson() => {
        "top": top,
        "left": left,
        "zoom": zoom,
      };
}
