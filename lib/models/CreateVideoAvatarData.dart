// To parse this JSON data, do
//
//     final createVideoAvatarData = createVideoAvatarDataFromJson(jsonString);

import 'dart:convert';

CreateVideoAvatarData createVideoAvatarDataFromJson(String str) =>
    CreateVideoAvatarData.fromJson(json.decode(str));

String createVideoAvatarDataToJson(CreateVideoAvatarData data) =>
    json.encode(data.toJson());

///[CreateVideoAvatarData] data class is used for handle response  create video from avatar
/// [id] that contain String value of Avatar video ID
/// [name] is contain String  value video name
/// [url] , [sourceId], [status], [userId], [accountId] is contain String Values
/// [deleted] , [verified], [public] is contain bool Values
/// [slides] is contains a list of items
/// [tags] is contains a list of items
/// [createdAt] , [updatedAt] is contain [DateTime] Values

class CreateVideoAvatarData {
  String? id;
  String? name;
  List<Slide>? slides;
  List<String>? tags;
  String? url;
  String? sourceId;
  bool? deleted;
  String? status;
  bool? verified;
  bool? public;
  String? userId;
  String? accountId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ///This is constructor of [CreateVideoAvatarData]
  CreateVideoAvatarData({
    this.id,
    this.name,
    this.slides,
    this.tags,
    this.url,
    this.sourceId,
    this.deleted,
    this.status,
    this.verified,
    this.public,
    this.userId,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  factory CreateVideoAvatarData.fromJson(Map<String, dynamic> json) =>
      CreateVideoAvatarData(
        id: json["_id"],
        name: json["name"],
        slides: json["slides"] == null
            ? []
            : List<Slide>.from(json["slides"]!.map((x) => Slide.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        url: json["url"],
        sourceId: json["sourceId"],
        deleted: json["deleted"],
        status: json["status"],
        verified: json["verified"],
        public: json["public"],
        userId: json["userId"],
        accountId: json["accountId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slides": slides == null
            ? []
            : List<dynamic>.from(slides!.map((x) => x.toJson())),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "url": url,
        "sourceId": sourceId,
        "deleted": deleted,
        "status": status,
        "verified": verified,
        "public": public,
        "userId": userId,
        "accountId": accountId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

///[Slide] data class is object class
/// [id] that contain int value
/// [animation] , [language], [speech], [voice], [voiceType], [voiceProvider] is contain String Values
/// [Canvas] ,[Avatar] is contains a object values
/// [tags] is contains a list of items

class Slide {
  int? id;
  Canvas? canvas;
  Avatar? avatar;
  String? animation;
  String? language;
  String? speech;
  String? voice;
  String? voiceType;
  String? voiceProvider;

  ///This is constructor of [Slide]
  Slide({
    this.id,
    this.canvas,
    this.avatar,
    this.animation,
    this.language,
    this.speech,
    this.voice,
    this.voiceType,
    this.voiceProvider,
  });

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        id: json["id"],
        canvas: json["canvas"] == null ? null : Canvas.fromJson(json["canvas"]),
        avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
        animation: json["animation"],
        language: json["language"],
        speech: json["speech"],
        voice: json["voice"],
        voiceType: json["voiceType"],
        voiceProvider: json["voiceProvider"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "canvas": canvas?.toJson(),
        "avatar": avatar?.toJson(),
        "animation": animation,
        "language": language,
        "speech": speech,
        "voice": voice,
        "voiceType": voiceType,
        "voiceProvider": voiceProvider,
      };
}

///[Avatar] data class is object class
/// [id] that contain String value id of avatar image
/// [version] is contain upadted or latest version
/// [name] ,[gender],[canvas] is contains String values
class Avatar {
  String? id;
  int? version;
  String? name;
  String? gender;
  String? canvas;

  ///This is constructor of [Avatar]
  Avatar({
    this.id,
    this.version,
    this.name,
    this.gender,
    this.canvas,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        id: json["id"],
        version: json["version"],
        name: json["name"],
        gender: json["gender"],
        canvas: json["canvas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "name": name,
        "gender": gender,
        "canvas": canvas,
      };
}

///[Canvas] data class is object class
/// [objects] is a list of items
/// [background] is contain background color
/// [version] is contains String values
class Canvas {
  List<Object>? objects;
  String? background;
  String? version;

  ///This is constructor of [Canvas]
  Canvas({
    this.objects,
    this.background,
    this.version,
  });

  factory Canvas.fromJson(Map<String, dynamic> json) => Canvas(
        objects: json["objects"] == null
            ? []
            : List<Object>.from(
                json["objects"]!.map((x) => Object.fromJson(x))),
        background: json["background"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "objects": objects == null
            ? []
            : List<dynamic>.from(objects!.map((x) => x.toJson())),
        "background": background,
        "version": version,
      };
}

///[Avatar] data class is object class
/// [type] that contain String value type of avatar image
/// [version] is contain upadted or latest version
/// [left],[scaleX],[scaleY] is double value used to alignment of image
/// [fill], [src], [avatarType] contains string value
///[animation] Contains object values
class Object {
  String? type;
  int? version;
  double? left;
  int? top;
  String? fill;
  double? scaleX;
  double? scaleY;
  String? src;
  String? avatarType;
  Animation? animation;

  ///This is constructor of [Object]
  Object({
    this.type,
    this.version,
    this.left,
    this.top,
    this.fill,
    this.scaleX,
    this.scaleY,
    this.src,
    this.avatarType,
    this.animation,
  });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        type: json["type"],
        version: json["version"],
        left: json["left"]?.toDouble(),
        top: json["top"],
        fill: json["fill"],
        scaleX: json["scaleX"]?.toDouble(),
        scaleY: json["scaleY"]?.toDouble(),
        src: json["src"],
        avatarType: json["avatarType"],
        animation: json["animation"] == null
            ? null
            : Animation.fromJson(json["animation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "version": version,
        "left": left,
        "top": top,
        "fill": fill,
        "scaleX": scaleX,
        "scaleY": scaleY,
        "src": src,
        "avatarType": avatarType,
        "animation": animation?.toJson(),
      };
}

///[Animation] data class is object class
///[type],[exitType] is contains dynamic value

class Animation {
  dynamic type;
  dynamic exitType;

  ///This is constructor of [Animation]
  Animation({
    this.type,
    this.exitType,
  });

  factory Animation.fromJson(Map<String, dynamic> json) => Animation(
        type: json["type"],
        exitType: json["exitType"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "exitType": exitType,
      };
}
