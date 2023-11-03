import 'dart:async';
import 'dart:convert';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'human_avatar_method_channel.dart';
import 'package:http/http.dart' as http;

import 'models/AvatarData.dart';
import 'models/CreateVideoAvatarData.dart';


abstract class HumanAvatarPlatform extends PlatformInterface {
  /// Constructs a HumanAvatarPlatform.
  HumanAvatarPlatform() : super(token: _token);

  static final Object _token = Object();

  static HumanAvatarPlatform _instance = MethodChannelHumanAvatar();

  /// The default instance of [HumanAvatarPlatform] to use.
  ///
  /// Defaults to [MethodChannelHumanAvatar].
  static HumanAvatarPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HumanAvatarPlatform] when
  /// they register themselves.
  static set instance(HumanAvatarPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ///this is for create [human_avatar] Avatar.
  Future<AvatarData?>createAvatar(
      String secretKey,
      String gender,
      String photoName,
      String photoData  ) async {
    try{
      var url = Uri.parse('https://apis.elai.io/api/v1/avatars');
      var headers = {
        'Authorization': 'Bearer $secretKey', ///Here is Api Header
        'accept': 'application/json',
        'content-type': 'application/json',
      };
      ///Here is Api body
      var body = jsonEncode({
        "gender": gender,
        "image": {
          "name": photoName,
          "data": photoData
        }
      });
      ///Here is Api add request .....
      var response = await http.post(url, headers: headers, body: body);
      ///Here is Api response check error or success
      if (response.statusCode == 200) {
        return AvatarData.fromJson(jsonDecode(response.body));///handle json response data class
      } else {
        return null;
      }
    }catch(e){
      return null;
    }
  }



  ///this is api implementation for create [human_avatar] Video avatar
 Future<CreateVideoAvatarData?> createVideoAvatar(
      String secretKey,
      String imageUrl,
      String speechText,
      String gender,
      String avatarName,
      String videoName,
      String avatarId,
      Null Function(CreateVideoAvatarData value) onRender) async {
    try {
      final url = Uri.parse('https://apis.elai.io/api/v1/videos');///Here is Api base Url [human_avatar] create video
      ///Here is Api Header [human_avatar] create video
      final headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/json',
      };
      ///Here is Api body [human_avatar] create video
      final data = {
        "name": videoName,
        "slides": [
          {
            "id": 1,
            "canvas": {
              "objects": [
                {
                  "type": "avatar",
                  "version": 2,
                  "left": 151.5,
                  "top": 36,
                  "fill": "#4868FF",
                  "scaleX": 0.3,
                  "scaleY": 0.3,
                  "src": imageUrl,
                  "avatarType": "transparent",
                  "animation": {
                    "type": null,
                    "exitType": null,
                  },
                },
              ],
              "background": "#ffffff",
              "version": "4.4.0",
            },
            "avatar": {
              "id": avatarId,
              "version": 2,
              "name": avatarName,
              "gender": gender,
              "canvas": imageUrl,
            },
            "animation": "fade_in",
            "language": "English",
            "speech": speechText,
            "voice": "en-US-AriaNeural",
            "voiceType": "text",
            "voiceProvider": "azure",
          }
        ],
        "tags": ["test"],
      };
      ///Here is Api add request [human_avatar] create video
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var res=  CreateVideoAvatarData.fromJson(jsonDecode(response.body));///handle json response data class
       var result= await renderVideoAvatar(secretKey,res.id??'',onRender);
       if(result!=null){
         return result;
       }else{
         return null;
       }
      } else {
        return null;
      }
    }catch(e){
      return null;
    }
  }




  ///this is api implementation for render [human_avatar] Video avatar by its id
 Future<CreateVideoAvatarData?> renderVideoAvatar(
     String secretKey,
     String videoId,
     Null Function(CreateVideoAvatarData value) onRender) async {
    try {
      final url = Uri.parse(
          'https://apis.elai.io/api/v1/videos/render/$videoId');///Here is Api base Url [human_avatar] render video
      ///Here is Api header [human_avatar] render video
      final headers = {
        'Authorization': 'Bearer $secretKey',
        'accept': 'application/json',
      };
      ///Here is Api add request [human_avatar] render video
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {

       var res= await retrieveVideoAvatar(secretKey,videoId,onRender);///Calling function retrieve video Avatar on render success
       if(res!=null){
         return res;
       }else{
         return null;
       }

      } else {
        return null;
      }
    }catch(e){
      return null;
    }
  }

  ///this is api implementation for retrieve  Video avatar by its id
 Future<CreateVideoAvatarData?> retrieveVideoAvatar(
     String secretKey,
     String videoId,
     Null Function(CreateVideoAvatarData value) onRender) async {
    try {
      //retrieve video base url with append video Id
      final url = Uri.parse(
          'https://apis.elai.io/api/v1/videos/$videoId');
      ///retrieve video header
      final headers = {
        'Authorization': 'Bearer $secretKey',
        'accept': 'application/json',
      };

      Future.delayed(const Duration(seconds: 20),() async {
        final response = await http.get(url, headers: headers);
        if (response.statusCode == 200) {
          var res=CreateVideoAvatarData.fromJson(jsonDecode(response.body));
          if(res.status=="rendering"){
            retrieveVideoAvatar( secretKey, videoId,onRender);
          }else{
            onRender.call(res);
            return res;
          }
        } else {
          return null;
        }
      });
    }catch(e){
      return null;
    }
    return null;
  }


  ///this is api implementation for get all [human_avatar] Video avatar list
  Future<String?>retrieveAllVideos(String secretKey, String? page, String? limit) async {
    try {
      /// Here is base url retrieve all videos with pagination
      final url = Uri.parse(
          'https://apis.elai.io/api/v1/videos?page=$page&limit=$limit');
      ///Add Header
      final headers = {
        'Authorization': 'Bearer $secretKey',
        'accept': 'application/json',
      };

      ///Here is Add request
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    }catch(e){
      return null;
    }
  }

}
