
import 'human_avatar_platform_interface.dart';
import 'models/AvatarData.dart';
import 'models/CreateVideoAvatarData.dart';

class HumanAvatar {
  ///Used to create image Avatar
  Future<AvatarData?> createAvatar(
  {required String secretKey, ///required secret key you can get from Elai.
    required  String gender,
    required  String photoName,
    required   String photoData} ){
    return HumanAvatarPlatform.instance.createAvatar(secretKey, gender, photoName, photoData);
  }

  /// Used to create text to speech video from avatar
  Future<CreateVideoAvatarData?>createVideoAvatar({
    required String secretKey,///required secret key you can get from Elai.
    required String imageUrl,
    required String speechText,
    required String gender,
      String? avatarName,///avatar name is optional
      String? videoName,/// video name is optional param
    required  String avatarId,
    required Null Function(CreateVideoAvatarData value) onRender,
  }) {
    return HumanAvatarPlatform.instance.createVideoAvatar(
        secretKey,
        imageUrl,
        speechText,
        gender,
        avatarName??'',
        videoName??"My Video",
        avatarId,
        onRender);
  }




  /// Used to retrieve all videos from Elai.
  Future<String?>retrieveAllVideos({required String secretKey,String? page="1",String? limit="50"}){
    return HumanAvatarPlatform.instance.retrieveAllVideos(secretKey,page,limit);
  }







}
